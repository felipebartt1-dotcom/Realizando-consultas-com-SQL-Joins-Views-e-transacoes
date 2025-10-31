-- ===============================================================
-- MÃO NA MASSA: HORA DA PRÁTICA
-- ===============================================================


-- ===============================================================
-- 1. Traga todos os dados da cliente Maria Silva.
-- ===============================================================
SELECT *
FROM Clientes
WHERE Nome = 'Maria Silva';


-- ===============================================================
-- 2. Busque o ID do pedido e o ID do cliente dos pedidos onde o status esteja como concluído.
-- ===============================================================
SELECT 
    P.ID AS ID_Pedido, 
    C.ID AS ID_Cliente,
    P.Status
FROM Pedidos AS P
JOIN Clientes AS C ON P.IDCliente = C.ID
WHERE P.Status = 'Concluído';


-- ===============================================================
-- 3. Retorne todos os produtos onde o preço seja maior que 10 e menor que 15.
-- ===============================================================
SELECT *
FROM Produtos
WHERE Preco > 10 AND Preco < 15;


-- ===============================================================
-- 4. Busque o nome e cargo dos colaboradores que foram contratados entre 2022-01-01 e 2022-06-30.
-- ===============================================================
SELECT Nome, Cargo, DataContratacao
FROM Colaboradores
WHERE DataContratacao >= '2022-01-01' 
  AND DataContratacao <= '2022-06-30';


-- ===============================================================
-- 5. Recupere o nome do cliente que fez o primeiro pedido.
-- ===============================================================
SELECT 
    C.Nome AS NomeCliente,
    P.ID AS ID_Pedido,
    P.DataHoraPedido
FROM Pedidos AS P
JOIN Clientes AS C ON P.IDCliente = C.ID
ORDER BY P.DataHoraPedido ASC
LIMIT 1;


-- ===============================================================
-- 6. Liste os produtos que nunca foram pedidos.
-- ===============================================================
SELECT Nome
FROM Produtos
WHERE ID NOT IN (
    SELECT IDProduto
    FROM ItensPedido
);


-- ===============================================================
-- 7. Liste os nomes dos clientes que fizeram pedidos entre 2023-01-01 e 2023-12-31.
-- ===============================================================
SELECT DISTINCT C.Nome
FROM Clientes AS C
WHERE C.ID IN (
    SELECT P.IDCliente
    FROM Pedidos AS P
    WHERE P.DataHoraPedido BETWEEN '2023-01-01' AND '2023-12-31'
);


-- ===============================================================
-- 8. Recupere os nomes dos produtos que estão em menos de 15 pedidos.
-- ===============================================================
SELECT P.Nome
FROM Produtos AS P
INNER JOIN ItensPedido AS IP ON P.ID = IP.IDProduto
GROUP BY P.Nome
HAVING COUNT(IP.IDPedido) < 15;


-- ===============================================================
-- 9. Liste os produtos e o ID do pedido que foram realizados pelos clientes "Pedro Alves" ou "Ana Rodrigues".
-- ===============================================================
SELECT P.Nome, IP.IDPedido
FROM Produtos AS P
INNER JOIN ItensPedido AS IP ON P.ID = IP.IDProduto
INNER JOIN Pedidos AS PD ON IP.IDPedido = PD.ID
INNER JOIN Clientes AS C ON PD.IDCliente = C.ID
WHERE C.Nome IN ('Pedro Alves', 'Ana Rodrigues');


-- ===============================================================
-- 10. Recupere o nome e o ID do cliente que mais comprou (valor total) no Serenatto.
-- ===============================================================
SELECT 
    P.IDCliente, 
    C.Nome, 
    SUM(IP.Quantidade * IP.PrecoUnitario) AS ValorTotal
FROM Clientes AS C
INNER JOIN Pedidos AS P ON C.ID = P.IDCliente
INNER JOIN ItensPedido AS IP ON P.ID = IP.IDPedido
GROUP BY P.IDCliente
ORDER BY ValorTotal DESC
LIMIT 1;
