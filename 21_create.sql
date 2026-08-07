-- create do ponto de vista analitico

DROP TABLE IF EXISTS relatorio_diario;
CREATE TABLE IF NOT EXISTS relatorio_diario AS

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

SELECT *
FROM tb_acumulada;