--Caso não tenha o banco de dados pronto Utilize a criação database e o comando use:
CREATE DATABASE AC_EngDados;
USE AC_EngDados;

--selects

SELECT Cliente.Nome, Projeto.Nome 
FROM Cliente 
JOIN ProjetoDoCliente ON Cliente.idCliente = ProjetoDoCliente.idCliente 
JOIN Projeto ON ProjetoDoCliente.idProjeto = Projeto.idProjeto;

SELECT idProjeto, COUNT(*) as numTarefas 
FROM Tarefa 
GROUP BY idProjeto 
HAVING COUNT(*) > 0;

SELECT Nome 
FROM Projeto 
WHERE idProjeto IN (SELECT idProjeto FROM Tarefa WHERE Status = 'Aberto');

SELECT Nome, DataInicio 
FROM Projeto 
ORDER BY DataInicio DESC;

SELECT Tarefa.Nome as TarefaNome, subTarefa.Nome as subTarefaNome 
FROM Tarefa 
JOIN subTarefa ON Tarefa.idTarefa = subTarefa.idTarefa;

SELECT MembroEquipe.Nome as MembroNome, Projeto.Nome as ProjetoNome 
FROM MembroEquipe 
JOIN MembroProjeto ON MembroEquipe.idMembro = MembroProjeto.idMembro 
JOIN Projeto ON MembroProjeto.idProjeto = Projeto.idProjeto;

SELECT Requisito.Descricao as RequisitoDescricao, Documento.Nome as DocumentoNome 
FROM Requisito 
JOIN DocumentoDoRequisito ON Requisito.idRequisito = DocumentoDoRequisito.idRequisito 
JOIN Documento ON DocumentoDoRequisito.idDocumento = Documento.idDocumento;

SELECT Reuniao.Assunto as ReuniaoAssunto, MembroEquipe.Nome as MembroNome 
FROM Reuniao 
JOIN MembrosReuniao ON Reuniao.idReuniao = MembrosReuniao.idReuniao 
JOIN MembroEquipe ON MembrosReuniao.idMembro = MembroEquipe.idMembro;

SELECT Mensagem.Conteudo as MensagemConteudo, MembroEquipe.Nome as MembroNome 
FROM Mensagem 
JOIN MensagemEquipe ON Mensagem.idMensagem = MensagemEquipe.idMensagem 
JOIN MembroEquipe ON MensagemEquipe.idMembro = MembroEquipe.idMembro;

SELECT Projeto.Nome as ProjetoNome, Documento.Nome as DocumentoNome 
FROM Projeto 
JOIN DocumentoProjeto ON Projeto.idProjeto = DocumentoProjeto.idProjeto 
JOIN Documento ON DocumentoProjeto.idDocumento = Documento.idDocumento;
