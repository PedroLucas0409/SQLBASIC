-- AULA1:

-- Exemplo 1. Selecionando todas as linhas e colulas
-- a) tabela pedidos
SELECT * FROM pedidos;

-- b) tabela clientes
SELECT * FROM clientes;

-- EXEMPLO 2. Selecionar apenas algumas colunas da tabela
SELECT 
	ID_CLIENTE AS 'ID Cliente',
    Nome AS 'Nome do Cliente', 
    Data_Nascimento AS 'Data de Nascimento', 
    Email As 'E-mail do Cliente' 
FROM clientes;


-- EXEMPLO 3. SELECIONAR APENAS AS 5 PRIMEIRAS LINHAS DA TABELA
SELECT * FROM produtos
LIMIT 10; 


-- EXEMPLO 4. SELECIONAR TODAS AS LINHAS DA TABELA produtos
-- ordenando pela coluna Preco_Unit
SELECT * FROM produtos
ORDER BY Preco_Unit DESC;


-- AULA2:

-- EXEMPLO 5. Filtrando com WHERE, Preco_Unit. Utilizando =, <, >, <=, >=, <>
SELECT *
FROM produtos
WHERE Preco_Unit >= 1800;



-- EXEMPLO 6. Filtrando com WHERE, produtos da marca 'DELL'
SELECT *
FROM produtos
WHERE Marca_Produto = 'DELL';



-- EXEMPLO 7. Filtrando com WHERE, produtos vendidos em determinada data.
SELECT *
FROM pedidos
WHERE Data_venda = '2019-01-03';



-- EXEMPLO 8. . Filtrando com WHERE, apenas Clientes Solteiros do sexo Masculino.
SELECT *
FROM clientes
WHERE Estado_Civil = 'S' AND Sexo = 'M';



-- EXEMPLO 9. Apenas produtros da Marca DELL OU SAMSUNG.
SELECT *
FROM produtos
WHERE Marca_Produto = 'DELL' OR Marca_Produto = 'SAMSUNG';



-- AULA3: 
-- COUNT- CONTAGEM preenchida/ 
-- COUNT(*)- CONTAGEM quantidade de linhas da coluna
-- COUNT(DISTINCT)- CONTAGEM da quantidade distinta de determinada coisa
-- SUM- SOMA
-- AVG- MÉDIA
-- MIN- VALOR MÍNIMO
-- MAX- VALOR MÁXIMO


-- EXEMPLO 10. Contagem de Linhas preenchidas.
SELECT 
	COUNT(Telefone)
FROM clientes;

-- EXEMPLO 11. Contagem total de Linhas.
SELECT
	COUNT(*)
FROM clientes;

-- EXEMPLO 12. Contagem distintas de determinada coisa.
SELECT
	COUNT(DISTINCT Escolaridade)
FROM clientes;


-- EXEMPLO 13. Soma de toda coluna, no caso desta a Receita_venda.
-- (COLOCANDO "AS"  PARA A 'SOMA DE RECEITA')

SELECT 
	SUM(Receita_venda) AS 'Soma de Receita'
FROM pedidos;

-- EXEMPLO 14. Média de toda coluna, no caso desta a média da Receita_Venda.
-- (COLOCANDO "AS" PARA A 'MÉDIA DE RECEITA')

SELECT 
	AVG(Receita_Venda) AS 'Média de Receita'
FROM pedidos;

-- EXEMPLO 15. Mínimo de toda coluna, no caso desta o Mínimo da Receita_Venda.
-- (COLOCANDO "AS" PARA 'MENOR RECEITA')

SELECT 
	MIN(Receita_Venda) AS 'Menor Receita'
FROM pedidos;

-- EXEMPLO 16. Máximo de toda coluna, no caso desta o Máximo da Receita_venda.
-- (COLOCANDO "AS" PARA 'MAIOR RECEITA')

SELECT 
	MAX(Receita_Venda) AS 'Maior Receita'
FROM pedidos;

-- Exemplo 17. SELECT com todas as Funções, SUM, AVG, MIN e MAX.

SELECT
	SUM(Receita_venda) AS 'Soma de Receita',
	AVG(Receita_Venda) AS 'Média de Receita',
	MIN(Receita_Venda) AS 'Menor Receita',
	MAX(Receita_Venda) AS 'Maior Receita'
FROM pedidos;


-- AULA4: GROUP BY

-- EXEMPLO 18. Utilizando GROUP BY para criar uma consulta e descobrir o total de clientes por sexo.

SELECT 
	Sexo,
    COUNT(*) AS 'Qtd. Clientes'
FROM clientes
GROUP BY Sexo;

-- EXEMPLO 19. Consulta a tabela de produtos para retornar o total de produtos da marca.

SELECT
	Marca_Produto,
    COUNT(*) AS 'Qtd. Produtos'
FROM produtos
GROUP BY Marca_Produto;




-- EXEMPLO 20. Consulta à tabela de pedidos e descubra a Receita Total e Custo Total por ID_Loja.
SELECT * FROM pedidos;
SELECT
	ID_Loja,
	SUM(Receita_venda) AS 'Receita Total',
    SUM(Custo_Venda) AS 'Custo Total'
FROM pedidos
GROUP BY ID_Loja;


-- AULA5: INNER JOIN

-- EXEMPLO 1.Faça uma consulta que tenha com resultado todas as colunas da tabela de pedidos e as colunas Loja, Gerente e Telefone.

-- tabela a --> TABELA FATO = TABELA PEDIDOS
-- tabela b --> TABELA DIMENSÃO = TABELA LOJA

-- Chave Primária --> ID Loja
-- Chave Estrangeira --> ID Loja


SELECT 
	pedidos.*,
    lojas.Loja,
    lojas.Gerente,
    lojas.Telefone
FROM pedidos
INNER JOIN lojas
	ON pedidos.ID_Loja = lojas.ID_Loja;


