-- Lista de transações com o produto "Resgatar ponei"
SELECT * 
FROM transacao_produto t1
WHERE t1.idProduto IN (
    SELECT idProduto
    FROM produtos
    WHERE DescNomeProduto = 'Resgatar Ponei'
)