-- qual o dia com maior engajamento de cada aluno que iniciou o curso no dia 1?

WITH alunos_dia1 AS (
    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(dtCriacao, 1, 10) = '2025-08-25'

),
tb_dia_cliente AS (
    SELECT t1.idCliente,
        substr(t2.dtCriacao, 1, 10) as dtDia,
        count(*) as qtdeInteracoes
    FROM alunos_dia1 AS t1
    LEFT JOIN transacoes AS t2
    ON t1.idCliente = t2.idCliente
    AND substr(t2.dtCriacao, 1, 10) >= '2025-08-25'
    AND substr(t2.dtCriacao, 1, 10) < '2025-08-30'
    GROUP BY t1.idCliente, substr(t2.dtCriacao, 1, 10)
),

tb_row_number AS (
    SELECT * ,
        row_number() OVER (PARTITION BY idCliente ORDER BY qtdeInteracoes DESC, dtDia) AS RowNumber
    FROM tb_dia_cliente
)

SELECT *
FROM tb_row_number
WHERE RowNumber = 1