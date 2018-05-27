/*cuantos cigarrillos ha vendido cada fabricante en lo que va de año (año actual)
(si no hubiera vendido alguno,deberá aparecer como cantidad vendida 0. Obtener el nombre del fabricante y la cantidad vendida*/

--hecho en el examen
select nombre nombre_fabricante,isnull(sum(cant_vendida),0) cantidad_vendida
from ventas v right join fabricantes f on(v.cod_fab=f.cod_fab)
where year(getdate())=year(fecha_venta)
group by nombre
order by 2


--corregido por laly (right join)
select nombre,isnull(sum(cant_vendida),0) cantidad_vendida
from ventas v right join fabricantes f on v.cod_fab=f.cod_fab
where year(fecha_venta)=year(getdate()) or fecha_venta is null
group by nombre


--corregido por laly (cruzado)
select nombre,(select isnull(sum(cant_vendida),0)
               from ventas
			   where cod_fab=f.cod_fab and year(fecha_venta)=year(getdate()))cantidad_vendida
from fabricantes f


--corregido por laly (menos común)
select nombre,isnull(cantidad_vendida,0) cantidad_vendida
from (select cod_fab,sum(cant_vendida) cantidad_vendida
      from ventas
	  where year(getdate())=year(fecha_venta)
	  group by cod_fab)v
right join fabricantes f on v.cod_fab=f.cod_fab