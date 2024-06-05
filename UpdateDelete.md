--Caso não tenha o banco de dados pronto Utilize a criação database e o comando use:
CREATE DATABASE AC_EngDados;
USE AC_EngDados;

--Updates,Delete;

UPDATE Cliente SET Nome = 'João Atualizado' WHERE idCliente = 1;
UPDATE Projeto SET Nome = 'Projeto A Atualizado' WHERE idProjeto = 1;
UPDATE Tarefa SET Nome = 'Tarefa 1 Atualizada' WHERE idTarefa = 1;
UPDATE Requisito SET Descricao = 'Requisito 1 Atualizado' WHERE idRequisito = 1;
UPDATE Reuniao SET Local = 'Sala Atualizada' WHERE idReuniao = 1;

DELETE FROM Cliente WHERE idCliente = 3;
DELETE FROM Projeto WHERE idProjeto = 3;
DELETE FROM Tarefa WHERE idTarefa = 3;
DELETE FROM Requisito WHERE idRequisito = 3;
DELETE FROM Reuniao WHERE idReuniao = 3;
