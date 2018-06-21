use temple
go
/*examen de 3 evaluación*/
/*base de datos temple*/
alter view fiesta65 as
select numem,nombre,(select dnombre from TDEPTO where numde=e.numde) departamento,2 invitaciones,
(select 10*(count(*)-1) from temple where numde=e.numde) regalo,
datename(dw,'22/12/'+DATENAME(yy,getdate()))+' '+'22/12/'+datename(yy,getdate()) fecha
from temple e
where year(getdate())-year(fecha_nac)>=65

--funciones
create function FnValidaEmpleado(@numem char(3)) returns int
as 
begin
declare @retorno char(3)=1
if exists (select * from temple where numem=@numem) set @retorno=0
return @retorno
end

--select dbo.FnValidaEmpleado(181)

alter function fnPlazoRetirada65() returns int
as
begin
declare @plazo int=1
if getdate() between '1/12/'+datename(yy,getdate()) and '21/12/'+datename(yy,getdate()) set @plazo=0
return @plazo
end

select dbo.fnPlazoRetirada65()

alter function fnFiestaNavidad(@numem char(3)) returns varchar(140) as

begin
declare @retorno varchar(140)
declare @nombre varchar(20)
declare @departamento varchar(20)
declare @regalo varchar(2)
declare @fecha varchar(40)

if dbo.FnValidaEmpleado(@numem)=1 set @retorno='Empleado incorrecto'
   else if dbo.fnPlazoRetirada65()=1 set @retorno='Aún no está el plazo de retirada de invitaciones abierto'
   else if not exists(select * from fiesta65 where numem=@numem) set @retorno='no es un homenajeado, es menor de 65 años'
        else begin
		      select @nombre=nombre,@departamento=departamento,@regalo=regalo,@fecha=fecha
			  from fiesta65 where numem=@numem
			  set @retorno=@nombre+' del departamento '+@departamento+ ' está invitado, a una fiesta,el '+@fecha+' y recibirá un regalo de '+@regalo+'€'+ ' y 2 invitaciones'
			 end
return @retorno
end

select dbo.fnFiestaNavidad(110)
select * from fiesta65 where numem=110
select * from temple where year(getdate())-year(FECHA_NAC)<65