-- ============================================================
-- KPI ANALYSIS
-- ============================================================

-- Total Revenue
SELECT
SUM(valor_total) AS faturamento_total
FROM pedidos
WHERE status='entregue';


-- Average Ticket
SELECT
AVG(valor_total) AS ticket_medio
FROM pedidos
WHERE status='entregue';


-- Delivered Orders
SELECT
COUNT(*) AS pedidos_entregues
FROM pedidos
WHERE status='entregue';


-- Revenue by Salesperson
SELECT
v.nome,
SUM(p.valor_total) AS faturamento
FROM pedidos p
JOIN vendedores v
ON p.vendedor_id=v.id
WHERE p.status='entregue'
GROUP BY v.nome
ORDER BY faturamento DESC;


-- Sales Target Achievement
SELECT
v.nome,
COUNT(p.id) AS pedidos,
SUM(p.valor_total) AS faturamento,
m.meta_mensal,
ROUND((SUM(p.valor_total)/m.meta_mensal)*100,2) AS percentual
FROM vendedores v
JOIN metas m
ON v.id=m.vendedor_id
JOIN pedidos p
ON v.id=p.vendedor_id
WHERE p.status='entregue'
GROUP BY
v.nome,
m.meta_mensal
ORDER BY percentual DESC;
