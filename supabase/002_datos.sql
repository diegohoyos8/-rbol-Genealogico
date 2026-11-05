-- Datos iniciales generados desde data/personas.json (conserva los ids).
insert into public.personas ("id", "nombre", "apellido1", "apellido2", "sexo", "pareja", "nacimiento", "lugarNacimiento", "defuncion", "lugarDefuncion", "padre", "madre", "notas", "agregadoPor", "corregidoPor", "actualizado") values
  ('3jd2f9i4lhjey7t1uoqn', 'Dolores', 'Hoyos', 'Godoy', 'F', '', '', '', '', '', 'bifcsrthooxiatbq018y', 'js7dn1hz22pjj8lyg0kt', '', '', '', '2026-11-05T00:22:01.914Z'::timestamptz),
  ('aezw6twfg9mybj829muy', 'German', 'Hoyos', 'Godoy', 'M', '', '', '', '', '', 'bifcsrthooxiatbq018y', 'js7dn1hz22pjj8lyg0kt', '', '', '', '2026-11-05T00:21:51.088Z'::timestamptz),
  ('bifcsrthooxiatbq018y', 'Gustavo', 'Hoyos', '', 'M', 'js7dn1hz22pjj8lyg0kt', '', '', '', '', '', '', '', '', '', '2026-11-05T00:21:06.838Z'::timestamptz),
  ('ezfois88qthtb1odt26w', 'Regina', 'Garza', '', 'F', 'q52ykoodyrad6any9dsb', '', '', '', '', '', '', '', '', '', '2026-11-05T00:23:29.688Z'::timestamptz),
  ('fkuk1ekcur4bx7esb2lx', 'Magdalena', 'Hoyos', 'Godoy', 'F', '', '', '', '', '', 'bifcsrthooxiatbq018y', 'js7dn1hz22pjj8lyg0kt', '', '', '', '2026-11-05T00:21:32.398Z'::timestamptz),
  ('hx6wg9btibgsch4ng7fu', 'Sofia', 'González', 'Garza', 'F', '', '', '', '', '', 'q52ykoodyrad6any9dsb', 'ezfois88qthtb1odt26w', '', '', '', '2026-11-05T00:24:57.302Z'::timestamptz),
  ('js7dn1hz22pjj8lyg0kt', 'Dolores', 'Godoy', 'Raigosa', 'F', 'bifcsrthooxiatbq018y', '', '', '', '', '', '', '', '', '', '2026-11-05T00:21:20.341Z'::timestamptz),
  ('mb7xn09a8s3pv09kn7ns', 'Gerardo', 'Hoyos', 'Godoy', 'M', '', '', '', '', '', 'bifcsrthooxiatbq018y', 'js7dn1hz22pjj8lyg0kt', '', '', '', '2026-11-05T00:21:40.158Z'::timestamptz),
  ('p-alanna', 'Alanna', 'España', 'Fernandez', 'F', 'p-diego', '', '', '', '', '', '', '', '', '', '2026-11-05T00:24:36.393Z'::timestamptz),
  ('p-diego', 'Diego', 'González', 'Hoyos', 'M', 'p-alanna', '', '', '', '', 'p-miguel', 'p-susana', '', '', '', '2026-11-05T00:20:00Z'::timestamptz),
  ('p-emilia', 'Emilia', 'González', '', 'F', '', '2026-10-19', '', '', '', 'p-diego', 'p-alanna', '', '', '', '2026-11-05T00:20:00Z'::timestamptz),
  ('p-miguel', 'Miguel Ángel', 'González', 'Salomón', 'M', 'p-susana', '', '', '', '', '', '', '', '', '', '2026-11-05T00:20:00Z'::timestamptz),
  ('p-susana', 'Susana', 'Hoyos', 'Godoy', 'F', 'p-miguel', '', '', '', '', 'bifcsrthooxiatbq018y', '', '', '', '', '2026-11-05T00:20:00Z'::timestamptz),
  ('q52ykoodyrad6any9dsb', 'Miguel Angel', 'González', 'Hoyos', 'M', 'ezfois88qthtb1odt26w', '', '', '', '', 'p-miguel', 'p-susana', '', '', '', '2026-11-05T00:22:36.189Z'::timestamptz),
  ('vm6uz46e9cwz8gy7dgbl', 'Gustavo', 'Hoyos', 'Godoy', 'M', '', '', '', '', '', 'bifcsrthooxiatbq018y', 'js7dn1hz22pjj8lyg0kt', '', '', '', '2026-11-05T00:21:46.323Z'::timestamptz),
  ('zty2ieodw4y3qc01o8yh', 'Alejandro', 'Hoyos', 'Godoy', 'M', '', '', '', '', '', 'bifcsrthooxiatbq018y', 'js7dn1hz22pjj8lyg0kt', '', '', '', '2026-11-05T00:22:20.670Z'::timestamptz),
  ('zw6012v9htfh4wkqh3au', 'Gabriel', 'Hoyos', 'Godoy', 'M', '', '', '', '', '', 'bifcsrthooxiatbq018y', 'js7dn1hz22pjj8lyg0kt', '', '', '', '2026-11-05T00:22:11.946Z'::timestamptz)
on conflict (id) do update set "nombre" = excluded."nombre", "apellido1" = excluded."apellido1", "apellido2" = excluded."apellido2", "sexo" = excluded."sexo", "pareja" = excluded."pareja", "nacimiento" = excluded."nacimiento", "lugarNacimiento" = excluded."lugarNacimiento", "defuncion" = excluded."defuncion", "lugarDefuncion" = excluded."lugarDefuncion", "padre" = excluded."padre", "madre" = excluded."madre", "notas" = excluded."notas", "agregadoPor" = excluded."agregadoPor", "corregidoPor" = excluded."corregidoPor", "actualizado" = excluded."actualizado";
