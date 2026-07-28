/* 
-- 1) Lista de transações com apenas 1 ponto
SELECT * FROM transacoes WHERE QtdePontos = 1;

-- 2) Lista de pedidos realizados no fim de semana
SELECT IdTransacao, DtCriacao, strftime('%w',datetime(substr(DtCriacao,1,19))) AS DiaSemana
FROM transacoes WHERE DiaSemana IN ('6','0');

-- 3) Lista de clientes com 0 pontos
SELECT idCliente, qtdePontos FROM clientes WHERE qtdePontos = 0;

-- 4) Lista de clientes com 100 a 200 pontos (inclusive ambos)
SELECT idCliente, qtdePontos FROM clientes WHERE qtdePontos >= 100 AND qtdePontos <=200;

-- 5) Lista de produtos com nome que começa com "Venda de"
SELECT * FROM produtos WHERE DescNomeProduto LIKE('Venda de%');

-- 6) Lista de produtos com nome que termina com "Lover"
SELECT * FROM produtos WHERE DescNomeProduto LIKE('%lover');

-- 7) Lista de produtos que são "chapéu"
SELECT * FROM produtos WHERE DescCategoriaProduto LIKE('%chapeu%');

-- 8) Lista de transações com o produto "Resgatar ponei"
SELECT *, p.DescNomeProduto FROM transacao_produto tp
INNER JOIN produtos p
ON tp.IdProduto = p.IdProduto
WHERE p.DescNomeProduto LIKE('Resgatar ponei%');
*/
-- 9) Listar todas as transações adicionando uma coluna nova sinalizando 
-- "alto", "médio", "baixo" para o valor dos pontos [<10; <500 ; >=500]
SELECT IdTransacao, 
       qtdePontos,
       CASE WHEN qtdePontos < 10 THEN 'baixo'
            WHEN qtdePontos < 500 THEN 'médio'
            ELSE 'alto'
       END AS CategoriaPontos 
FROM transacoes