SELECT idCliente, 
       qtdePontos,
       CASE WHEN qtdePontos <= 500 THEN 'ponei'
            WHEN qtdePontos BETWEEN 501 AND 1000 THEN 'ponei premium'
            WHEN qtdePontos BETWEEN 1001 AND 5000 THEN 'mago aprendiz'
            WHEN qtdePontos BETWEEN 5001 AND 10000 THEN 'mago mestre'
            WHEN qtdePontos >= 10001 THEN 'mago supremo'
        END AS CategoriaClientes
FROM clientes
ORDER BY qtdePontos DESC;

-- resolvido pelo Teo
SELECT idCliente, 
       qtdePontos,
       CASE WHEN qtdePontos <= 500 THEN 'ponei'
            WHEN qtdePontos <= 1000 THEN 'ponei premium'
            WHEN qtdePontos <= 5000 THEN 'mago aprendiz'
            WHEN qtdePontos <= 10000 THEN 'mago mestre'
            ELSE 'mago supremo'
        END AS CategoriaClientes,
        CASE WHEN QtdePontos <= 1000 THEN 1
             ELSE 0
        END AS flPonei,
        CASE WHEN QtdePontos > 1000 THEN 1
             ELSE 0
        END AS flMago
FROM clientes
ORDER BY qtdePontos DESC;
