-- saldo de pontos acumulado de cada usuario
WITH tb_pontos_cliente AS (
    SELECT idCliente,
        substr(dtCriacao,1,10) as dtDia,
        sum(qtdePontos) AS totalPontos
    FROM transacoes
    GROUP BY idCliente, dtDia
)
SELECT *, 
       sum(totalPontos) OVER (PARTITION BY idCliente ORDER BY dtDia) AS pontosAcum
FROM tb_pontos_cliente
