-- ============================================================
-- DATA RETAIL ANALYTICS
-- BASIC SQL QUERIES
-- ============================================================


-- 1. Display all orders
SELECT *
FROM pedidos;


-- 2. Display the 5 most recent orders
SELECT
    id,
    data_pedido,
    valor_total,
    status,
    forma_pagamento
FROM pedidos
ORDER BY data_pedido DESC
LIMIT 5;


-- 3. Display the 5 highest-value cancelled orders
SELECT
    id,
    data_pedido,
    valor_total,
    forma_pagamento
FROM pedidos
WHERE status = 'cancelado'
ORDER BY valor_total DESC
LIMIT 5;


-- 4. Display smartphones ordered by highest price
SELECT
    nome,
    preco,
    estoque
FROM produtos
WHERE categoria = 'smartphones'
ORDER BY preco DESC;


-- 5. Display delivered orders
SELECT
    id,
    data_pedido,
    valor_total,
    forma_pagamento
FROM pedidos
WHERE status = 'entregue'
ORDER BY data_pedido DESC;


-- 6. Display products with low inventory
SELECT
    nome,
    categoria,
    preco,
    estoque
FROM produtos
WHERE estoque < 10
ORDER BY estoque ASC;


-- 7. Display orders above the average order value
SELECT
    id,
    data_pedido,
    valor_total,
    status
FROM pedidos
WHERE valor_total > (
    SELECT AVG(valor_total)
    FROM pedidos
)
ORDER BY valor_total DESC;
