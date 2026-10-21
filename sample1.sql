-- BASIC CONSOLE COMMANDS
-- \c <DATABASE>  => Change database
-- \dt            => Show tables
-- \d <TABLE>     => Describe table 
-- git config --global user.email "you@example.com"
-- git config --global user.name "Your Name"

\c postgres;

DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;

\c empresa;

CREATE DOMAIN TIPO_ID AS CHAR(4);

CREATE DOMAIN D_NUM AS INTEGER
CHECK (VALUE > 0 AND VALUE < 21);

CREATE TABLE funcionario
(
	ident       TIPO_ID,
	nome        VARCHAR(15) NOT NULL,
	sobrenome   VARCHAR(15) NOT NULL,
	endereco    VARCHAR(30),
	dtnasc      DATE,
	salario     DECIMAL(10,2),
	sexo        VARCHAR(15),
	supident    TIPO_ID,
	dnumero     TIPO_ID NOT NULL,
	PRIMARY KEY (ident)
);

CREATE TABLE dependente
(
    fident          TIPO_ID, 
    nome            VARCHAR(15) NOT NULL, 
    dt_nasc         DATE, 
    sexo            VARCHAR(15), 
    relacionamento  VARCHAR(15),  
    PRIMARY KEY (fident, nome)
);

CREATE TABLE departamento
(   
    numero      TIPO_ID, 
    nome        VARCHAR(15) NOT NULL, 
    gident      TIPO_ID, 
    dtinicio    DATE,
    PRIMARY KEY (numero)
);

CREATE TABLE localizacoes
(
    dnumero     TIPO_ID, 
    localizacao VARCHAR(15),
    PRIMARY KEY (dnumero, localizacao)
);

CREATE TABLE projeto
(
    numero      TIPO_ID, 
    nome        VARCHAR(15), 
    localizacao VARCHAR(15), 
    dnumero     TIPO_ID,
    PRIMARY KEY (numero)
);

CREATE TABLE trabalha_em
(
    pnumero TIPO_ID, 
    fident  TIPO_ID, 
    horas   INTEGER,
    PRIMARY KEY (pnumero, fident)
);