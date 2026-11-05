-- Árbol González Hoyos: esquema, permisos y tiempo real.
-- Se aplica una sola vez en el proyecto de Supabase.

-- ---------- personas ----------
-- Mismos campos que la colección "personas" original (nombres en camelCase).
create table if not exists public.personas (
  id                text primary key default replace(gen_random_uuid()::text, '-', ''),
  nombre            text not null default '',
  apellido1         text not null default '',
  apellido2         text not null default '',
  sexo              text not null default '' check (sexo in ('', 'M', 'F')),
  pareja            text not null default '',
  nacimiento        text not null default '',
  "lugarNacimiento" text not null default '',
  defuncion         text not null default '',
  "lugarDefuncion"  text not null default '',
  padre             text not null default '',
  madre             text not null default '',
  notas             text not null default '',
  "agregadoPor"     text not null default '',
  "corregidoPor"    text not null default '',
  actualizado       timestamptz not null default now()
);

-- ---------- editores (correos aprobados) ----------
-- Quien entra por enlace mágico y no está aprobado queda aquí con aprobado = false.
-- Para aprobar a alguien: Table Editor → editores → marca "aprobado".
create table if not exists public.editores (
  email      text primary key check (email = lower(email)),
  nombre     text not null default '',
  aprobado   boolean not null default false,
  creado     timestamptz not null default now()
);

insert into public.editores (email, nombre, aprobado)
values ('diegohoyos8@gmail.com', 'Diego', true)
on conflict (email) do update set aprobado = true;

-- ¿El usuario con sesión es un editor aprobado?
create or replace function public.es_editor()
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.editores e
    where e.aprobado
      and e.email = lower(coalesce((select auth.jwt()) ->> 'email', ''))
  );
$$;
revoke all on function public.es_editor() from public;
grant execute on function public.es_editor() to anon, authenticated;

-- ---------- RLS ----------
alter table public.personas enable row level security;
alter table public.editores enable row level security;

-- Lectura: cualquiera con el enlace puede ver el árbol.
-- (Para exigir sesión, cambia "to anon, authenticated" por "to authenticated".)
drop policy if exists personas_leer on public.personas;
create policy personas_leer on public.personas
  for select to anon, authenticated using (true);

drop policy if exists personas_agregar on public.personas;
create policy personas_agregar on public.personas
  for insert to authenticated with check ((select public.es_editor()));

drop policy if exists personas_editar on public.personas;
create policy personas_editar on public.personas
  for update to authenticated
  using ((select public.es_editor())) with check ((select public.es_editor()));

drop policy if exists personas_borrar on public.personas;
create policy personas_borrar on public.personas
  for delete to authenticated using ((select public.es_editor()));

-- Cada quien ve solo su propia fila de editores y puede pedir acceso (sin aprobarse a sí mismo).
drop policy if exists editores_ver_propio on public.editores;
create policy editores_ver_propio on public.editores
  for select to authenticated
  using (email = lower(coalesce((select auth.jwt()) ->> 'email', '')));

drop policy if exists editores_solicitar on public.editores;
create policy editores_solicitar on public.editores
  for insert to authenticated
  with check (aprobado = false and email = lower(coalesce((select auth.jwt()) ->> 'email', '')));

-- ---------- tiempo real ----------
alter table public.personas replica identity full;
do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'personas'
  ) then
    alter publication supabase_realtime add table public.personas;
  end if;
end $$;
