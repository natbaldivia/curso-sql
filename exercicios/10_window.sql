-- quantidade de usuarios cadastrados (absoluto e acumulado) ao longo do tempo

WITH tb_dia_cliente AS (
    SELECT count(distinct idCliente) AS qtCliente,
        substr(dtCriacao, 1, 10) AS dtDia
    FROM clientes
    GROUP BY dtDia
    ORDER BY dtDia
),
tb_clientes_acumulado AS
(
    SELECT *,
        SUM(qtCliente) OVER (PARTITION BY 1 ORDER BY dtDia) AS sum_clientes
    FROM tb_dia_cliente
)
-- quando chegamos em 3k clientes?
SELECT * FROM tb_clientes_acumulado
WHERE sum_clientes >= 3000
LIMIT 1
