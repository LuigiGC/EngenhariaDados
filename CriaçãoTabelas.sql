--Criação de todas as tabelas
--Caso não tenha o banco de dados pronto Utilize a criação database e o comando use:
CREATE DATABASE AC_EngDados;
USE AC_EngDados;

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    Email VARCHAR(45),
    Empresa VARCHAR(45)
);

CREATE TABLE Documento (
    idDocumento INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    Tipo VARCHAR(45),
    DataCriacao DATE,
    Autor VARCHAR(45)
);

CREATE TABLE Mensagem (
    idMensagem INT AUTO_INCREMENT PRIMARY KEY,
    Conteudo VARCHAR(150),
    Data DATE
);

CREATE TABLE Projeto (
    idProjeto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    DataInicio DATE,
    DataTermino DATE,
    Prioridade VARCHAR(45)
);

CREATE TABLE Requisito (
    idRequisito INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(45),
    Tipo VARCHAR(45),
    Prioridade VARCHAR(45),
    Status VARCHAR(45),
    idProjeto INT,
    FOREIGN KEY (idProjeto) REFERENCES Projeto(idProjeto) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Reuniao (
    idReuniao INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE,
    Local VARCHAR(45),
    Hora VARCHAR(45),
    NumAero VARCHAR(45),
    Assunto VARCHAR(45)
);

CREATE TABLE MembroEquipe (
    idMembro INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    Cargo VARCHAR(45),
    Email VARCHAR(45)
);

CREATE TABLE Tarefa (
    idTarefa INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    DataInicio DATE,
    DataTermino DATE,
    Status VARCHAR(45),
    Prioridade VARCHAR(45),
    Comentarios VARCHAR(45),
    idProjeto INT,
    FOREIGN KEY (idProjeto) REFERENCES Projeto(idProjeto) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE subTarefa (
    idSubTarefa INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    DataInicio DATE,
    DataTermino DATE,
    Status VARCHAR(45),
    Prioridade VARCHAR(45),
    Comentarios VARCHAR(45),
    idTarefa INT,
    FOREIGN KEY (idTarefa) REFERENCES Tarefa(idTarefa) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MembroProjeto (
    idProjeto INT,
    idMembro INT,
    PRIMARY KEY (idProjeto, idMembro),
    FOREIGN KEY (idProjeto) REFERENCES Projeto(idProjeto) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idMembro) REFERENCES MembroEquipe(idMembro) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MembrosReuniao (
    idReuniao INT,
    idMembro INT,
    PRIMARY KEY (idReuniao, idMembro),
    FOREIGN KEY (idReuniao) REFERENCES Reuniao(idReuniao) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idMembro) REFERENCES MembroEquipe(idMembro) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MensagemEquipe (
    idMensagem INT,
    idMembro INT,
    PRIMARY KEY (idMensagem, idMembro),
    FOREIGN KEY (idMensagem) REFERENCES Mensagem(idMensagem) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idMembro) REFERENCES MembroEquipe(idMembro) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ProjetoDoCliente (
    idProjeto INT,
    idCliente INT,
    PRIMARY KEY (idProjeto, idCliente),
    FOREIGN KEY (idProjeto) REFERENCES Projeto(idProjeto) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DocumentoProjeto (
    idProjeto INT,
    idDocumento INT,
    PRIMARY KEY (idProjeto, idDocumento),
    FOREIGN KEY (idProjeto) REFERENCES Projeto(idProjeto) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idDocumento) REFERENCES Documento(idDocumento) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DocumentoDoRequisito (
    idRequisito INT,
    idDocumento INT,
    PRIMARY KEY (idRequisito, idDocumento),
    FOREIGN KEY (idRequisito) REFERENCES Requisito(idRequisito) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idDocumento) REFERENCES Documento(idDocumento) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TarefaRequisito (
    idTarefa INT,
    idRequisito INT,
    PRIMARY KEY (idTarefa, idRequisito),
    FOREIGN KEY (idTarefa) REFERENCES Tarefa(idTarefa) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idRequisito) REFERENCES Requisito(idRequisito) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TarefaProjeto (
    idProjeto INT,
    idTarefa INT,
    PRIMARY KEY (idProjeto, idTarefa),
    FOREIGN KEY (idProjeto) REFERENCES Projeto(idProjeto) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idTarefa) REFERENCES Tarefa(idTarefa) ON DELETE CASCADE ON UPDATE CASCADE
);
