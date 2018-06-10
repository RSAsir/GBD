-- Nos permite conocer las tablas de una BBDD.
sp_tables @table_owner='dbo';

-- Conocer tipo de datos de una tabla.
sp_columns nombre_tabla

-- De quien depende un objeto.
sp_depends nombre_objeto