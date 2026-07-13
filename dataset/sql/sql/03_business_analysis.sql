-- ============================================================
-- BUSINESS ANALYSIS
-- ============================================================

-- 1. Revenue by customer segment
SELECT
    c.segmento,
    SUM(p.valor_total) AS faturamento
FROM pedidos p
JOIN clientes c
ON p.cliente_id = c.id
WHERE p.status = 'entregue'
GROUP BY c.segmento
ORDER BY faturamento DESC;


-- 2. Payment methods with the highest cancellation rate
SELECT
    forma_pagamento,
    COUNT(*) AS total_cancelados
FROM pedidos
WHERE status = 'cancelado'
GROUP BY forma_pagamento
ORDER BY total_cancelados DESC;


-- 3. Top 10 best-selling products
SELECT
    pr.nome,
    SUM(ip.quantidade) AS quantidade_vendida
FROM itens_pedido ip
JOIN produtos pr
ON ip.produto_id = pr.id
GROUP BY pr.nome
ORDER BY quantidade_vendida DESC
LIMIT 10;


-- 4. Revenue by region
SELECT
    v.regiao,
    SUM(p.valor_total) AS faturamento
FROM pedidos p
JOIN vendedores v
ON p.vendedor_id = v.id
WHERE p.status='entregue'
GROUP BY v.regiao
ORDER BY faturamento DESC;
