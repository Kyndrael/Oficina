-- Inserção de dados fictícios para testes

INSERT INTO Cliente (nome, telefone, email) VALUES
('João da Silva', '11999999999', 'joao@gmail.com'),
('Ana Oliveira', '11988887777', 'ana@gmail.com');

INSERT INTO Veiculo (placa, modelo, marca, ano, id_cliente) VALUES
('ABC1234', 'Corolla', 'Toyota', 2018, 1),
('XYZ5678', 'Civic', 'Honda', 2020, 2);

INSERT INTO Mecanico (nome, endereco, especialidade) VALUES
('Carlos Souza', 'Rua A, 100', 'Motor'),
('Mariana Lima', 'Rua B, 200', 'Freios');

INSERT INTO Equipe (nome_equipe) VALUES
('Equipe Alpha'), ('Equipe Beta');

INSERT INTO Equipe_Mecanico (id_equipe, id_mecanico) VALUES
(1, 1), (1, 2), (2, 2);

INSERT INTO Servico (descricao, valor_mao_obra) VALUES
('Troca de óleo', 100.00),
('Alinhamento', 80.00);

INSERT INTO Peca (descricao, valor_unitario) VALUES
('Filtro de óleo', 30.00),
('Óleo 5W30', 40.00);

INSERT INTO OrdemServico (data_emissao, status, id_veiculo, id_equipe, valor_total) VALUES
('2025-05-15', 'aberta', 1, 1, 0),
('2025-05-16', 'finalizada', 2, 2, 300.00);

INSERT INTO OS_Servico (id_os, id_servico, quantidade, valor_unitario) VALUES
(1, 1, 1, 100.00),
(2, 2, 1, 80.00);

INSERT INTO OS_Peca (id_os, id_peca, quantidade, valor_unitario) VALUES
(1, 1, 1, 30.00),
(1, 2, 2, 40.00);
