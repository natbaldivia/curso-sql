-- Quem iniciou o curso no primeiro dia, em média assistiu quantas aulas?

-- quem participou da primeira aula
WITH tb_primeiro_dia AS (
    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(dtCriacao, 1, 10) = '2025-08-25'
),

-- quem participou do curso inteiro
tb_dias_curso AS (
    SELECT DISTINCT
           idCliente,
           substr(dtCriacao, 1, 10) AS presenteDia
    FROM transacoes
    WHERE dtCriacao >= '2025-08-25'
    AND dtCriacao < '2025-08-30'
    ORDER BY idCliente, presenteDia
),

-- contando quantas vezes quem participou do primeiro dia, voltou
tb_cliente_dias AS (
    SELECT t1.idCliente,
        count(t2.presenteDia) qtdeDias
    FROM tb_primeiro_dia AS t1
    LEFT JOIN tb_dias_curso AS t2
    ON t1.idCliente = t2.idCliente
    GROUP BY t1.idCliente
)

-- calcula a média
--SELECT avg(qtdeDias) 
--FROM tb_cliente_dias;

-- quantos clientes assistiram a quantos dias de aulas
SELECT count(idCliente),
       qtdeDias
FROM tb_cliente_dias
GROUP BY qtdeDias
