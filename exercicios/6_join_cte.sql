-- Como foi a curva de churn (cancelamentos) do curso de sql

/*
-- curva de publico (não de churn)
SELECT substr(dtCriacao, 1, 10) AS dtDia,
       count(distinct IdCliente) AS qtdeCliente
FROM transacoes
WHERE substr(dtCriacao, 1, 10) >= '2025-08-25'
AND substr(dtCriacao, 1, 10) < '2025-08-30'
GROUP BY dtDia
*/

WITH tb_clientes_d1 AS (
SELECT DISTINCT idCliente
FROM transacoes
WHERE substr(dtCriacao, 1, 10) = '2025-08-25'
)
SELECT substr(t2.dtCriacao, 1, 10) AS dtDia,
       count(distinct t1.IdCliente) AS qtdeCliente,
       1.* count(distinct t1.idCliente) / (select count(*) from tb_clientes_d1) AS pctRetencao,
       1 - 1.* count(distinct t1.idCliente) / (select count(*) from tb_clientes_d1) AS pctChurn 
FROM tb_clientes_d1 AS t1
LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente
WHERE substr(t2.dtCriacao, 1, 10) >= '2025-08-25'
AND substr(t2.dtCriacao, 1, 10) < '2025-08-30'
GROUP BY dtDia

