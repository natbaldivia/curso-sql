/*
-- 1) Quais clientes mais perderam pontos por Lover?
SELECT t1.idCliente,
       sum(t1.qtdePontos) as totalPontos,
       t3.DescCategoriaProduto
FROM transacoes t1
LEFT JOIN transacao_produto t2
ON t1.IdTransacao = t2.IdTransacao
LEFT JOIN produtos t3
ON t2.IdProduto = t3.IdProduto
WHERE t3.DescCategoriaProduto = 'lovers'
GROUP BY t1.idCliente
ORDER BY sum(t1.qtdePontos) ASC
LIMIT 5;

-- 2) Quais clientes assinaram a lista de presença no dia 2025-08-25 ?
SELECT distinct t1.idCliente, t1.DtCriacao, t3.DescNomeProduto
FROM transacoes t1
LEFT JOIN transacao_produto t2
ON t1.IdTransacao = t2.IdTransacao
LEFT JOIN produtos t3
ON t2.IdProduto = t3.IdProduto
WHERE t3.DescCategoriaProduto = 'present'
AND substr(t1.DtCriacao, 1, 10) = '2025-08-25'

-- 3) Do inicio ao fim do nosso curso (2025-08-25 a 2025-08-29), 
-- quantos clientes assinaram a lista de presença?
SELECT count(distinct t1.idCliente), t3.DescNomeProduto
FROM transacoes t1
LEFT JOIN transacao_produto t2
ON t1.IdTransacao = t2.IdTransacao
LEFT JOIN produtos t3
ON t2.IdProduto = t3.IdProduto
WHERE t3.DescCategoriaProduto = 'present'
AND substr(t1.DtCriacao, 1, 10) BETWEEN '2025-08-25' AND '2025-08-29'

-- 4) Clientes mais antigos, tem mais frequencia de transação?
SELECT t1.idCliente,
       CAST(julianday('now') - julianday(substr(t1.DtCriacao, 1, 19)) AS INT) AS qtDiasClienteCadastrado,
       count(t2.IdTransacao)
FROM clientes t1
LEFT JOIN transacoes t2
ON t1.idcliente = t2.IdCliente
GROUP BY t1.idCliente, qtDiasClienteCadastrado


5) Quantidade de transações acumuladas ao longo do tempo
6) Quantidade de usuários cadastrados (absoluto e acumulado) ao longo do tempo
7) Qual o dia da semana mais ativo de cada usuário?
8) Saldo de pontos acumulado de cada usuário
*/

