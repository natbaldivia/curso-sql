-- quantas transacoes eu tive em cada dia do curso?
WITH tb_sumario_dias AS (
    SELECT count(distinct IdTransacao) as countTransacao,
        substr(dtCriacao, 1, 10) AS dtDia     
    FROM transacoes
    WHERE substr(dtCriacao, 1, 10) >= '2025-08-25'
    AND substr(dtCriacao, 1, 10) < '2025-08-30'
    GROUP BY substr(dtCriacao, 1, 10)
)

-- qual a evolução diária? Acumulado por dia
SELECT *,
       sum(countTransacao) OVER (PARTITION BY 1 ORDER BY dtDia) AS TransacaoAcum
FROM tb_sumario_dias
