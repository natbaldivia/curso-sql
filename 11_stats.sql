SELECT avg(qtdePontos) AS avgPontos,
       round(avg(qtdePontos),2) AS avgPontosRound,
       min(qtdePontos) minPontos,
       max(qtdePontos) maxPontos,
       sum(flTwitch),
       sum(flEmail)

FROM clientes