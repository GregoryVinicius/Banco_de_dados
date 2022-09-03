DROP DATABASE IF EXISTS aula1; 

CREATE DATABASE aula1;
USE aula1;

DROP TABLE IF EXISTS estado;

CREATE TABLE estado (
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CHECK(ativo IN ('S', 'N'))
,CONSTRAINT pk_estado PRIMARY KEY (id)
,CONSTRAINT estado_ativo_deve_ser_S_ou_N CHECK(ativo IN ('S', 'N'))
);

SELECT * FROM estado;

DROP DATABASE IF EXISTS cidade;
CREATE TABLE cidade (
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK(ativo IN ('S', 'N'))
,CONSTRAINT cidade_unica UNIQUE (nome, estado_id)
);

INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (DEFAULT,'PARANA','PR','S','2022-09-03');
INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (DEFAULT,'SÃO PAULO','SP',DEFAULT,DEFAULT);
INSERT INTO estado (nome,sigla) VALUES ('MATO GROSSO', 'MT');

INSERT INTO cidade (nome,estado_id) VALUES ('CURITIBA', 1);

INSERT INTO cidade (nome,estado_id) VALUES ('SÃO PAULO', 2);

SELECT * FROM estado;
SELECT * FROM cidade;