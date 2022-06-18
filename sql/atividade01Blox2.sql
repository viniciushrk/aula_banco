-- 1. Crie uma visão simples com o código, nome e endereço dos vendedores.

CREATE VIEW visaoSimples 
	AS 
	Select CDVENDEDOR,NMVENDEDOR, NMENDERECO FROM VENDEDOR;
-- 2. Mostre o conteúdo dessa visão.

SELECT * FROM  visaoSimples;

-- 3. Faça uma visão(view) que contenha o código, 
-- endereço e o preço de venda dos imóveis do bairro “Jardins”.
-- Dê-lhe o nome de vImovel_Bairro. - ok
CREATE VIEW vImovel_Bairro 
	AS 
	Select 
		I.NMENDERECO,
		I.VLPRECO  
	FROM IMOVEL AS I JOIN BAIRRO AS B ON (I.CDBAIRRO = B.CDBAIRRO)
	WHERE B.NMBAIRRO = 'Jardins';

SELECT * FROM  vImovel_Bairro;

-- 4. Faça uma visão que mostre o nome do vendedor,
-- o endereço, o bairro, a cidade e o Estado do Imóvel. 
-- Dê-lhe o nome de vImovel.

CREATE VIEW vImovel 
	AS 
	Select 
		NMVENDEDOR,
		NMENDERECO,
		NMBAIRRO,
		NMCIDADE,
		SGESTADO
	FROM VENDEDOR;

SELECT * FROM  vImovel;

-- 5. Faça uma visão com o preço médio de
-- venda dos imóveis agrupados por cidade. 
--  Dá-lhe o nome de vImovel_Cidade.
CREATE VIEW vImovel_Cidade 
	AS 
	Select 
		AVG(VLPRECO) AS PRECO_MEDIO
	FROM IMOVEL GROUP BY CDCIDADE;

SELECT * FROM  vImovel_Cidade;
-- 6. Faça uma visão com os nomes dos compradores, o valor de oferta e 
-- o endereço do imóvel. Não coloque nenhum código na visão. 
-- Dê-lhe o nome de vOferta.
CREATE VIEW vOferta 
	AS 
	Select 
		c.NMCOMPRADOR,
		o.VLOFERTA,
		i.NMENDERECO 
	FROM COMPRADOR AS c 
	JOIN OFERTA o ON c.CDCOMPRADOR = o.CDCOMPRADOR
	JOIN IMOVEL i ON o.CDIMOVEL = i.CDIMOVEL;


SELECT * FROM  vOferta;
 
-- 7. Faça uma visão que mostre o endereço de todos 
-- os imóveis da cidade de  “São Paulo ”.  
-- Dê-lhe o nome de vSP.
CREATE VIEW vSP 
	AS 
	Select 
		NMENDERECO FROM IMOVEL i
		JOIN CIDADE c ON c.CDCIDADE  = i.CDCIDADE
		WHERE c.NMCIDADE = 'SÃO PAULO'


SELECT * FROM  vSP;

-- 8. Faça uma visão que mostre a quantidade de imóveis do bairro “Castanheiras”. 
-- Dê-lhe o nome de vBairro.

CREATE VIEW vBairro 
	AS 
	Select 
		COUNT(i.CDIMOVEL) FROM IMOVEL i
		JOIN BAIRRO b ON i.CDBAIRRO  = b.CDBAIRRO
		WHERE b.NMBAIRRO = 'CASTANHEIRAS';


SELECT * FROM  vBairro;

-- 9.Faça uma visão que mostre o endereço e o maior valor de imóvel.
-- Dê-lhe o nome de     
CREATE VIEW vMaior_Preco AS
SELECT VLPRECO AS MAIOR,
NMENDERECO AS ENDERECO 
FROM IMOVEL
WHERE VLPRECO = (SELECT MAX(VLPRECO) FROM IMOVEL);
SELECT * FROM  vMaior_Preco;

-- 10.Faça uma visão que mostre o endereço completo(cidade, bairro e rua) 
-- e o menor valor de imóvel.
-- Dê-lhe o nome de vMenor_Preco.

CREATE VIEW vMenor_Preco AS
SELECT VLPRECO AS Menor,
I.NMENDERECO AS Rua,
B.NMBAIRRO AS Bairro,
C.NMCIDADE AS Cidade
FROM IMOVEL I INNER 
JOIN BAIRRO B 
ON I.CDBAIRRO = B.CDBAIRRO INNER
JOIN CIDADE C ON 
I.CDCIDADE = C.CDCIDADE
WHERE VLPRECO = (SELECT MIN(VLPRECO) FROM IMOVEL);


SELECT * FROM vMenor_Preco;

