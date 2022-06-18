select 
c.cliente_nome as 'cliente',
mo.modelo_desc as 'modelo',
m.marca_desc as 'marca'
from cliente c, locacao lo, automovel auto, marca m, modelo mo
where c.cliente_cod = lo.cliente_cod
and lo.auto_cod = auto.auto_cod 
and auto.marca_cod = m.marca_cod 
and auto.modelo_cod  = mo.modelo_cod  
ORDER by c.cliente_nome ASC
-- group by c.cliente_nome 
-- GROUP by m.marca_desc
 










