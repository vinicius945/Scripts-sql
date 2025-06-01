CREATE OR REPLACE FUNCTION total_recursos_por_abrigo (
    p_id_abrigo IN NUMBER
) RETURN NUMBER IS
    v_total NUMBER;
BEGIN
    SELECT SUM(quantidade)
    INTO v_total
    FROM estoque_recurso
    WHERE id_abrigo = p_id_abrigo;

    RETURN NVL(v_total, 0); -- Se n�o houver recursos, retorna 0
END;
/


BEGIN
    DBMS_OUTPUT.PUT_LINE('Total de recursos no abrigo 1: ' || total_recursos_por_abrigo(1));
END;

CREATE OR REPLACE FUNCTION media_idade_ocupantes (
    p_id_abrigo IN NUMBER
) RETURN NUMBER IS
    v_media NUMBER;
BEGIN
    SELECT AVG(idade)
    INTO v_media
    FROM ocupante
    WHERE id_abrigo = p_id_abrigo;

    RETURN NVL(v_media, 0); -- Caso n�o tenha ocupantes, retorna 0
END;
/


BEGIN
    DBMS_OUTPUT.PUT_LINE('M�dia de idade dos ocupantes no abrigo 1: ' || media_idade_ocupantes(1));
END;






