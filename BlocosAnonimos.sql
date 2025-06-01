SET SERVEROUTPUT ON;


DECLARE
    CURSOR c_ocupacao IS
        SELECT 
            a.nome AS nome_abrigo,
            a.capacidade,
            COUNT(o.id_ocupante) AS total_ocupantes
        FROM abrigo a
        LEFT JOIN ocupante o ON a.id_abrigo = o.id_abrigo
        GROUP BY a.id_abrigo, a.nome, a.capacidade;

    v_nome_abrigo     abrigo.nome%TYPE;
    v_capacidade      abrigo.capacidade%TYPE;
    v_total_ocupantes NUMBER;
BEGIN
    FOR abrigo_rec IN c_ocupacao LOOP
        v_nome_abrigo     := abrigo_rec.nome_abrigo;
        v_capacidade      := abrigo_rec.capacidade;
        v_total_ocupantes := abrigo_rec.total_ocupantes;

        IF v_total_ocupantes = 0 THEN
            DBMS_OUTPUT.PUT_LINE(v_nome_abrigo || ' ? Vazio');
        ELSIF v_total_ocupantes >= v_capacidade THEN
            DBMS_OUTPUT.PUT_LINE(v_nome_abrigo || ' ? Lotado');
        ELSE
            DBMS_OUTPUT.PUT_LINE(v_nome_abrigo || ' ? Ocupação Parcial');
        END IF;
    END LOOP;
END;
/


DECLARE
    CURSOR c_recursos IS
        SELECT 
            a.nome AS abrigo,
            r.nome AS recurso,
            er.quantidade
        FROM estoque_recurso er
        JOIN abrigo a ON er.id_abrigo = a.id_abrigo
        JOIN recurso r ON er.id_recurso = r.id_recurso
        WHERE er.quantidade > 100
        ORDER BY er.quantidade DESC;

    v_abrigo     abrigo.nome%TYPE;
    v_recurso    recurso.nome%TYPE;
    v_quantidade estoque_recurso.quantidade%TYPE;
BEGIN
    OPEN c_recursos;
    LOOP
        FETCH c_recursos INTO v_abrigo, v_recurso, v_quantidade;
        EXIT WHEN c_recursos%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Abrigo: ' || v_abrigo || 
                             ' | Recurso: ' || v_recurso || 
                             ' | Quantidade: ' || v_quantidade);
    END LOOP;
    CLOSE c_recursos;
END;
/

