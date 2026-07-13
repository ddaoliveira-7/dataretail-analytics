-- ============================================================
-- DATA RETAIL ANALYTICS
-- SQL JOINS
-- ============================================================


-- 1. Display the 5 highest-value delivered orders
-- with the responsible salesperson
SELECT
    p.id AS pedido_id,
    v.nome AS vendedor,
    v.regiao,
    p.valor_total,
    p.data_pedido
FROM pedidos p
INNER JOIN vendedores v
    ON p.vendedor_id = v.id
WHERE p.status = 'entregue'
ORDER BY p.valor_total DESC
LIMIT 5;


-- 2. Display the 10 most recent orders
-- with customer and salesperson information
SELECT
    p.id AS pedido_id,
    c.nome AS cliente,
    c.segmento,
    v.nome AS vendedor,
    p.valor_total,
    p.data_pedido
FROM pedidos p
INNER JOIN clientes c
    ON p.cliente_id = c.id
INNER JOIN vendedores v
    ON p.vendedor_id = v.id
ORDER BY p.data_pedido DESC
LIMIT 10;


-- 3. Display the items from order 67
SELECT
    pr.nome AS produto,
    pr.categoria,
    ip.quantidade,
    ip.preco_unitario,
    ip.quantidade * ip.preco_unitario AS subtotal
FROM itens_pedido ip
INNER JOIN produtos pr
    ON ip.produto_id = pr.id
WHERE ip.pedido_id = 67
ORDER BY subtotal DESC;


-- 4. Revenue by customer segment
-- considering delivered orders only
SELECT
    c.segmento,
    SUM(p.valor_total) AS faturamento_total
FROM pedidos p
INNER JOIN clientes c
    ON p.cliente_id = c.id
WHERE p.status = 'entregue'
GROUP BY c.segmento
ORDER BY faturamento_total DESC;


-- 5. Revenue by salesperson and region
SELECT
    v.nome AS vendedor,
    v.regiao,
    COUNT(p.id) AS total_pedidos,
    SUM(p.valor_total) AS faturamento
FROM pedidos p
INNER JOIN vendedores v
    ON p.vendedor_id = v.id
WHERE p.status = 'entregue'
GROUP BY
    v.id,
    v.nome,
    v.regiao
ORDER BY faturamento DESC;
