DROP DATABASE IF EXISTS aula1; 

CREATE DATABASE aula1;
USE aula1;

DROP TABLE IF EXISTS estado;

CREATE TABLE estado (
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE -- CONSTRAINT INLINE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
-- ,CHECK(ativo IN ('S', 'N')) -- CONSTRAINT OUT OF LINE - SEM NOME
,CONSTRAINT pk_estado PRIMARY KEY (id)
,CONSTRAINT coluna_ativo_deve_ser_S_ou_N CHECK(ativo IN ('S', 'N')) -- CONSTRAINT OUT OF LINE - COM NOME
);

INSERT INTO estado (nome,sigla) VALUES ('PARANÁ', 'PR');
INSERT INTO estado (nome,sigla) VALUES ('SÃO PAULO', 'SP');
INSERT INTO estado (nome,sigla) VALUES ('MINAS GERAIS', 'MG');

SELECT id,nome,sigla,ativo,data_cadastro FROM estado;






