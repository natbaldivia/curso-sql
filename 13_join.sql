SELECT tp.idTransacaoProduto, tp.IdProduto, p.DescNomeProduto
FROM transacao_produto tp
INNER JOIN produtos p
ON tp.IdProduto = p.IdProduto;

-- qual categoria tem mais produtos vendidos?
SELECT count(tp.idTransacaoProduto), p.DescCategoriaProduto  
FROM transacao_produto tp
INNER JOIN produtos p
ON tp.IdProduto = p.IdProduto
GROUP BY p.DescCategoriaProduto
ORDER BY 1 DESC;

-- em 2024, quantas transações de Lovers tivemos?
SELECT count(distinct t1.IdTransacao),
       t3.DescCategoriaProduto
FROM transacoes t1
LEFT JOIN transacao_produto t2
ON t1.IdTransacao = t2.IdTransacao
LEFT JOIN produtos t3
ON t2.IdProduto = t3.IdProduto
WHERE DtCriacao LIKE '2024%'
GROUP BY t3.DescCategoriaProduto
HAVING count(distinct t1.IdTransacao) < 1000
ORDER BY t3.DescCategoriaProduto DESC;

-- qual mês tivemos mais lista de presença assinada?
SELECT count(distinct t1.IdTransacao),
       substr(t1.DtCriacao,1, 7) AS anoMes,
       t3.DescCategoriaProduto
FROM transacoes t1
LEFT JOIN transacao_produto t2
ON t1.IdTransacao = t2.IdTransacao
LEFT JOIN produtos t3
ON t2.IdProduto = t3.IdProduto
WHERE t3.DescCategoriaProduto = 'present'
GROUP BY anoMes
ORDER BY 1 DESC
