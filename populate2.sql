PRAGMA foreign_keys	= ON;

-- Inserção de registos na tabela Loja
INSERT INTO Loja (idLoja, nome, endereco, telefone) VALUES 
(1, 'Figueira de Ouro: Penhores', 'Avenida da Liberdade, Figueiró, Porto', 255881562),
(2, 'Valor Conde: Penhores de Confiança', 'Avenida Infante Dom Henrique, Vila do Conde, Porto', 252248400),
(3, 'Póvoa de Valor: Loja de Penhores', 'Rua 25 de Novembro, Póvoa de Lanhoso, Braga', 253995105),
(4, 'Ponto do Penhor', 'Rua Padre Silva Gonçalves, Caldelas, Braga', 253361111),
(5, 'AveirOuro: Loja de Penhores', 'Rua de Santo António, Ílhavo, Aveiro', 234361520),
(6, 'Penhor & Valor', 'Rua Comendador Silva, Vila Pouca de Aguiar, Vila Real', 259417590);


-- Inserção de registos na tabela Item
INSERT INTO Item (idItem, nome, dataEntrada, categoria, dimensoes, material, precoVenda, idLoja) VALUES 
(1, 'Colar de Ouro', '2024-08-05', 'Joias e Acessórios', '40 x 2 x 0.2 cm', 'Ouro', NULL, 1),
(2, 'Quadro', '2024-08-08', 'Arte', '60 x 80 x 3 cm', 'Pintura a óleo', NULL, 5),
(3, 'Guitarra Acústica', '2024-08-15', 'Instrumentos Musicais', '100 x 38 x 12 cm', 'Madeira', NULL, 2),
(4, 'Isqueiro Antigo', '2024-08-21', 'Colecionáveis e Antiguidades', '7 x 3.5 x 1.5 cm', 'Bronze', NULL, 1),
(5, 'Serviço de Chá', '2024-08-26', 'Louça e Cerâmica', '30 x 30 x 20 cm', 'Porcelana', NULL, 6),
(6, 'Computador Portátil', '2024-09-07', 'Tecnologia e Informática', '35 x 24 x 1.8 cm', 'Plástico', 2800.00, 4),
(7, 'Anel de Diamante', '2024-09-29', 'Joias e Acessórios', '2 x 2 x 0.7 cm', 'Ouro Branco e Diamante', 8300.00, 5),
(8, 'Relógio de Cuco', '2024-09-30', 'Colecionáveis e Antiguidades', '30 x 20 x 15 cm', 'Madeira', 1080.00, 2),
(9, 'Conjunto de Tacos de Golf', '2024-10-18', 'Desportos e Lazer', '120 x 20 x 10 cm', 'Vários Metais', NULL, 6),
(10, 'Moeda Antiga', '2024-10-20', 'Colecionáveis e Antiguidades', '3 x 3 x 0.2 cm', 'Prata', NULL, 3),
(11, 'Gira Discos', '2024-11-09', 'Tecnologia e Informática', '40 x 35 x 15 cm', 'Metal e Plástico', NULL, 4),
(12, 'Câmara Polaroid', '2024-11-20', 'Tecnologia e Informática', '12 x 10 x 8 cm', 'Plástico', NULL, 3);


-- Inserção de registos na tabela Estado
INSERT INTO Estado (idEstado, tipo, dataAtribuicaoEstado, idItem) VALUES 
(1, 'penhorado', '2024-08-05', 1),
(2, 'penhorado', '2024-08-08', 2),
(3, 'penhorado', '2024-08-15', 3),
(4, 'penhorado', '2024-08-21', 4),
(5, 'penhorado', '2024-08-26', 5),
(6, 'devolvido', '2024-09-02', 1),
(7, 'penhorado', '2024-09-07', 6),
(8, 'à venda', '2024-09-09', 2),
(9, 'devolvido', '2024-09-11', 3),
(10, 'devolvido', '2024-09-17', 5),
(11, 'à venda', '2024-09-22', 4),
(12, 'vendido', '2024-09-26', 2),
(13, 'penhorado', '2024-09-29', 7),
(14, 'vendido', '2024-09-30', 4),
(15, 'penhorado', '2024-09-30', 8),
(16, 'à venda', '2024-10-08', 6),
(17, 'vendido', '2024-10-15', 8),
(18, 'penhorado', '2024-10-18', 9),
(19, 'penhorado', '2024-10-20', 10),
(20, 'à venda', '2024-10-30', 7),
(21, 'à venda', '2024-10-31', 8),
(22, 'devolvido', '2024-11-09', 10),
(23, 'penhorado', '2024-11-09', 11),
(24, 'à venda', '2024-11-19', 9),
(25, 'penhorado', '2024-11-20', 12),
(26, 'vendido', '2024-11-20', 9);


-- Inserção de registos na tabela TermoEmprestimo
INSERT INTO TermoEmprestimo (idEmprestimo, valorEmprestimo, valorDevolverComJuros, dataInicioEmprestimo, dataLimitePagamento, idItem) VALUES
(1, 720.00, 792.00, '2024-08-05', '2024-09-05', 1),
(2, 1500.00, 1650.00, '2024-08-08', '2024-09-08', 2),
(3, 900.00, 990.00, '2024-08-15', '2024-09-15', 3),
(4, 180.00, 198.00, '2024-08-21', '2024-09-21', 4),
(5, 1080.00, 1188.00, '2024-08-26', '2024-09-26', 5),
(6, 1500.00, 1650.00, '2024-09-07', '2024-10-07', 6),
(7, 4800.00, 5280.00, '2024-09-29', '2024-10-29', 7),
(8, 540.00, 594.00, '2024-09-30', '2024-10-30', 8),
(9, 2100.00, 2310.00, '2024-10-18', '2024-11-18', 9),
(10, 300.00, 330.00, '2024-10-20', '2024-11-20', 10),
(11, 1200.00, 1320.00, '2024-11-09', '2024-12-09', 11),
(12, 480.00, 528.00, '2024-11-20', '2024-12-20', 12);


-- Inserção de registos na tabela Pessoa
INSERT INTO Pessoa (nif, nome, telefone, email) VALUES  
(111111111, 'Miguel António Ferreira da Silva', 910123456, 'emp.miguel@penhores.pt'),
(222222222, 'Andreia Rafaela Leão e Teixeira', 911234567, 'emp.andreia@penhores.pt'),
(333333333, 'João Paulo Pereira Pinto', 920123456, 'emp.joao@penhores.pt'),
(444444444, 'Pedro Henrique Almeida da Costa', 962203456, 'emp.pedro@penhores.pt'),
(555555555, 'Francisca Isabel Brãndão', 921234567, 'emp.francisca@penhores.pt'),
(666666666, 'Tomás Lima Marinho', 962345678, 'emp.tomas@penhores.pt'),
(777777777, 'Carla Teresa Martins Ferreira', 972345678, 'carlaferreira@gmail.com'),
(888888888, 'Helena Cristina Fernandes', 912345678, 'helenafernandes@gmail.com'),
(999999999, 'Maria Inês Machado Gomes', 970123456, 'mariagomes@gmail.com'),
(111222333, 'Alexandre Ribeiro Travessa', 934561230, 'alexandretravessa@gmail.com'),
(222333444, 'Sandra Elisabete Dias Tavares', 912563247, 'sandratavares@gmail.com'),
(333444555, 'Hugo Rafael Sousa Nobre', 912234561, 'hugonobre@gmail.com'),
(444555666, 'André Humberto Leite', 923344120, 'andreleite@gmail.com'),
(555666777, 'Leandro Manuel Brito Barros', 914852301, 'leandrobarros@gmail.com'),
(666777888, 'Gonçalo José Barbosa Moura', 969980022, 'goncalomoura@gmail.com'),
(777888999, 'Luísa Conceição Navarro', 933021527, 'luisanavarro@gmail.com'),
(888999111, 'Renata Saavedra Soares', 925945220, 'emp.renata@penhores.pt'),
(999111222, 'Carlos Maurício Leal', 931103256, 'emp.carlos@penhores.pt'),
(999888777, 'Alberto Carneiro Ribas', 967230058, 'emp.alberto@penhores.pt'),
(888777666, 'Tiago Roberto Proença Oliveira', 919009773, 'emp.tiago@penhores.pt'),
(777666555, 'Ricardo Sá Vilar', 919876543, 'ricardovilar@gmail.com'); --- adicionado pela IA


-- Inserção de registos na tabela Cliente
INSERT INTO Cliente (nifCliente) VALUES 
(777777777),
(888888888),
(999999999),
(111222333),
(222333444),
(333444555),
(444555666),
(555666777),
(666777888),
(777888999),
(777666555); --- adicionado pela IA


-- Inserção de registos na tabela Funcionario
INSERT INTO Funcionario (nifFuncionario, salario, idLoja) VALUES 
(111111111, 980.00, 1),
(222222222, 900.00, 2),
(333333333, 885.00, 3),
(444444444, 865.00, 4),
(555555555, 830.00, 5),
(666666666, 830.00, 6),
(888999111, 870.00, 1),
(999111222, 910.00, 2),
(999888777, 835.00, 3),
(888777666, 910.00, 4);


-- Inserção de registos na tabela Transacao
INSERT INTO Transacao (idTransacao, idItem, nifCliente, tipo, valor, dataTransacao, metodoPagamento) VALUES
(1, 1, 777777777, 'requisição de empréstimo', 720.00, '2024-08-05', 'dinheiro'),
(2, 2, 888888888, 'requisição de empréstimo', 1500.00, '2024-08-08', 'transferência bancária'),
(3, 3, 999999999, 'requisição de empréstimo', 900.00, '2024-08-15', 'dinheiro'),
(4, 4, 111222333, 'requisição de empréstimo', 180.00, '2024-08-21', 'dinheiro'),
(5, 5, 222333444, 'requisição de empréstimo', 1080.00, '2024-08-26', 'transferência bancária'),
(6, 1, 777777777, 'devolução de empréstimo', 792.00, '2024-09-02', 'dinheiro'),
(7, 6, 333444555, 'requisição de empréstimo', 1500.00, '2024-09-07', 'transferência bancária'),
(8, 3, 999999999, 'devolução de empréstimo', 990.00, '2024-09-11', 'dinheiro'),
(9, 5, 222333444, 'devolução de empréstimo', 1188.00, '2024-09-17', 'transferência bancária'),
(10, 2, 666777888, 'compra', 2700.00, '2024-09-26', 'transferência bancária'), --- alterei idCliente de acordo com IA
(11, 7, 444555666, 'requisição de empréstimo', 4800.00, '2024-09-29', 'transferência bancária'),
(12, 8, 555666777, 'requisição de empréstimo', 540.00, '2024-09-30', 'dinheiro'),
(13, 4, 111222333, 'compra', 370.00, '2024-09-30', 'dinheiro'), --- mantive e só mudei valor compra, de acordo com IA
(14, 8, 666777888, 'compra', 1080.00, '2024-10-15', 'dinheiro'),
(15, 9, 777666555, 'requisição de empréstimo', 2100.00, '2024-10-18', 'transferência bancária'), --- alterado para novo cliente de acordo com sugestão da IA
(16, 10, 777888999, 'requisição de empréstimo', 300.00, '2024-10-20', 'dinheiro'),
(17, 10, 777888999, 'devolução de empréstimo', 330.00, '2024-11-09', 'dinheiro'),
(18, 11, 777777777, 'requisição de empréstimo', 1200.00, '2024-11-09', 'transferência bancária'),
(19, 9, 999999999, 'compra', 3520.00, '2024-11-20', 'transferência bancária'), --- alterei de 777888999 para 999999999 e baixei preço ligeiramente
(20, 12, 888888888, 'requisição de empréstimo', 480.00, '2024-11-20', 'dinheiro');


-- Inserção de registos na tabela Avaliacao
INSERT INTO Avaliacao (idAvaliacao, idItem, nifFuncionario, dataAvaliacao, notasAvaliacao, valorAvaliado, estadoConservacao) VALUES 
(1, 1, 111111111, '2024-08-06', 'Colar em ótimo estado.', 1200.00, 'novo'),
(2, 2, 555555555, '2024-08-09', 'Pintura bem preservada, tela sem danos.', 2500.00, 'novo'),
(3, 2, 888777666, '2024-08-13', 'Pintura em muito bom estado. Pequenas imperfeições.', 2700.00, 'semi-novo'),
(4, 3, 222222222, '2024-08-16', 'Instrumento com desgaste no verniz.', 1500.00, 'usado'),
(5, 4, 111111111, '2024-08-22', 'Funcional, com marcas de uso.', 280.00, 'muito usado'), --- baixei valor da avaliação
(6, 5, 666666666, '2024-08-27', 'Conjunto completo e em excelente estado.', 1800.00, 'semi-novo'),
(7, 6, 444444444, '2024-09-08', 'Funcionamento sem irregularidades. Sinais leves de uso.', 2500.00, 'usado'),
(8, 7, 555555555, '2024-09-30', 'Anel impecável. Materiais genuínos.', 8000.00, 'novo'),
(9, 8, 222222222, '2024-10-01', 'Mecanismo funcional. Algum desgaste é evidente.', 900.00, 'muito usado'),
(10, 9, 666666666, '2024-10-19', 'Conjunto completo e bem conservado.', 3100.00, 'semi-novo'), --- baixei valor da avaliação ligeiramente
(11, 10, 333333333, '2024-10-21', 'Moeda com alguns sinais de oxidação.', 500.00, 'usado'),
(12, 11, 444444444, '2024-11-10', 'Sem imperfeições visíveis. Componentes bem conservados.', 1900.00, 'novo'),
(13, 10, 888999111, '2024-10-28', 'Bem conservada. Levemente oxidada.', 530.00, 'usado'),
(14, 12, 333333333, '2024-11-21', 'Câmara funciona corretamente. Pequenos riscos na superfície.', 800.00, 'semi-novo'),
(15, 11, 999111222, '2024-11-20', 'Em ótimo estado de conservação. Produz som claro.', 2200.00, 'novo'),
(16, 12, 999888777, '2024-11-23', 'Danos leves na pintura da câmara.', 760.00, 'semi-novo');