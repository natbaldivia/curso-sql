--DROP TABLE IF EXISTS clientes_d28; -- ou esse ou o delete

CREATE TABLE IF NOT EXISTS clientes_d28 (
    idCliente VARCHAR(250) PRIMARY KEY,
    qtdeTransacoes INT

);

DELETE FROM clientes_d28;

INSERT INTO clientes_d28
SELECT idCliente,
       count(distinct IdTransacao) AS qtdeTransacoes
FROM transacoes
WHERE julianday('now') - julianday(substr(dtCriacao,1,10)) <= 28
GROUP BY idCliente;

SELECT * FROM clientes_d28