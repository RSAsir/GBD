/*Recuperar el numero de marcas de tabaco que tiene cada fabricante en el mercado.
Si no tuviera ninguna, el mensaje será "no hay ninguno". Se mostrará el nombre de la marca y la cantidad*/

select nombre,isnull(cast(count(nombre_marca) as char(14)), 'no hay nadie') cantidad_de_marcas
from cigarrillo c right join fabricantes f on(c.cod_fab=f.cod_fab)
group by nombre