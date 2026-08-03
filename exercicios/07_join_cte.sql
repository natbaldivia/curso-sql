-- dentre os clientes de janeiro/25, quantos assistiram o curso de sql?

WITH tb_clientes_janeiro AS(
    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(dtCriacao, 1, 10) >= '2025-01-01'
    AND substr(dtCriacao, 1, 10) < '2025-02-01'
)

/*
-- modo Direto, colocando mais condições no JOIN
SELECT count(distinct t1.idCliente) AS clientesJaneiro,
       count( distinct t2. idCliente) AS clientesSQL
FROM tb_clientes_janeiro t1
LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente
AND t2.dtCriacao >= '2025-08-25'
AND t2.dtCriacao < '2025-08-30'
*/
, tb_clientes_sql AS (
    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(dtCriacao, 1, 10) >= '2025-08-25'
    AND substr(dtCriacao, 1, 10) < '2025-08-30'
)
SELECT count(distinct t1.idCliente) AS clientes_Janeiro, 
       count(distinct t2.idCliente) AS clientes_SQL
FROM tb_clientes_janeiro t1
LEFT JOIN tb_clientes_sql t2
ON t1.idCliente = t2.idCliente