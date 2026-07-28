SELECT IdCliente,
        -- qtdePontos,
        -- qtdePontos + 10 AS qtdePontos_10,
        -- qtdePontos * 2 AS qtdePontos_x2,
        DtCriacao,
        datetime(substr(DtCriacao,1,19)) AS DtCriacaoNova,
        strftime('%w',datetime(substr(DtCriacao,1,19))) AS DiaSemana --sunday==0
FROM clientes
