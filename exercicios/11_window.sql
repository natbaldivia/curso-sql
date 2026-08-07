-- qual o dia da semana mais ativo de cada usuario?

WITH tb_cliente_semana AS (
    SELECT idCliente,
        count(distinct idTransacao) qtTransacao,
        strftime('%w', substr(dtCriacao, 1, 10)) AS diaSemana
    FROM transacoes
    GROUP BY idCliente,
            diaSemana
),
tb_row_number AS (
    SELECT *,
           CASE 
                WHEN diaSemana = '0' THEN 'Domingo'
                WHEN diaSemana = '1' THEN 'Segunda'
                WHEN diaSemana = '2' THEN 'Terça'
                WHEN diaSemana = '3' THEN 'Quarta'
                WHEN diaSemana = '4' THEN 'Quinta'
                WHEN diaSemana = '5' THEN 'Sexta'
                WHEN diaSemana = '6' THEN 'Sabado'
           END AS diaSemanaNm,
        ROW_NUMBER() OVER (PARTITION BY idCliente ORDER BY qtTransacao DESC) AS rowNumber
    FROM tb_cliente_semana
)
SELECT * FROM tb_row_number
WHERE rowNumber = 1 
