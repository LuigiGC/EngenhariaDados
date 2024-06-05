--Caso não tenha o banco de dados pronto Utilize a criação database e o comando use:
CREATE DATABASE AC_EngDados;
USE AC_EngDados;

--Inserts de todas as tabelas que existem no BD.
INSERT INTO Cliente (Nome, Email, Empresa) VALUES
('João Silva', 'joao@empresa.com', 'Empresa A'),
('Maria Oliveira', 'maria@empresa.com', 'Empresa B'),
('Carlos Souza', 'carlos@empresa.com', 'Empresa C');

INSERT INTO Documento (Nome, Tipo, DataCriacao, Autor) VALUES
('Documento 1', 'PDF', '2023-01-01', 'Autor 1'),
('Documento 2', 'Word', '2023-02-01', 'Autor 2'),
('Documento 3', 'Excel', '2023-03-01', 'Autor 3');

INSERT INTO Mensagem (Conteudo, Data) VALUES
('Mensagem 1', '2023-01-01'),
('Mensagem 2', '2023-02-01'),
('Mensagem 3', '2023-03-01');

INSERT INTO Reuniao (Data, Local, Hora, NumAero, Assunto) VALUES
('2023-01-01', 'Sala 1', '10:00', '123', 'Reunião 1'),
('2023-02-01', 'Sala 2', '11:00', '124', 'Reunião 2'),
('2023-03-01', 'Sala 3', '12:00', '125', 'Reunião 3');

INSERT INTO MembroEquipe (Nome, Cargo, Email) VALUES
('Pedro Pereira', 'Gerente', 'pedro@empresa.com'),
('Ana Lima', 'Desenvolvedora', 'ana@empresa.com'),
('Lucas Costa', 'Tester', 'lucas@empresa.com');

INSERT INTO Projeto (Nome, DataInicio, DataTermino, Prioridade) VALUES
('Projeto A', '2023-01-01', '2023-12-31', 'Alta'),
('Projeto B', '2023-02-01', '2023-11-30', 'Média'),
('Projeto C', '2023-03-01', '2023-10-31', 'Baixa');

INSERT INTO Requisito (Descricao, Tipo, Prioridade, Status, idProjeto) VALUES
('Requisito 1', 'Funcional', 'Alta', 'Aberto', 1),
('Requisito 2', 'Não Funcional', 'Média', 'Em Progresso', 2),
('Requisito 3', 'Funcional', 'Baixa', 'Fechado', 3);

INSERT INTO Tarefa (Nome, DataInicio, DataTermino, Status, Prioridade, Comentarios, idProjeto) VALUES
('Tarefa 1', '2023-01-01', '2023-01-31', 'Aberto', 'Alta', 'Comentário 1', 1),
('Tarefa 2', '2023-02-01', '2023-02-28', 'Em Progresso', 'Média', 'Comentário 2', 2),
('Tarefa 3', '2023-03-01', '2023-03-31', 'Fechado', 'Baixa', 'Comentário 3', 3);

INSERT INTO subTarefa (Nome, DataInicio, DataTermino, Status, Prioridade, Comentarios, idTarefa) VALUES
('subTarefa 1', '2023-01-01', '2023-01-15', 'Aberto', 'Alta', 'Comentário 1', 1),
('subTarefa 2', '2023-02-01', '2023-02-15', 'Em Progresso', 'Média', 'Comentário 2', 2),
('subTarefa 3', '2023-03-01', '2023-03-15', 'Fechado', 'Baixa', 'Comentário 3', 3);

INSERT INTO MembroProjeto (idProjeto, idMembro) VALUES (1, 1), (2, 2), (3, 3);
INSERT INTO MembrosReuniao (idReuniao, idMembro) VALUES (1, 1), (2, 2), (3, 3);
INSERT INTO MensagemEquipe (idMensagem, idMembro) VALUES (1, 1), (2, 2), (3, 3);
INSERT INTO ProjetoDoCliente (idProjeto, idCliente) VALUES (1, 1), (2, 2), (3, 3);
INSERT INTO DocumentoProjeto (idProjeto, idDocumento) VALUES (1, 1), (2, 2), (3, 3);
INSERT INTO DocumentoDoRequisito (idRequisito, idDocumento) VALUES (4,1), (5,2), (6,3);
INSERT INTO TarefaRequisito (idTarefa, idRequisito) VALUES (1, 8), (2, 9), (3, 7);
INSERT INTO TarefaProjeto (idProjeto, idTarefa) VALUES (1, 1), (2, 2), (3, 3);
