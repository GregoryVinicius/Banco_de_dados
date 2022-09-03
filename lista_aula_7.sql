DROP DATABASE IF EXISTS aula_banco; -- se existir elimine aula_banco
CREATE DATABASE aula_banco; 		
USE aula_banco;						

CREATE TABLE estado( 				
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE  
,sigla CHAR(2) NOT NULL UNIQUE
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CONSTRAINT pk_estado PRIMARY KEY (id)  
);

CREATE TABLE cidade (				
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200)  NOT NULL
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);
/**
-- 1) Escreva o comando para inserir um registro da tabela estado com todas as colunas.
INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (NULL, 'PARANÁ','PR', 'S', DEFAULT);

-- 2) Escreva o comando para inserir um registro da tabela estado, definindo todos os dados, exceto a  chave primária que é auto incremento.
INSERT INTO estado (nome,sigla,ativo,data_cadastro) VALUES ('SÃO PAULO','SP','S',DEFAULT);
*/
-- inserindo estados
INSERT INTO estado (nome,sigla) VALUES ('PARANÁ','PR');
INSERT INTO estado (nome,sigla) VALUES ('SÃO PAULO','SP');
INSERT INTO estado (nome,sigla) VALUES ('MATO GROSSO','MT');
INSERT INTO estado (nome,sigla) VALUES ('SANTA CATARINA','SC');
INSERT INTO estado (nome,sigla) VALUES ('RIO GRANDE DO SUL','RS');

-- inserindo cidades
INSERT INTO cidade (nome, estado_id) VALUES ('BAURU',2);
INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('GUARULHOS',2);
INSERT INTO cidade (nome, estado_id) VALUES ('CAMPINAS',2);
INSERT INTO cidade (nome, estado_id) VALUES ('FLORIANÓPOLIS',4);
INSERT INTO cidade (nome, estado_id) VALUES ('PARANAVAÍ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('CUIABA',3);
INSERT INTO cidade (nome, estado_id) VALUES ('BALNEÁRIO CAMBORIÚ',4);
INSERT INTO cidade (nome, estado_id) VALUES ('LONDRINA',1);
INSERT INTO cidade (nome, estado_id) VALUES ('CASCAVEL',1);
INSERT INTO cidade (nome, estado_id) VALUES ('JOINVILLE',4);
INSERT INTO cidade (nome, estado_id) VALUES ('PORTO ALEGRE',5);
INSERT INTO cidade (nome, estado_id) VALUES ('BLUMENAL',4);
INSERT INTO cidade (nome, estado_id) VALUES ('BARRA DOS GARÇAS',3);
INSERT INTO cidade (nome, estado_id) VALUES ('CHAPECÓ',4);
INSERT INTO cidade (nome, estado_id) VALUES ('ITAJAÍ',4);

-- 1) Na inserção do estado, o usuário cometeu um erro, esquecendo de colocar acento. Neste contexto, escreva o comando para alterar o registro colocando acento.
-- Sabe-se que o “id” do registro é “57”.
-- EXERCÍCIO PARA ALTERAR UMA COLUNA DE UM REGISTRO PELO ID
UPDATE estado SET nome = 'PARANÁ' WHERE id = 57;

-- 2) Faça o mesmo exercício anterior, porém, considerando que você não saiba do “id”.
-- EXERCÍCIO PARA ALTERAR O DADO DE UMA COLUNA DE UM REGISTRO PELO NOME
UPDATE ESTADO SET nome = 'PARANÁ' WHERE nome = 'PARANA';

-- 1) Escreva o comando para seleccionar todos os registros da tabela estado com todas as colunas.
SELECT * FROM estado;

-- 2) Escreva o comando para seleccionar o nome e a sigla de todos os registros da tabela estado.
SELECT nome,sigla FROM estado;