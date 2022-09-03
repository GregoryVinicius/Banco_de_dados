/*
AULA 08 - JOIN (Junções)
videoaula: https://www.youtube.com/watch?v=wm3e7rICW2I
*/


DROP DATABASE IF EXISTS aula_banco; -- se existir elimine aula_banco
CREATE DATABASE aula_banco; 		-- criar aula_banco
USE aula_banco;						-- selecionar aula_banco

CREATE TABLE estado( 				-- criando a tabela estado
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE  
,sigla CHAR(2) NOT NULL UNIQUE
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CONSTRAINT pk_estado PRIMARY KEY (id)  
);

CREATE TABLE cidade (				-- criando a tabela cidade
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200)  NOT NULL
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);

-- inserindo estados
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('SÃO PAULO','SP','S','2015-10-31');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('PARANÁ','PR','S','2015-2-25');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ('MATO GROSSO','MT','N','2015-12-02');

-- inserindo cidades
INSERT INTO cidade (nome, estado_id) VALUES ('BAURU',1);
INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',2);
INSERT INTO cidade (nome, estado_id) VALUES ('BARRA DOS GARÇAS',3);

-- SQL 89
SELECT 
	cidade.id 'ID CIDADE'
    ,cidade.nome 'NOME CIDADE'
    ,estado.sigla 'SIGLA ESTADO'
FROM estado, cidade
WHERE cidade.estado_id = estado.id
	AND estado.nome = 'PARANÁ';

-- SQL 92
SELECT 	
	cidade.id 'ID CIDADE'
    ,cidade.nome 'NOME CIDADE'
    ,estado.sigla 'SIGLA ESTADO'
FROM estado 
JOIN cidade ON cidade.estado_id = estado.id
WHERE estado.nome = 'PARANÁ';