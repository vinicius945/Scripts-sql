-- Consulta 1: Total de recursos por abrigo
SELECT 
    a.nome AS nome_abrigo,
    SUM(er.quantidade) AS total_recursos
FROM abrigo a
JOIN estoque_recurso er ON a.id_abrigo = er.id_abrigo
GROUP BY a.nome
ORDER BY total_recursos DESC;

-- Consulta 2: Quantidade de ocupantes por abrigo
SELECT 
    a.nome AS nome_abrigo,
    COUNT(o.id_ocupante) AS total_ocupantes
FROM abrigo a
LEFT JOIN ocupante o ON a.id_abrigo = o.id_abrigo
GROUP BY a.nome
ORDER BY total_ocupantes DESC;

-- Consulta 3: Abrigos com ocupa��o maior que 50% da capacidade
SELECT 
    a.nome AS nome_abrigo,
    a.capacidade,
    COUNT(o.id_ocupante) AS total_ocupantes,
    ROUND((COUNT(o.id_ocupante) / a.capacidade) * 100, 2) AS percentual_ocupado
FROM abrigo a
JOIN ocupante o ON a.id_abrigo = o.id_abrigo
GROUP BY a.id_abrigo, a.nome, a.capacidade
HAVING (COUNT(o.id_ocupante) / a.capacidade) > 0.5;

-- Consulta 4: Detalhes dos ocupantes e recursos do abrigo mais cheio (com subquery)
SELECT 
    o.nome AS nome_ocupante,
    o.idade,
    o.genero,
    r.nome AS recurso,
    er.quantidade
FROM ocupante o
JOIN abrigo a ON o.id_abrigo = a.id_abrigo
JOIN estoque_recurso er ON a.id_abrigo = er.id_abrigo
JOIN recurso r ON er.id_recurso = r.id_recurso
WHERE a.id_abrigo = (
    SELECT id_abrigo
    FROM (
        SELECT id_abrigo
        FROM ocupante
        GROUP BY id_abrigo
        ORDER BY COUNT(*) DESC
    ) WHERE ROWNUM = 1
);

-- Consulta 5: M�dia de idade dos ocupantes por cidade (com filtro e ordena��o)
SELECT 
    l.cidade,
    AVG(o.idade) AS media_idade
FROM localizacao l
JOIN abrigo a ON l.id_localizacao = a.id_localizacao
JOIN ocupante o ON a.id_abrigo = o.id_abrigo
GROUP BY l.cidade
HAVING AVG(o.idade) > 30
ORDER BY media_idade DESC;

