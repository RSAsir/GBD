-- Nos permite conocer las tablas de una BBDD.
sp_tables @table_owner='dbo';

-- Conocer tipo de datos de una tabla.
sp_columns nombre_tabla

-- De quien depende un objeto.
sp_depends nombre_objeto

-- Muestra el texto de creacion de un objeto (en caso de existir)
sp_helptext nombre