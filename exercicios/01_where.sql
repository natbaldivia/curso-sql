SELECT count(idCliente) FROM clientes 
WHERE flEmail = 1;

SELECT count(IdTransacao) FROM transacoes
WHERE QtdePontos = 50;

SELECT count(idCliente) FROM clientes 
WHERE QtdePontos > 500;

SELECT * FROM produtos WHERE DescNomeProduto LIKE('%churn%');
