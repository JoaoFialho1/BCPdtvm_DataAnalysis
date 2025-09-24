-- Suponho que esteja utilizando o H2 Database

-- ==========================================
-- Tabela debentures
-- ==========================================

-- Tabela XLS
WITH Caracteristicas AS (
    SELECT
        "Codigo do Ativo" AS Codigo,
        "Deb. Incent. (Lei 12.431)" AS Deb_Incentivada,
        "Data de Emissao" AS Data_Emissao
    FROM CSVREAD('Caracteristicas_Debentures.xls', 4)  -- pular 4 linhas
),

-- Tabela CSV
DATA_SET AS (
    SELECT
        Código AS Codigo,
        Nome,
        "Taxa Indicativa" AS Taxa_Indicativa,
        "Índice/ Correção" AS Indice_Correcao,
        PU
    FROM CSVREAD('Daily Prices/DATA_SET.csv')
),

-- Merge
Debentures_Merged AS (
    SELECT
        c.Codigo,
        d.Nome,
        c.Data_Emissao,
        c.Deb_Incentivada,
        d.Taxa_Indicativa,
        d.Indice_Correcao,
        d.PU
    FROM Caracteristicas c
    JOIN DATA_SET d ON c.Codigo = d.Codigo
)


-- ==========================================
-- CONSULTA 1
-- PU e Taxa Indicativa das debêntures incentivadas no dia mais recente
-- ==========================================
SELECT PU, Taxa_Indicativa
FROM Debentures_Merged
WHERE Deb_Incentivada = 'S'
ORDER BY Data_Emissao DESC
LIMIT 1;


-- ==========================================
-- CONSULTA 2
-- Códigos únicos de debêntures da empresa "VALE S/A"
-- ==========================================
SELECT DISTINCT Codigo
FROM Debentures_Merged
WHERE Nome LIKE 'VALE S/A%';


-- ==========================================
-- CONSULTA 3
-- Índice/Correção de todas as debêntures emitidas em 2025
-- ==========================================
SELECT
    Codigo,
    Indice_Correcao
FROM Debentures_Merged
WHERE YEAR(Data_Emissao) = 2025
ORDER BY Data_Emissao ASC;