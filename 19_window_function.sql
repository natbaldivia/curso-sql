WITH tb_cliente_dia AS (
    SELECT idCliente, 
        substr(dtCriacao,1,10) as dtDia,
        count(distinct IdTransacao) as qtTransacao
    FROM transacoes
    WHERE substr(dtCriacao,1,10) >= '2025-08-25'
    AND substr(dtCriacao,1,10) < '2025-08-30'
    GROUP BY idCliente, substr(dtCriacao,1,10)
),
-- visão acumulada por cliente
tb_lag AS (
    SELECT *,
        sum(qtTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) AS qtTransacaoAcum,
        -- relativizando a % de engajamento de um dia para outro
        lag(qtTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) AS lagTransacao
    FROM tb_cliente_dia
)
SELECT *,
       1. * qtTransacao / lagTransacao,
FROM tb_lag