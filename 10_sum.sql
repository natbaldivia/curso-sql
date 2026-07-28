

SELECT sum(qtdePontos) AS totalPontos,
       sum(CASE WHEN QtdePontos > 0 THEN qtdePontos END) AS qtdePontosPositivos,
       sum(CASE WHEN QtdePontos < 0 THEN QtdePontos END) AS qtdePontosNegativos,
       count(CASE WHEN QtdePontos < 0 THEN QtdePontos END) AS qtdeTransacoesNegativos
FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'
ORDER BY qtdePontos
