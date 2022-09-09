DROP DATABASE IF EXISTS rastreabilidade;
CREATE DATABASE rastreabilidade;
USE rastreabilidade;

CREATE TABLE pais (
id INT NOT NULL UNIQUE AUTO_INCREMENT
,nome VARCHAR(100) NOT NULL
,CONSTRAINT pk_pais PRIMARY KEY (id)
);

INSERT INTO pais (nome) VALUES ('BRASIL');


CREATE TABLE estado (
id INT NOT NULL UNIQUE AUTO_INCREMENT
,nome VARCHAR(100) NOT NULL
,sigla CHAR(2) NOT NULL
,pais_id INT NOT NULL
,CONSTRAINT pk_estado PRIMARY KEY (id)
,CONSTRAINT fk_estado_pais FOREIGN KEY (pais_id) REFERENCES pais (id)
,CONSTRAINT estado_unica UNIQUE(nome, pais_id)
);

INSERT INTO estado (nome,sigla,pais_id) VALUES ('PARANÁ','PR',1);
INSERT INTO estado (nome,sigla,pais_id) VALUES ('SÃO PAULO','SP',1);
INSERT INTO estado (nome,sigla,pais_id) VALUES ('RIO DE JANEIRO','RJ',1);

SELECT * FROM estado;

CREATE TABLE cidade(
id INT NOT NULL UNIQUE AUTO_INCREMENT
,nome VARCHAR(100) NOT NULL 
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);

INSERT INTO cidade (nome,estado_id) VALUES ('PARANAVAÍ',1);
INSERT INTO cidade (nome,estado_id) VALUES ('MARINGA',1);
INSERT INTO cidade (nome,estado_id) VALUES ('CURITIBA',1);

SELECT * FROM cidade;

CREATE TABLE fornecedor (
id INT NOT NULL AUTO_INCREMENT UNIQUE 
,nome VARCHAR(100) NOT NULL  UNIQUE
,tipo_fruta VARCHAR(30) NOT NULL  
,produtos_utilizados VARCHAR(300) NOT NULL  
,cnpj VARCHAR(20) NOT NULL  UNIQUE
);

INSERT INTO fornecedor (nome,tipo_fruta,produtos_utilizados,cnpj) VALUES ('FAZENDA DO SEU ZÉ', 'LARANJA PERA', 'PROFF', '12.345.678/9101-23');
INSERT INTO fornecedor (nome,tipo_fruta,produtos_utilizados,cnpj) VALUES ('FAZENDA DO SEU FELIPE', 'LARANJA BAHIA', 'PROFF', '05.355.664/0001-97');
INSERT INTO fornecedor (nome,tipo_fruta,produtos_utilizados,cnpj) VALUES ('FAZENDA DO SEU JORGE', 'LARANJA LIMA', 'PROFF', '60.126.081/0001-00');

SELECT * FROM fornecedor;

CREATE TABLE transportadora (
id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT
,nome VARCHAR(100) NOT NULL
,cnpj VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO transportadora (nome,cnpj) VALUES ('TRANSPORTADORA HOT WELLS', '76.520.027/0001-77');
INSERT INTO transportadora (nome,cnpj) VALUES ('TRANSPORTADORA FAST TRUCK', '09.958.334/0001-47');
INSERT INTO transportadora (nome,cnpj) VALUES ('TRANSPORTADORA CAMINHAO RAPIDO', '51.219.355/0001-07');

SELECT * FROM transportadora;

CREATE TABLE fabrica (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE
,nome VARCHAR(100) NOT NULL 
,cnpj VARCHAR(20) NOT NULL UNIQUE
,chegada_fruta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO fabrica (nome, cnpj) VALUES ('FABRICA DE SUCO LARANJA', '80.061.328/0001-57');
INSERT INTO fabrica (nome, cnpj) VALUES ('FABRICA DE SUCO LARANJINHA', '97.890.249/0001-51');
INSERT INTO fabrica (nome, cnpj) VALUES ('FABRICA DE SUCO LARANJÃO', '56.348.348/0001-29');

SELECT * FROM fabrica;

CREATE TABLE processo (
id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT
,processo_extracao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,processo_concentracao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,processo_resfrigeracao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO processo (id) VALUES (1);
INSERT INTO processo (id) VALUES (2);
INSERT INTO processo (id) VALUES (3);

SELECT * FROM processo;

CREATE TABLE cliente( 
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE 
,nome_completo VARCHAR(100) NOT NULL UNIQUE
,cnpj VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO cliente (nome_completo,cnpj) VALUES ('JOSISVALDO JOSIAS DA SILVA','42.963.347/0001-80');
INSERT INTO cliente (nome_completo,cnpj) VALUES ('GRÉGORY SILVA','65.687.165/0001-29');
INSERT INTO cliente (nome_completo,cnpj) VALUES ('NELSON SANTOS','59.130.446/0001-83');

SELECT * FROM cliente;


SELECT 	
	estado.id 'ID ESTADO'
    ,estado.nome 'NOME ESTADO'
    ,estado.sigla 'SIGLA ESTADO'
FROM estado 
JOIN cidade ON estado.pais_id = estado.id