use temple
go
/*Examenes de 3 evaluaci�n*/
/*base de datos temple*/

--Ejercicio primero
/*1.- En la fiesta de los Reyes Magos se desea organizar un espect�culo para los hijos de los empleados, 
que se representar� en dos d�as diferentes. El 5 de enero asistir�n los empleados cuyo apellido comienza entre la A
y la L, ambas inclusive. El 6 de enero se representar� para el resto. Las invitaciones se pueden retirar a primero 
de a�o, es decir a partir del d�a 1 de enero,apareciendo, el nombre del empleado, tantas invitaciones como hijos 
tenga, mas dos, tantos regalos como hijos 
tenga y la fecha. Cada empleado, retirar� sus invitaciones.  Por ejemplo, las de este a�o, hubieran sido:
*/
alter view reyes_magos as
select numem,nombre,numhi+2 invitaciones, numhi regalos, 
datename(dw,'5/1/'+DATENAME(yy,getdate()))+' '+'5/1/'+DATENAME(yy,getdate()) fecha
from temple t
where NOMBRE between 'a' and 'm' and numhi!=0
union
select numem,nombre,numhi+2 invitaciones, numhi regalos, datename(dw,'6/1/'+DATENAME(yy,getdate()))+' '+
'6/1/'+DATENAME(yy,getdate()) fecha
from temple t
where NOMBRE between 'm' and 'z' and numhi!=0 or NOMBRE like 'z%'

--grant select on reyes_magos to public
select * from reyes_magos


/*2.- Construye una funci�n o varias funciones, en la cual el  empleado introducir� su n�mero de empleado y le devolver�:
si el n�mero no existe, un mensaje.

si las fechas actual no est� comprendida entre los dias 1/1/a�o_en_curso y el d�a 5/1/a�oencurso, se mostrar� que
las invitaciones no se pueden retirar.

si no tiene hijos, otro mensajeen otro caso, un literal con las invitaciones correspondientes

Debes modular con funciones cada una de las opciones.*/

/*create function FnValidaEmpleado(@numem char(3)) returns int
as 
begin
declare @retorno char(3)=1
if exists (select * from temple where numem=@numem) set @retorno=0
return @retorno
end*/

--select dbo.FnValidaEmpleado(181)

/*alter function fnPlazoRetirada() returns int
as
begin
declare @plazo int=1
if getdate() between '1/1/'+datename(yy,getdate()) and '5/1/'+datename(yy,getdate()) set @plazo=0
return @plazo
end*/

--select dbo.fnPlazoRetirada()

/*create function fntienehijos(@numem char(3)) returns int
as
begin
declare @retorno int =1
if exists (select * from temple where @numem=numem and numhi!=0) set @retorno=0
return @retorno
end

select dbo.fntienehijos(150) */

alter function fnEntradasReyes(@numem char(3)) returns varchar(100)
as
begin
declare @retorno varchar(100)
declare @nombre varchar(20)
declare @invitaciones char(2)
declare @regalos char(2)
declare @fecha varchar(40)
if dbo.FnValidaEmpleado(@numem)=1 set @retorno='El empleado '+@numem+' no existe'
   else
       if dbo.fnPlazoRetirada()=1 set @retorno='El plazo de retirada no est� abierto'
	      else if dbo.fntienehijos(@numem)=1 set @retorno='No est�s invitado.No tienes hijos'
		          else begin
				       select @nombre=nombre,@invitaciones=invitaciones,@regalos=regalos,@fecha=fecha
				       from reyes_magos
					   where numem=@numem
					   set @retorno=@nombre+' '+'dispone de '+ @invitaciones +' invitaciones '+
									@regalos+' regalos, el '+@fecha

					   end
return @retorno
end

select dbo.fnEntradasReyes(180)