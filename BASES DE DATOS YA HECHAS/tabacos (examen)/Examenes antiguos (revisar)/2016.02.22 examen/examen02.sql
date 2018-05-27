/*¿cuantas unidades de tabaco de la marca Camel tiene en el almacen el estanco "La Pajarita" de Cáceres? Si no hay ninguna aparecerá 0.
Y ocurre lo mismo que en el ejercicio anterior*/

--hecho en el examen
select e.nif,nombre estanco,expendiduria,nombre_marca,sum(unidades) unidades_almacen
from estanco e left join almacen a on(e.nif=a.nif) inner join cigarrillo c on(a.cod_fab=c.cod_fab and a.cod_marca=c.cod_marca)
where nombre_marca='camel' and expendiduria='1'
group by e.nif,nombre,expendiduria,nombre_marca


--corregido por laly (inner join)
select isnull(sum(unidades),0) "total unidades de camel"
from estanco e inner join almacen a on a.nif=e.nif left join cigarrillo c on c.cod_fab=a.cod_fab and c.cod_marca=a.cod_marca
where nombre='la pajarita' and ciudad='caceres' and nombre_marca='camel'


--corregido por laly (cruzado)
select isnull(sum(unidades),0) "total unidades camel"
from almacen a
where nif in (select nif
             from estanco
			 where nombre='la pajarita' and ciudad='caceres') and cod_fab in (select cod_fab
			                                                                  from cigarrillo
																			  where a.cod_marca=cod_marca and nombre_marca='camel')
