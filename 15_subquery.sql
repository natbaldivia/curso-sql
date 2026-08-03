-- Entre os alunos que começaram SQL no primeiro dia, quantos continuaram até o quinto dia?
SELECT count(distinct idCliente)

FROM transacoes As t1

WHERE t1.idCliente IN (
    SELECT distinct idCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
)
AND substr(DtCriacao, 1, 10) = '2025-08-29';

