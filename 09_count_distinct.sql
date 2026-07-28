SELECT COUNT(DISTINCT DtAtualizacao) FROM clientes;


SELECT COUNT(*), 
       COUNT(DISTINCT IdTransacao),
       COUNT(DISTINCT idCliente)
FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'
ORDER BY DtCriacao;