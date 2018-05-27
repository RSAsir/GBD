/*¿cuantos pedidos ha realizado cada estanco en el mes de Enero de este año? Obtener el nombre del estanco, ciudad y la cantidad.
Si no ha realizado ninguno saldrá como valor 0.Ten en cuenta que los nombres de los estancos se repiten de una ciudad a otra y son distintas*/

--hecho en el examen
select nombre,ciudad,(select isnull(count(cant_comprada),0)
                      from compras
					  where e.nif=nif and month(fecha_compra)=(01) and year(fecha_compra)=year(getdate())) pedidos_realizados
from estanco e


--corregido por laly
select nombre,ciudad,(select count(*)
                      from compras
					  where nif=e.nif and month(fecha_compra)=1 and year(fecha_compra)=year(getdate())) compras_realizadas
from estanco e

--inner join - no funciona
select nombre,ciudad,count(*) compras_realizadas
from estanco e inner join compras c on(e.nif=c.nif)
where month(fecha_compra)=1 and year(fecha_compra)=year(getdate())
group by nombre,ciudad

