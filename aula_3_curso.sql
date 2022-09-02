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
,CONSTRAINT estado_ativo_deve_ser_S_ou_N CHECK(ativo IN ('S', 'N')) -- CONSTRAINT OUT OF LINE - COM NOME
);

INSERT INTO estado (nome,sigla) VALUES ('PARANÁ', 'PR');
INSERT INTO estado (nome,sigla) VALUES ('SÃO PAULO', 'SP');
INSERT INTO estado (nome,sigla) VALUES ('MINAS GERAIS', 'MG');

SELECT * FROM estado;

-- AULA 2

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


INSERT INTO cidade (nome, estado_id) VALUES ('CURITIBA', 1);

SELECT * FROM cidade;

-- AULA 3

ALTER TABLE estado ADD COLUMN regiao INT; -- Alterou a tabela estado para adicionar uma coluna região. Isso sera util caso o sistema ja esteja com o cliente

DESCRIBE estado; -- Descreve todas as informações das colunas da tabela estado

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100); -- alteirou a colua região para VARCHAR

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100) NOT NULL; -- Adicionou a coluna região NOT NULL

ALTER TABLE estado DROP COLUMN regiao; -- Derrubou a coluna região

ALTER TABLE estado ADD COLUMN regiao VARCHAR(100) NOT NULL DEFAULT 'VALOR NÃO INFORMADO' AFTER nome; -- Adicionou a coluna região a informação padrão como 'VALOR NÃO INFORMADO'

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100) NOT NULL AFTER sigla; -- Mudou a coluna região para aparecer depois da coluna sigla

ALTER TABLE estado CHANGE regiao regiao_estado VARCHAR(100) NOT NULL; -- Mudou o nome da coluna regiao para regiao_estado

ALTER TABLE estado DROP CONSTRAINT estado_ativo_deve_ser_S_ou_N; -- derrubou a 'CONSTRAINT estado_ativo_deve_ser_S_ou_N'
ALTER TABLE estado MODIFY COLUMN ativo ENUM('S', 'N') NOT NULL; -- modificou a coluna ativo para so aceitar 'S' e 'N'

INSERT INTO estaodo (nome,sigla,ativo) VALUES ('MATO GROSSO','MT','A');