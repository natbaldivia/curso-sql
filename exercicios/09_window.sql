-- quantidade de transacoes acumuladas ao longo do tempo (diario)

WITH tb_transacao_dia AS (
    SELECT substr(dtCriacao, 1, 10) as dtDia,
        count(distinct idTransacao) as qtTransacao       
    FROM transacoes
    GROUP BY dtDia
    ORDER BY dtDia
),
tb_acumulada AS (
    SELECT *,
        SUM(qtTransacao) OVER (PARTITION BY 1 ORDER BY dtDia) AS qtTransacao_Acumulada
    FROM tb_transacao_dia
)
-- quando atingimos 100k transacoes?
SELECT *
FROM tb_acumulada
WHERE qtTransacao_Acumulada >= 100000
LIMIT 1