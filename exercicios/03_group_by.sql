/*
1) Quantos clientes tem email cadastrado?
SELECT count(idCliente)
FROM clientes
WHERE flEmail = 1

2) Qual cliente juntou mais pontos positivos em 2025-05?
SELECT idCliente, sum(qtdePontos) AS totalPontos
FROM transacoes
WHERE DtCriacao >= '2025-05-01'
AND DtCriacao < '2025-06-01'
AND QtdePontos > 0
GROUP BY idCliente
ORDER BY sum(qtdePontos) DESC
LIMIT 1

3) Qual cliente fez mais transações no ano de 2024?
SELECT idCliente, count(distinct(idTransacao))
FROM transacoes
--WHERE DtCriacao LIKE '2024%'
WHERE strftime('%Y', substr(DtCriacao, 1, 19)) = '2024'
GROUP BY idCliente
ORDER BY count(idTransacao) DESC
LIMIT 1

4) Quantos produtos são de RPG?
SELECT DescCategoriaProduto,count(IdProduto)
FROM produtos
GROUP BY DescCategoriaProduto
WHERE DescCategoriaProduto = 'rpg'

5) Qual o valor médio de pontos positivos por dia?
SELECT sum(QtdePontos) AS totalPontos,
       count(distinct substr(DtCriacao, 1, 10)) AS qtdDiasUnicos, 
       sum(QtdePontos) / count(distinct substr(DtCriacao, 1, 10)) AS avgPontosDia
FROM transacoes
WHERE QtdePontos > 0

6) Qual dia da semana quem mais fez pedidos em 2025?
SELECT idCliente,count(IdTransacao),(strftime('%w', substr(DtCriacao, 1, 19))) AS diaSemana
FROM transacoes
WHERE DtCriacao LIKE '2025%'
GROUP BY idCliente
ORDER BY 2 DESC

7) Qual o produto mais transacionado?
SELECT IdProduto, count(idTransacaoProduto) 
FROM transacao_produto
GROUP BY 1
ORDER BY 2 DESC

8) Qual o produto com mais pontos transacionado?
SELECT IdProduto, sum(vlProduto) 
FROM transacao_produto
GROUP BY 1
order by 2 DESC

*/
