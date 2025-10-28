-- ===============================================================
-- 1) INNER JOIN
-- ===============================================================
-- Retorna linhas com correspondência entre as tabelas.
-- Combina "Pedidos" e "Clientes" para mostrar pedidos e seus clientes.
-- ===============================================================

SELECT p.ID, c.Nome
FROM Pedidos p
INNER JOIN Clientes c
ON p.IDCliente = c.ID;


-- ===============================================================
-- 2) RIGHT JOIN
-- ===============================================================
-- Retorna todas as linhas da tabela da direita e as correspondentes da esquerda.
-- Mostra todos os "Produtos" que aparecem em "ItensPedidos".
-- ===============================================================

SELECT DISTINCT p.Nome
FROM ItensPedidos ip
RIGHT JOIN Produtos p
ON p.ID = ip.IDProduto;


-- ===============================================================
-- 3) LEFT JOIN
-- ===============================================================
-- Retorna todas as linhas da tabela da esquerda e as correspondentes da direita.
-- Mostra todos os "Clientes" com ou sem pedidos.
-- ===============================================================

SELECT c.Nome
FROM Clientes c
LEFT JOIN Pedidos p
ON c.ID = p.IDCliente;


-- ===============================================================
-- 4) FULL JOIN
-- ===============================================================
-- Retorna todas as linhas de ambas as tabelas, com ou sem correspondência.
-- Exibe todos os "Clientes" e seus "Pedidos", existam ou não.
-- ===============================================================

SELECT DISTINCT c.Nome, p.IDCliente 
FROM Clientes c
FULL JOIN Pedidos p
ON c.ID = p.IDCliente;
