DROP DATABASE IF EXISTS Localizacao;
CREATE DATABASE Localizacao;
USE localizacao;

CREATE TABLE fornecedor (
id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT
,nome VARCHAR(100) NOT NULL UNIQUE
,tipo_fruta VARCHAR(50) NOT NULL 
,produtos_utilizados VARCHAR(300) NOT NULL DEFAULT ('NENHUM')
,cidade VARCHAR(50) NOT NULL
,cnpj INT NOT NULL UNIQUE
);
INSERT INTO fornecedor (id, nome, tipo_fruta, produtos_utilizados, cidade, cnpj) VALUES (1, 'Seu josé', 'laranja', 'água', 'Paranavaí', '100.200.300-400');

CREATE TABLE transportadora (
id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT
,data_entrega VARCHAR(100) NOT NULL
,cnpj INT NOT NULL UNIQUE 
,cidade VARCHAR(100) NOT NULL 
);
INSERT INTO transportadora (id,data_entrega, cnpj, cidade) VALUES (1,'30/08/2022','100.200.300-400', 'Paranavaí');
CREATE TABLE fabrica (
id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT
,processo VARCHAR(100) NOT NULL 
);
INSERT INTO fabrica (id, processo) VALUES (1,'30/08/2022');

SELECT * FROM fabrica;
SELECT * FROM fornecedor;
SELECT * FROM transportadora;

