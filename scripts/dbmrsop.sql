DROP DATABASE MRSOP; 

CREATE DATABASE MRSOP CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE MRSOP;

CREATE TABLE CONTACTO(
    contacto_id         int auto_increment NOT NULL,
    nombre              varchar(100) NOT NULL,
    correo              varchar(100) NOT NULL,
    mensaje             varchar(500) NOT NULL,
    estatus             varchar(50) NOT NULL DEFAULT 'sin contestar',
    fecha_alta          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    CONSTRAINT pk_contacto PRIMARY KEY (contacto_id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE NEWSLETTER(
    newsletter_id       int auto_increment NOT NULL,
    correo              varchar(100) NOT NULL,
    estatus             varchar(50) NOT NULL DEFAULT 'sin usar',
    fecha_alta          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    CONSTRAINT pk_newsletter PRIMARY KEY (newsletter_id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE USUARIO(
    usuario_id          int auto_increment NOT NULL,
    correo              varchar(100) NOT NULL,
    nombre              varchar(100) NOT NULL DEFAULT 'pendiente',
    pass                varchar(100) NOT NULL,
    calle               varchar(100) NOT NULL DEFAULT 'pendiente',
    numero              varchar(50) NOT NULL DEFAULT 'pendiente',
    colonia             varchar(100) NOT NULL DEFAULT 'pendiente',
    telefono            varchar(100) NOT NULL DEFAULT 'pendiente',
    rol                 varchar(50) NOT NULL DEFAULT 'cliente',
    imagen              varchar(50) NOT NULL DEFAULT 'pendiente',
    fecha_alta          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    CONSTRAINT pk_usuario PRIMARY KEY (usuario_id),
    CONSTRAINT uq_correo UNIQUE (correo)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE SERVICIO(
    servicio_id         int auto_increment NOT NULL,
    usuario_id          int NOT NULL,
    nombre              varchar(100) NOT NULL,
    descripcion         varchar(200) NOT NULL,
    precio              float NOT NULL,
    tipo                varchar(50) NOT NULL DEFAULT 'servicio',
    estatus             varchar(50) NOT NULL DEFAULT 'inactivo',
    descuento           float NOT NULL,
    imagen              varchar(50) NOT NULL,
    fecha_alta          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    CONSTRAINT pk_servicio PRIMARY KEY (servicio_id),
    CONSTRAINT fk_servicio_usuario FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id),
    CONSTRAINT uq_imagen UNIQUE (imagen)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE FACTURA(
    factura_id          int auto_increment NOT NULL,
    usuario_id          int NOT NULL,
    total               float NOT NULL DEFAULT 0,
    adelanto            float NOT NULL DEFAULT 0,
    pagado              bit NOT NULL DEFAULT 0,
    estatus             varchar(50) NOT NULL DEFAULT "activa",
    fecha_alta          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    CONSTRAINT pk_factura PRIMARY KEY (factura_id),
    CONSTRAINT fk_factura_usuario FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE FACTURADESCRIPCION(
    facturadescripcion_id   int auto_increment NOT NULL,
    factura_id              int NOT NULL,
    servicio_id             int NOT NULL,
    precio                  float NOT NULL DEFAULT 0,
    fecha_alta              timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion      timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    CONSTRAINT pk_facturadescripcion PRIMARY KEY (facturadescripcion_id),
    CONSTRAINT fk_facturadescripcion_factura FOREIGN KEY (factura_id) REFERENCES FACTURA(factura_id),
    CONSTRAINT fk_facturadescripcion_servicio FOREIGN KEY (servicio_id) REFERENCES SERVICIO(servicio_id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE NOTIFICACION(
    notificacion_id     int auto_increment NOT NULL,
    usuario_envia_id    int NOT NULL,
    usuario_recibe_id   int NOT NULL,
    factura_id          int NOT NULL,
    tipo                varchar(100) NOT NULL DEFAULT "Pregunta",
    mensaje             varchar(500) NOT NULL DEFAULT "default",
    estado              varchar(50) NOT NULL DEFAULT "recibido",
    fecha_alta          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_leido         timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    CONSTRAINT pk_notificacion PRIMARY KEY (notificacion_id),
    CONSTRAINT fk_notificacion_usuario_envia FOREIGN KEY (usuario_envia_id) REFERENCES USUARIO(usuario_id),
    CONSTRAINT fk_notificacion_usuario_recibe FOREIGN KEY (usuario_recibe_id) REFERENCES USUARIO(usuario_id),
    CONSTRAINT fk_notificacion_factura FOREIGN KEY (factura_id) REFERENCES FACTURA(factura_id)
)ENGINE=InnoDb DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;