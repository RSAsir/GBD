/*Obtener el tábaco más bajo en nicotina. Se mostrará nombre de la marca, filtro, color, clase y mentol*/

select top 2 nicotina,nombre_marca,filtro,color,clase,mentol
from tipo_cigarrillo t inner join cigarrillo c on(t.cod_fab=c.cod_fab and t.cod_marca=c.cod_marca)
group by nicotina,nombre_marca,filtro,color,clase,mentol
order by 1