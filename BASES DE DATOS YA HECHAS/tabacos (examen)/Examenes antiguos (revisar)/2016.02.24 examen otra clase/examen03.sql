/*A cuanto asciende la suma de cantidades de tabaco vendidas, en cada uno de los estancos, en el mes de enero del año en curso
(no 2016, el año que estemos). Deben salir todos los estancos, si no hubieran vendido nada el valor será 0.
Obtener el cif de estanco, su nombre y la suma de sus ventas*/

select e.nif cif,nombre,isnull(sum(cant_vendida),0) cantidad_vendida
from estanco e left join ventas v on(e.nif=v.nif)
where month(fecha_venta)=(01) and year(fecha_venta)=year(getdate())
group by e.nif,nombre