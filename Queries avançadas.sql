-- a) Ordens com cliente, placa e status
SELECT os.id_os, c.nome AS cliente, v.placa, os.status
FROM OrdemServico os
JOIN Veiculo v ON os.id_veiculo = v.id_veiculo
JOIN Cliente c ON v.id_cliente = c.id_cliente
ORDER BY os.data_emissao DESC;

-- b) Peças usadas na OS 1
SELECT p.descricao, osp.quantidade, osp.valor_unitario,
       (osp.quantidade * osp.valor_unitario) AS total_peca
FROM OS_Peca osp
JOIN Peca p ON osp.id_peca = p.id_peca
WHERE osp.id_os = 1;

-- c) Valor total da OS 1 (serviços + peças)
SELECT os.id_os,
       SUM(osp.quantidade * osp.valor_unitario) AS total_pecas,
       SUM(oss.quantidade * oss.valor_unitario) AS total_servicos,
       SUM(osp.quantidade * osp.valor_unitario + oss.quantidade * oss.valor_unitario) AS valor_total
FROM OrdemServico os
LEFT JOIN OS_Peca osp ON os.id_os = osp.id_os
LEFT JOIN OS_Servico oss ON os.id_os = oss.id_os
WHERE os.id_os = 1
GROUP BY os.id_os;

-- d) Mecânicos por equipe
SELECT e.nome_equipe, m.nome AS mecanico
FROM Equipe e
JOIN Equipe_Mecanico em ON e.id_equipe = em.id_equipe
JOIN Mecanico m ON em.id_mecanico = m.id_mecanico
ORDER BY e.nome_equipe;

-- e) Total de serviços realizados
SELECT s.descricao, SUM(oss.quantidade) AS total_realizado
FROM OS_Servico oss
JOIN Servico s ON oss.id_servico = s.id_servico
GROUP BY s.descricao
ORDER BY total_realizado DESC;

-- f) Ordens com custo de peças acima de R$200
SELECT os.id_os, SUM(osp.quantidade * osp.valor_unitario) AS total_pecas
FROM OrdemServico os
JOIN OS_Peca osp ON os.id_os = osp.id_os
GROUP BY os.id_os
HAVING total_pecas > 200;
