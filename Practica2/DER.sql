-- ========================================================
-- MODELO ENTIDAD-RELACIÓN: PRÁCTICA SALUD MENTAL
-- ========================================================

-- 1. Entidad Maestra
CREATE TABLE INDICADOR (
    Indicator VARCHAR(255) PRIMARY KEY, -- Nombre del indicador como llave
    nombre_indicador TEXT
);

-- 2. Entidad Geográfica
CREATE TABLE ESTADO (
    State VARCHAR(100) PRIMARY KEY, -- El nombre del estado es la llave
    nombre_estado TEXT
);

-- 3. Entidad de Población
CREATE TABLE DEMOGRAFÍA (
    Subgroup VARCHAR(100) PRIMARY KEY, -- Ej: 'Male'
    "Group" VARCHAR(100)                -- Atributo descriptivo (Ej: 'By Sex')
);

-- 4. Entidad Temporal
CREATE TABLE TIEMPO (
    "Time Period" INT PRIMARY KEY,
    Phase VARCHAR(50),
    "Time Period Start Date" DATE,
    "Time Period End Date" DATE
);

-- 5. Entidad Central (Tabla de Hechos)
CREATE TABLE MEDICIÓN (
    medicion_id SERIAL PRIMARY KEY,
    Indicator VARCHAR(255),
    State VARCHAR(100),
    Subgroup VARCHAR(100),
    "Time Period" INT,
    
    -- Variables numéricas con precisión DECIMAL(5,2)
    Value DECIMAL(5,2), 
    LowCI DECIMAL(5,2),
    HighCI DECIMAL(5,2),

    CONSTRAINT fk_indicador FOREIGN KEY (Indicator) REFERENCES INDICADOR(Indicator),
    CONSTRAINT fk_estado FOREIGN KEY (State) REFERENCES ESTADO(State),
    CONSTRAINT fk_demografia FOREIGN KEY (Subgroup) REFERENCES DEMOGRAFÍA(Subgroup),
    CONSTRAINT fk_tiempo FOREIGN KEY ("Time Period") REFERENCES TIEMPO("Time Period")
);