-- 1) - Crie um select que exiba a quantidade de exemplares 'SQL para leigos'
SELECT titulo, qtde from livros where titulo like '%SQL para leigos%';

-- 2) - Cria um select que retorne todas as editoras que publicaram 
-- o exemplar Aprendendo Banco de Dados na SAPIENS
SELECT nome, gerente from editora where id_livro = 1;

-- 3) - Realizar um select que retorne todos os clientes do tipo 'Pessoa Juridica' que realizaram compras
SELECT nome, gerente from cliente where cnpj is not null and tipo = 'J';

-- Desafio: para essa questão pesquisar sobre inner join
-- 4) - Realizar um select que retorne todos os clientes que compraram o exemplar Aprendendo Banco de Dado na SAPIENS */
SELECT c.* from cliente c 
	inner join compra c2 on (c.id_cliente = c2.id_cliente) 
	inner join livros l on (c2.id_livro = l.id_livro ) 
	where l.titulo like '%Aprendendo Banco de Dado na SAPIENS%' ;