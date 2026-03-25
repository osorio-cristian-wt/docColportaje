-- ============================================================================
-- ESQUEMA BASE DE DATOS - SISTEMA DE COLPORTAJE
-- Versión Simplificada: Tabla Intermedia "Espacio"
-- ============================================================================

-- ============================================================================
-- TABLAS BASE
-- ============================================================================

CREATE TABLE ciudad (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE,
  pais VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE zona (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  pk_ciudad INTEGER NOT NULL REFERENCES ciudad(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(pk_ciudad, nombre)
);

CREATE TABLE ubicacion (
  id SERIAL PRIMARY KEY,
  tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('CASA', 'NEGOCIO', 'EDIFICIO')),
  calle VARCHAR(255) NOT NULL,
  numero VARCHAR(50) NOT NULL,
  lat DECIMAL(10, 8),
  long DECIMAL(11, 8),
  pk_zona INTEGER NOT NULL REFERENCES zona(id) ON DELETE RESTRICT,
  pk_ciudad INTEGER NOT NULL REFERENCES ciudad(id) ON DELETE RESTRICT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE espacio (
  id SERIAL PRIMARY KEY,
  pk_ubicacion INTEGER NOT NULL REFERENCES ubicacion(id) ON DELETE CASCADE,
  numero_depto VARCHAR(20),
  piso SMALLINT,
  descripcion VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- ENTIDADES DE NEGOCIO
-- ============================================================================

CREATE TABLE persona (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  telefono VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE espacio_persona (
  id SERIAL PRIMARY KEY,
  pk_espacio INTEGER NOT NULL REFERENCES espacio(id) ON DELETE CASCADE,
  pk_persona INTEGER NOT NULL REFERENCES persona(id) ON DELETE RESTRICT,
  pk_ubicacion_cobranza_alt INTEGER REFERENCES ubicacion(id) ON DELETE SET NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(pk_espacio, pk_persona)
);

-- ============================================================================
-- USUARIO
-- ============================================================================

CREATE TABLE usuario (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  rol VARCHAR(30) CHECK (rol IN ('COLPORTOR', 'COORDINADOR', 'ASISTENTE', 'ACOMPAÑANTE', 'ADMIN')),
  pk_zona INTEGER REFERENCES zona(id) ON DELETE SET NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- OPERACIONES
-- ============================================================================

CREATE TABLE visita (
  id SERIAL PRIMARY KEY,
  pk_espacio_persona INTEGER NOT NULL REFERENCES espacio_persona(id) ON DELETE RESTRICT,
  fecha TIMESTAMP NOT NULL,
  tipo_resultado VARCHAR(50) CHECK (tipo_resultado IN ('VENTA', 'NO_CONTESTO', 'RECHAZO', 'ENTREVISTA')),
  notas TEXT,
  pk_colportor INTEGER NOT NULL REFERENCES usuario(id) ON DELETE RESTRICT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE agenda (
  id SERIAL PRIMARY KEY,
  pk_espacio_persona INTEGER NOT NULL REFERENCES espacio_persona(id) ON DELETE RESTRICT,
  tipo VARCHAR(50) CHECK (tipo IN ('ENTREVISTA', 'COBRANZA')),
  fecha_programada TIMESTAMP NOT NULL,
  pk_ubicacion_alt INTEGER REFERENCES ubicacion(id) ON DELETE SET NULL,
  estado VARCHAR(30) CHECK (estado IN ('PENDIENTE', 'COMPLETADA', 'CANCELADA')),
  pk_colportor INTEGER REFERENCES usuario(id) ON DELETE SET NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE venta (
  id SERIAL PRIMARY KEY,
  pk_persona INTEGER NOT NULL REFERENCES persona(id) ON DELETE RESTRICT,
  pk_espacio_persona INTEGER NOT NULL REFERENCES espacio_persona(id) ON DELETE RESTRICT,
  numero_talonario VARCHAR(50) NOT NULL,
  monto DECIMAL(10, 2) NOT NULL,
  fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  pk_colportor INTEGER NOT NULL REFERENCES usuario(id) ON DELETE RESTRICT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- ÍNDICES
-- ============================================================================

CREATE INDEX idx_espacio_pk_ubicacion ON espacio(pk_ubicacion);
CREATE INDEX idx_ubicacion_pk_zona ON ubicacion(pk_zona);
CREATE INDEX idx_visita_pk_espacio_persona ON visita(pk_espacio_persona);
CREATE INDEX idx_visita_fecha ON visita(fecha DESC);
CREATE INDEX idx_agenda_pk_espacio_persona ON agenda(pk_espacio_persona);
CREATE INDEX idx_agenda_fecha_programada ON agenda(fecha_programada);
CREATE INDEX idx_espacio_persona_pk_persona ON espacio_persona(pk_persona);
CREATE INDEX idx_usuario_pk_zona ON usuario(pk_zona);