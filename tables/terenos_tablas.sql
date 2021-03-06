-- Generated by Oracle SQL Developer Data Modeler 18.3.0.268.1156
--   at:        2019-02-06 21:51:34 COT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g


CREATE TABLE sv_estados (
    id_estado     NUMBER NOT NULL,
    descripcion   VARCHAR2(1000 CHAR) NOT NULL
);

ALTER TABLE sv_estados ADD CONSTRAINT sv_estados_pk PRIMARY KEY ( id_estado );

CREATE TABLE sv_manzanas (
    id_manzana    NUMBER NOT NULL,
    descripcion   VARCHAR2(1000 CHAR) NOT NULL
);

ALTER TABLE sv_manzanas ADD CONSTRAINT sv_manzanas_pk PRIMARY KEY ( id_manzana );

CREATE TABLE sv_organizaciones (
    id_organizacion   NUMBER NOT NULL,
    descripcion       VARCHAR2(1000 CHAR) NOT NULL
);

ALTER TABLE sv_organizaciones ADD CONSTRAINT sv_organizaciones_pk PRIMARY KEY ( id_organizacion );

CREATE TABLE sv_propietarios (
    id_propietario   NUMBER NOT NULL,
    nombres          VARCHAR2(1000 CHAR) NOT NULL,
    apellidos        VARCHAR2(1000 CHAR) NOT NULL,
    dni              NUMBER NOT NULL,
    telefono         NUMBER NOT NULL,
    direccion        VARCHAR2(4000 CHAR),
    comentario       VARCHAR2(4000 CHAR),
    activo_fl        VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL
);

ALTER TABLE sv_propietarios ADD CONSTRAINT sv_propietarios_pk PRIMARY KEY ( id_propietario );

CREATE TABLE sv_terreno_comentarios (
    id_comentario      NUMBER NOT NULL,
    id_terreno         NUMBER NOT NULL,
    comentario         VARCHAR2(4000 CHAR) NOT NULL,
    fecha              DATE NOT NULL,
    usuario_registra   VARCHAR2(1000 CHAR) NOT NULL
);

ALTER TABLE sv_terreno_comentarios ADD CONSTRAINT sv_terreno_comentarios_pk PRIMARY KEY ( id_comentario );

CREATE TABLE sv_terreno_pagos (
    id_pago            NUMBER NOT NULL,
    id_terreno         NUMBER NOT NULL,
    comentario         VARCHAR2(4000 CHAR) NOT NULL,
    fecha_pago         DATE NOT NULL,
    monto              NUMBER(10, 2) NOT NULL,
    forma_pago         VARCHAR2(1000 CHAR),
    usuario_registra   VARCHAR2(1000 CHAR) NOT NULL
);

ALTER TABLE sv_terreno_pagos ADD CONSTRAINT sv_terreno_pagos_pk PRIMARY KEY ( id_pago );

CREATE TABLE sv_terrenos (
    id_terreno        NUMBER NOT NULL,
    id_organizacion   NUMBER NOT NULL,
    id_manzana        NUMBER NOT NULL,
    id_estado         NUMBER NOT NULL,
    id_propietario    NUMBER NOT NULL,
    numero_lote       NUMBER,
    area_m2           NUMBER(10, 2) NOT NULL,
    descripcion       VARCHAR2(1000 CHAR) NOT NULL,
    comentario        VARCHAR2(4000 CHAR),
    precio_venta      NUMBER(10, 2),
    fecha_venta       DATE,
    activo_fl         VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL
);

ALTER TABLE sv_terrenos ADD CONSTRAINT sv_terrenos_pk PRIMARY KEY ( id_terreno );

 
ALTER TABLE sv_terrenos
    ADD CONSTRAINT sv_ter_sv_estados_fk FOREIGN KEY ( id_estado )
        REFERENCES sv_estados ( id_estado );

ALTER TABLE sv_terrenos
    ADD CONSTRAINT sv_ter_sv_manzanas_fk FOREIGN KEY ( id_manzana )
        REFERENCES sv_manzanas ( id_manzana );

ALTER TABLE sv_terrenos
    ADD CONSTRAINT sv_ter_sv_organizaciones_fk FOREIGN KEY ( id_organizacion )
        REFERENCES sv_organizaciones ( id_organizacion );

ALTER TABLE sv_terrenos
    ADD CONSTRAINT sv_ter_sv_propietarios_fk FOREIGN KEY ( id_propietario )
        REFERENCES sv_propietarios ( id_propietario );

ALTER TABLE sv_terreno_comentarios
    ADD CONSTRAINT sv_terreno_comentarios_fk FOREIGN KEY ( id_terreno )
        REFERENCES sv_terrenos ( id_terreno );

ALTER TABLE sv_terreno_pagos
    ADD CONSTRAINT sv_terreno_pagos_fk FOREIGN KEY ( id_terreno )
        REFERENCES sv_terrenos ( id_terreno );

CREATE SEQUENCE sv_estados_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER sv_estados_trg_bi BEFORE
    INSERT ON sv_estados
    FOR EACH ROW
    WHEN ( new.id_estado IS NULL )
BEGIN
    :new.id_estado := sv_estados_seq.nextval;
END;
/

CREATE SEQUENCE sv_manzanas_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER sv_manzanas_trg_bi BEFORE
    INSERT ON sv_manzanas
    FOR EACH ROW
    WHEN ( new.id_manzana IS NULL )
BEGIN
    :new.id_manzana := sv_manzanas_seq.nextval;
END;
/

CREATE SEQUENCE sv_organizaciones_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER sv_organizaciones_trg_bi BEFORE
    INSERT ON sv_organizaciones
    FOR EACH ROW
    WHEN ( new.id_organizacion IS NULL )
BEGIN
    :new.id_organizacion := sv_organizaciones_seq.nextval;
END;
/

CREATE SEQUENCE sv_propietarios_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER sv_propietarios_trg_bi BEFORE
    INSERT ON sv_propietarios
    FOR EACH ROW
    WHEN ( new.id_propietario IS NULL )
BEGIN
    :new.id_propietario := sv_propietarios_seq.nextval;
END;
/

CREATE SEQUENCE sv_terrenos_com_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER sv_terrenos_com_trg_bi BEFORE
    INSERT ON sv_terreno_comentarios
    FOR EACH ROW
    WHEN ( new.id_comentario IS NULL )
BEGIN
    :new.id_comentario := sv_terrenos_com_seq.nextval;
END;
/

CREATE SEQUENCE sv_terreno_pago_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER sv_terreno_pago_trg_bi BEFORE
    INSERT ON sv_terreno_pagos
    FOR EACH ROW
    WHEN ( new.id_pago IS NULL )
BEGIN
    :new.id_pago := sv_terreno_pago_seq.nextval;
END;
/

CREATE SEQUENCE sv_terrenos_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER sv_terrenos_trg_bi BEFORE
    INSERT ON sv_terrenos
    FOR EACH ROW
    WHEN ( new.id_terreno IS NULL )
BEGIN
    :new.id_terreno := sv_terrenos_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             12
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           7
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          7
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
