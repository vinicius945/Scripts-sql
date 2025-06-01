-- Tabela: Localizacao
CREATE TABLE localizacao (
    id_localizacao NUMBER PRIMARY KEY,
    cidade         VARCHAR2(100) NOT NULL,
    estado         VARCHAR2(2)   NOT NULL,
    cep            VARCHAR2(10)  NOT NULL UNIQUE,
    rua            VARCHAR2(200) NOT NULL,
    numero         VARCHAR2(10)  NOT NULL,
    complemento    VARCHAR2(50)
);

-- Tabela: Abrigo
CREATE TABLE abrigo (
    id_abrigo      NUMBER PRIMARY KEY,
    nome           VARCHAR2(100) NOT NULL,
    capacidade     NUMBER NOT NULL CHECK (capacidade > 0),
    status         VARCHAR2(20) CHECK (status IN ('Ativo', 'Inativo', 'Esgotado')),
    id_localizacao NUMBER NOT NULL,
    CONSTRAINT fk_abrigo_localizacao FOREIGN KEY (id_localizacao)
        REFERENCES localizacao (id_localizacao)
);

-- Tabela: Recurso
CREATE TABLE recurso (
    id_recurso     NUMBER PRIMARY KEY,
    nome           VARCHAR2(50) NOT NULL,
    tipo           VARCHAR2(50) NOT NULL,
    unidade_medida VARCHAR2(20) NOT NULL
);

-- Tabela: Estoque_Recurso (Associação entre Abrigo e Recurso)
CREATE TABLE estoque_recurso (
    id_abrigo   NUMBER NOT NULL,
    id_recurso  NUMBER NOT NULL,
    quantidade  NUMBER NOT NULL CHECK (quantidade >= 0),
    PRIMARY KEY (id_abrigo, id_recurso),
    CONSTRAINT fk_estoque_abrigo FOREIGN KEY (id_abrigo)
        REFERENCES abrigo (id_abrigo),
    CONSTRAINT fk_estoque_recurso FOREIGN KEY (id_recurso)
        REFERENCES recurso (id_recurso)
);

-- Tabela: Ocupante
CREATE TABLE ocupante (
    id_ocupante  NUMBER PRIMARY KEY,
    nome         VARCHAR2(100) NOT NULL,
    idade        NUMBER NOT NULL CHECK (idade >= 0),
    genero       VARCHAR2(20) CHECK (genero IN ('Masculino', 'Feminino', 'Outro')),
    id_abrigo    NUMBER NOT NULL,
    CONSTRAINT fk_ocupante_abrigo FOREIGN KEY (id_abrigo)
        REFERENCES abrigo (id_abrigo)
);
