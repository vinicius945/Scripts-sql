--Procedure de Inser��o, Update, Delete da tabela Localiza��o --
CREATE OR REPLACE PROCEDURE inserir_localizacao (
    p_id_localizacao IN NUMBER,
    p_cidade         IN VARCHAR2,
    p_estado         IN VARCHAR2,
    p_cep            IN VARCHAR2,
    p_rua            IN VARCHAR2,
    p_numero         IN VARCHAR2,
    p_complemento    IN VARCHAR2
) AS
BEGIN
    INSERT INTO localizacao VALUES (p_id_localizacao, p_cidade, p_estado, p_cep, p_rua, p_numero, p_complemento);
END;
/

-- Atualiza��o
CREATE OR REPLACE PROCEDURE atualizar_localizacao (
    p_id_localizacao IN NUMBER,
    p_cidade         IN VARCHAR2,
    p_estado         IN VARCHAR2,
    p_cep            IN VARCHAR2,
    p_rua            IN VARCHAR2,
    p_numero         IN VARCHAR2,
    p_complemento    IN VARCHAR2
) AS
BEGIN
    UPDATE localizacao
    SET cidade = p_cidade,
        estado = p_estado,
        cep = p_cep,
        rua = p_rua,
        numero = p_numero,
        complemento = p_complemento
    WHERE id_localizacao = p_id_localizacao;
END;
/

-- Exclus�o
CREATE OR REPLACE PROCEDURE deletar_localizacao (
    p_id_localizacao IN NUMBER
) AS
BEGIN
    DELETE FROM localizacao WHERE id_localizacao = p_id_localizacao;
END;
/

--Procedure de Inser��o, Update, Delete da tabela Abrigo --
CREATE OR REPLACE PROCEDURE inserir_abrigo (
    p_id_abrigo      IN NUMBER,
    p_nome           IN VARCHAR2,
    p_capacidade     IN NUMBER,
    p_status         IN VARCHAR2,
    p_id_localizacao IN NUMBER
) AS
BEGIN
    INSERT INTO abrigo VALUES (p_id_abrigo, p_nome, p_capacidade, p_status, p_id_localizacao);
END;
/

CREATE OR REPLACE PROCEDURE atualizar_abrigo (
    p_id_abrigo      IN NUMBER,
    p_nome           IN VARCHAR2,
    p_capacidade     IN NUMBER,
    p_status         IN VARCHAR2,
    p_id_localizacao IN NUMBER
) AS
BEGIN
    UPDATE abrigo
    SET nome = p_nome,
        capacidade = p_capacidade,
        status = p_status,
        id_localizacao = p_id_localizacao
    WHERE id_abrigo = p_id_abrigo;
END;
/

CREATE OR REPLACE PROCEDURE deletar_abrigo (
    p_id_abrigo IN NUMBER
) AS
BEGIN
    DELETE FROM abrigo WHERE id_abrigo = p_id_abrigo;
END;
/

--Procedure de Inser��o, Update, Delete da tabela Recurso --
CREATE OR REPLACE PROCEDURE inserir_recurso (
    p_id_recurso     IN NUMBER,
    p_nome           IN VARCHAR2,
    p_tipo           IN VARCHAR2,
    p_unidade_medida IN VARCHAR2
) AS
BEGIN
    INSERT INTO recurso VALUES (p_id_recurso, p_nome, p_tipo, p_unidade_medida);
END;
/

CREATE OR REPLACE PROCEDURE atualizar_recurso (
    p_id_recurso     IN NUMBER,
    p_nome           IN VARCHAR2,
    p_tipo           IN VARCHAR2,
    p_unidade_medida IN VARCHAR2
) AS
BEGIN
    UPDATE recurso
    SET nome = p_nome,
        tipo = p_tipo,
        unidade_medida = p_unidade_medida
    WHERE id_recurso = p_id_recurso;
END;
/

CREATE OR REPLACE PROCEDURE deletar_recurso (
    p_id_recurso IN NUMBER
) AS
BEGIN
    DELETE FROM recurso WHERE id_recurso = p_id_recurso;
END;
/


CREATE OR REPLACE PROCEDURE inserir_estoque (
    p_id_abrigo   IN NUMBER,
    p_id_recurso  IN NUMBER,
    p_quantidade  IN NUMBER
) AS
BEGIN
    INSERT INTO estoque_recurso VALUES (p_id_abrigo, p_id_recurso, p_quantidade);
END;
/

CREATE OR REPLACE PROCEDURE atualizar_estoque (
    p_id_abrigo   IN NUMBER,
    p_id_recurso  IN NUMBER,
    p_quantidade  IN NUMBER
) AS
BEGIN
    UPDATE estoque_recurso
    SET quantidade = p_quantidade
    WHERE id_abrigo = p_id_abrigo AND id_recurso = p_id_recurso;
END;
/

CREATE OR REPLACE PROCEDURE deletar_estoque (
    p_id_abrigo   IN NUMBER,
    p_id_recurso  IN NUMBER
) AS
BEGIN
    DELETE FROM estoque_recurso
    WHERE id_abrigo = p_id_abrigo AND id_recurso = p_id_recurso;
END;
/

--Procedure de Inser��o, Update, Delete da tabela Ocupante --
CREATE OR REPLACE PROCEDURE inserir_ocupante (
    p_id_ocupante IN NUMBER,
    p_nome        IN VARCHAR2,
    p_idade       IN NUMBER,
    p_genero      IN VARCHAR2,
    p_id_abrigo   IN NUMBER
) AS
BEGIN
    INSERT INTO ocupante VALUES (p_id_ocupante, p_nome, p_idade, p_genero, p_id_abrigo);
END;
/

CREATE OR REPLACE PROCEDURE atualizar_ocupante (
    p_id_ocupante IN NUMBER,
    p_nome        IN VARCHAR2,
    p_idade       IN NUMBER,
    p_genero      IN VARCHAR2,
    p_id_abrigo   IN NUMBER
) AS
BEGIN
    UPDATE ocupante
    SET nome = p_nome,
        idade = p_idade,
        genero = p_genero,
        id_abrigo = p_id_abrigo
    WHERE id_ocupante = p_id_ocupante;
END;
/

CREATE OR REPLACE PROCEDURE deletar_ocupante (
    p_id_ocupante IN NUMBER
) AS
BEGIN
    DELETE FROM ocupante WHERE id_ocupante = p_id_ocupante;
END;
/

-- Executando as Procedures de inser��es --
EXEC inserir_localizacao(1, 'S�o Paulo', 'SP', '01000-000', 'Rua A', '100', NULL);
EXEC inserir_localizacao(2, 'Campinas', 'SP', '13000-000', 'Av. Brasil', '200', 'Pr�x. Shopping');
EXEC inserir_localizacao(3, 'Santos', 'SP', '11000-000', 'Rua do Porto', '10', NULL);
EXEC inserir_localizacao(4, 'Rio de Janeiro', 'RJ', '22000-000', 'Rua Mar', '303', 'Bloco B');
EXEC inserir_localizacao(5, 'Belo Horizonte', 'MG', '30100-000', 'Av. Amazonas', '50', NULL);

EXEC inserir_abrigo(1, 'Abrigo Central', 100, 'Ativo', 1);
EXEC inserir_abrigo(2, 'Abrigo Zona Norte', 80, 'Ativo', 2);
EXEC inserir_abrigo(3, 'Abrigo Litoral', 60, 'Inativo', 3);
EXEC inserir_abrigo(4, 'Abrigo RJ', 120, 'Ativo', 4);
EXEC inserir_abrigo(5, 'Abrigo BH', 90, 'Esgotado', 5);


EXEC inserir_recurso(1, '�gua Mineral', 'Alimento', 'litros');
EXEC inserir_recurso(2, 'Colch�o', 'Equipamento', 'unidade');
EXEC inserir_recurso(3, 'Kit Higiene', 'Suprimento', 'pacote');
EXEC inserir_recurso(4, 'Comida Enlatada', 'Alimento', 'kg');
EXEC inserir_recurso(5, 'Cobertor', 'Equipamento', 'unidade');


EXEC inserir_ocupante(1, 'Jo�o Silva', 34, 'Masculino', 1);
EXEC inserir_ocupante(2, 'Maria Souza', 29, 'Feminino', 1);
EXEC inserir_ocupante(3, 'Carlos Dias', 40, 'Masculino', 2);
EXEC inserir_ocupante(4, 'Ana Lima', 25, 'Feminino', 4);
EXEC inserir_ocupante(5, 'Rafael Costa', 50, 'Masculino', 5);
EXEC inserir_ocupante(6, 'Lucas Nogueira', 35, 'Masculino', 1);
EXEC inserir_ocupante(7, 'Juliana Ramos', 22, 'Feminino', 1);
EXEC inserir_ocupante(8, 'Paulo Oliveira', 31, 'Masculino', 1);
EXEC inserir_ocupante(9, 'Larissa Silva', 26, 'Feminino', 1);
EXEC inserir_ocupante(10, 'Marcos Lima', 45, 'Masculino', 1);
EXEC inserir_ocupante(11, 'Fernanda Dias', 38, 'Feminino', 1);
EXEC inserir_ocupante(12, 'Eduardo Pires', 29, 'Masculino', 1);
EXEC inserir_ocupante(13, 'Camila Sousa', 19, 'Feminino', 1);
EXEC inserir_ocupante(14, 'Daniel Rocha', 60, 'Masculino', 1);
EXEC inserir_ocupante(15, 'Priscila Torres', 28, 'Feminino', 1);
EXEC inserir_ocupante(16, 'Thiago Melo', 27, 'Masculino', 1);
EXEC inserir_ocupante(17, 'Rita Lopes', 41, 'Feminino', 1);


EXEC inserir_estoque(1, 1, 500);
EXEC inserir_estoque(1, 2, 100);
EXEC inserir_estoque(2, 3, 50);
EXEC inserir_estoque(4, 4, 300);
EXEC inserir_estoque(5, 5, 70);


COMMIT;



