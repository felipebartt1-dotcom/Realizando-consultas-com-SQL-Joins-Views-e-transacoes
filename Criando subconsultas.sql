-- ===============================================================
-- 1) Consultas Simples
-- ===============================================================

-- Seleciona todos os registros da tabela colaboradores
SELECT * FROM colaboradores;

-- Seleciona todos os registros da tabela fornecedores
SELECT * FROM fornecedores;

-- Busca apenas os endereços dos colaboradores
SELECT rua, bairro, cidade, estado, cep FROM colaboradores;

-- Busca apenas os endereços dos fornecedores
SELECT rua, bairro, cidade, estado, cep FROM fornecedores;

-- Consulta específica de colaboradores por endereço
SELECT * FROM colaboradores WHERE rua = 'Rua das flores - 210';

-- ===============================================================
-- 2) União de Resultados (UNION e UNION ALL)
-- ===============================================================

-- Une endereços de colaboradores e fornecedores, eliminando duplicatas
SELECT rua, bairro, cidade, estado, cep FROM colaboradores
UNION 
SELECT rua, bairro, cidade, estado, cep FROM fornecedores;

-- Une endereços de colaboradores e fornecedores, mantendo duplicatas
SELECT rua, bairro, cidade, estado, cep FROM colaboradores
UNION ALL
SELECT rua, bairro, cidade, estado, cep FROM fornecedores;

-- Une nomes e endereços de colaboradores e fornecedores, mantendo duplicatas
SELECT nome, rua, bairro, cidade, estado, cep FROM colaboradores
UNION ALL
SELECT nome, rua, bairro, cidade, estado, cep FROM fornecedores;

-- ===============================================================
-- 3) Subconsultas Simples
-- ===============================================================

-- Seleciona todos os clientes
SELECT * FROM clientes;

-- Seleciona todos os pedidos
SELECT * FROM pedidos;

-- Busca o id do cliente de um pedido específico
SELECT idcliente FROM pedidos WHERE datahorapedido = '2023-01-02 08:15:00';

-- Seleciona o nome e telefone do cliente responsável pelo pedido específico
SELECT nome, telefone
FROM clientes
WHERE id = (SELECT idcliente FROM pedidos WHERE datahorapedido = '2023-01-02 08:15:00');

-- ===============================================================
-- 4) Subconsultas com IN
-- ===============================================================

-- Seleciona nomes de clientes que realizaram pedidos no mês de janeiro
SELECT nome
FROM clientes
WHERE id IN (
    SELECT idcliente
    FROM pedidos
    WHERE strftime('%m', datahorapedido) = '01'
);

-- ===============================================================
-- 5) Subconsultas com HAVING
-- ===============================================================

-- Seleciona todos os produtos
SELECT * FROM produtos;

-- Calcula o preço médio dos produtos
SELECT AVG(preco) FROM produtos;

-- Seleciona produtos com preço acima da média
SELECT nome, preco
FROM produtos
GROUP BY nome, preco
HAVING preco > (SELECT AVG(preco) FROM produtos);
