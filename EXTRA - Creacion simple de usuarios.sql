-- Crea el login GB con la contraseña especificada.
CREATE LOGIN GB   
    WITH PASSWORD = 'Password';  
GO  

-- Crea un usuario de base de datos con la informacion anterior.  
CREATE USER GB FOR LOGIN GB;  
GO