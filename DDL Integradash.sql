
CREATE DATABASE integradash;

USE integradash;

CREATE TABLE tb_planta (
	id BINARY(16) NOT NULL,
	nome_planta VARCHAR(255) NOT NULL,
    endereco_planta VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_erro (
	id BINARY(16) NOT NULL,
    nome_erro VARCHAR(255) NOT NULL,
    data_erro DATETIME NOT NULL,
    descricao_erro VARCHAR(500) NOT NULL,
    status_erro VARCHAR(500) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_planta_erro (
	id_erro BINARY(16) NOT NULL,
    id_planta BINARY(16) NOT NULL,
    descricao VARCHAR(500) NOT NULL,
    FOREIGN KEY (id_erro) REFERENCES tb_erro (id),
    FOREIGN KEY (id_planta) REFERENCES tb_planta (id)
);

CREATE TABLE tb_alerta (
	id BINARY(16) NOT NULL,
    id_erro BINARY(16) NOT NULL,
    nome_alerta VARCHAR(255) NOT NULL,
    nivel_criticidade CHAR NOT NULL,
    data_alerta DATETIME NOT NULL,
    status_alerta VARCHAR(255) NOT NULL,
    descricao_alerta VARCHAR(500) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_erro) REFERENCES tb_erro (id)
);

CREATE TABLE tb_usuario (
	id BINARY(16) NOT NULL,
    id_erro BINARY(16) NOT NULL,
    id_estrategia BINARY(16) NOT NULL,
    nome_usuario VARCHAR(255) NOT NULL,
    telefone INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_erro) REFERENCES tb_erro (id)
);


CREATE TABLE tb_estrategia (
	id BINARY(16) NOT NULL,
    id_usuario BINARY(16) NOT NULL,
    id_erro BINARY(16) NOT NULL,
    nome_estrategia VARCHAR(255) NOT NULL,
    data_estrategia DATETIME NOT NULL,
    descricao_estrategia VARCHAR(500) NOT NULL,    
    PRIMARY KEY (id),
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id),
    FOREIGN KEY (id_erro) REFERENCES tb_erro (id)
);

ALTER TABLE tb_usuario 
ADD FOREIGN KEY (id_estrategia) REFERENCES tb_estrategia (id);
