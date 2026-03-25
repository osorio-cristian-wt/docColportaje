# Especificación de Requisitos de Software (ERS)
## Sistema de Colportaje - Colportaje App

**Versión 1.2**

| Campo | Valor |
|-------|-------|
| **Organización** | Unión Uruguaya de la Iglesia Adventista del Séptimo Día |
| **Fecha** | 25 de marzo de 2026 |
| **Estándar** | IEEE 830-1998 |

---

## Tabla de Contenidos

1. [Introducción](#1-introducción)
   - 1.1 [Propósito](#11-propósito)
   - 1.2 [Alcance](#12-alcance)
   - 1.3 [Definiciones, acrónimos y abreviaturas](#13-definiciones-acrónimos-y-abreviaturas)
   - 1.4 [Referencias](#14-referencias)
   - 1.5 [Visión general del documento](#15-visión-general-del-documento)
2. [Descripción General](#2-descripción-general)
   - 2.1 [Perspectiva del producto](#21-perspectiva-del-producto)
   - 2.2 [Funciones del producto](#22-funciones-del-producto)
   - 2.3 [Características de los usuarios](#23-características-de-los-usuarios)
   - 2.4 [Restricciones](#24-restricciones)
   - 2.5 [Suposiciones y dependencias](#25-suposiciones-y-dependencias)
3. [Requisitos Específicos](#3-requisitos-específicos)
   - 3.1 [Requisitos funcionales](#31-requisitos-funcionales)
   - 3.2 [Requisitos de interfaz externa](#32-requisitos-de-interfaz-externa)
   - 3.3 [Requisitos de rendimiento](#33-requisitos-de-rendimiento)
   - 3.4 [Restricciones de diseño](#34-restricciones-de-diseño)
   - 3.5 [Atributos del sistema](#35-atributos-del-sistema)
   - 3.6 [Otros requisitos](#36-otros-requisitos)

---

## 1. Introducción

### 1.1 Propósito

El presente documento tiene como propósito definir los requisitos funcionales y no funcionales del sistema **Colportaje App**, una aplicación destinada a la gestión integral de las actividades de colportaje de la Unión Uruguaya de la Iglesia Adventista del Séptimo Día.

Este documento está dirigido a:
- Equipo de desarrollo
- Coordinadores de colportaje
- Administradores del sistema
- Stakeholders de la organización

### 1.2 Alcance

**Colportaje App** es un sistema multiplataforma (aplicación móvil y panel web) que permitirá:

- Gestionar el registro y seguimiento de casas, clientes y visitas
- Administrar entregas, cobranzas y stock de materiales
- Controlar las jornadas de trabajo de los colportores
- Gestionar campañas y el sistema de becas para estudiantes
- Generar reportes y estadísticas para coordinadores y administradores
- Visualizar el avance de ventas a nivel nacional

El sistema busca optimizar el proceso de colportaje, facilitando el financiamiento de estudios de los colportores eventuales a través del sistema de becas, y mejorando la eficiencia operativa de los colportores permanentes.

**Beneficios esperados:**
- Reducción de errores en el registro manual de ventas y cobranzas
- Mejor planificación de rutas y visitas
- Control financiero transparente para colportores y coordinadores
- Toma de decisiones basada en datos para la administración

### 1.3 Definiciones, acrónimos y abreviaturas

| Término | Definición |
|---------|------------|
| **Colportor** | Persona que realiza venta de literatura puerta a puerta. Puede ser eventual (campañas) o permanente (todo el año). |
| **Coordinador** | Responsable de gestionar un grupo de colportores, asignar zonas y supervisar el avance. Incluye funciones de asistente financiero y acompañante. |
| **Administrador** | Usuario con acceso completo al sistema para gestión global. |
| **Campaña** | Período de tiempo definido para la actividad de colportaje (verano: 3 meses, invierno: 1 mes, permanente: varios meses). |
| **Beca** | Bonificación otorgada al colportor al cumplir una meta de libros bonificables, destinada a financiar sus estudios. |
| **Media Beca** | Cumplimiento parcial de la meta de libros (ej: 60/120). |
| **Beca Completa** | Cumplimiento total de la meta de libros (ej: 180/180). |
| **Material Bonificable** | Producto cuya venta cuenta para el cálculo de la beca. |
| **Material No Bonificable** | Productos de uso (mochilas, uniformes) o misioneros que no cuentan para la beca. |
| **Misionero** | Libro de bajo costo que se deja a colaboración cuando no se concreta una venta. |
| **Espacio** | Punto de contacto dentro de una ubicación (departamento en edificio, local en negocio). |
| **Ubicación** | Dirección física que puede ser CASA, NEGOCIO o EDIFICIO. |
| **Zona** | Área geográfica asignada a uno o más colportores dentro de una ciudad. |
| **Talonario** | Recibo físico utilizado por el colportor para registrar ventas. |
| **Casa Editora** | Entidad que provee los materiales de venta (ACES u otra). |
| **ERS** | Especificación de Requisitos de Software. |
| **IASD** | Iglesia Adventista del Séptimo Día. |

### 1.4 Referencias

| Documento | Descripción |
|-----------|-------------|
| IEEE 830-1998 | Práctica recomendada para especificaciones de requisitos de software |
| Esquema de Base de Datos | `esquema.sql` - Borrador del modelo de datos local del sistema |
| Decisiones de Diseño | `decisioneDiseño.md` - Documento de decisiones arquitectónicas |

### 1.5 Visión general del documento

- **Sección 2** describe el contexto general del sistema, sus funciones principales, usuarios y restricciones.
- **Sección 3** detalla los requisitos específicos organizados por módulo funcional, interfaz, rendimiento y atributos de calidad.

---

## 2. Descripción General

### 2.1 Perspectiva del producto

Colportaje App es un sistema nuevo que reemplazará los procesos manuales actuales de registro y seguimiento de colportaje. El sistema implementa una **arquitectura híbrida local/cloud** diseñada para minimizar costos de operación y maximizar la privacidad de los datos.

#### Arquitectura Híbrida Local/Cloud

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           COLPORTAJE APP                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                        APP MÓVIL (Colportores)                       │   │
│  ├─────────────────────────────────────────────────────────────────────┤   │
│  │  ┌─────────────────────────┐    ┌─────────────────────────────┐    │   │
│  │  │   ALMACENAMIENTO LOCAL  │    │      DATOS CLOUD (Sync)     │    │   │
│  │  │  (DB local + cifrado)   │    │                             │    │   │
│  │  ├─────────────────────────┤    ├─────────────────────────────┤    │   │
│  │  │ • Datos de clientes     │    │ • Estado de casas/visitas   │    │   │
│  │  │ • Información personal  │    │ • Avance de zona            │    │   │
│  │  │ • Notas privadas        │    │ • Estadísticas agregadas    │    │   │
│  │  │ • Historial completo    │    │ • Resultados de visitas     │    │   │
│  │  └───────────┬─────────────┘    └──────────────┬──────────────┘    │   │
│  │              │                                  │                   │   │
│  │              ▼                                  ▼                   │   │
│  │  ┌─────────────────────────┐    ┌─────────────────────────────┐    │   │
│  │  │   Backup a nube personal│    │   Sync por lotes (Delta)    │    │   │
│  │  │ (proveedor a definir)   │    │   (minimiza peticiones)     │    │   │
│  │  └─────────────────────────┘    └──────────────┬──────────────┘    │   │
│  └─────────────────────────────────────────────────┼───────────────────┘   │
│                                                    │                       │
│  ┌─────────────────────────────────────────────────┼───────────────────┐   │
│  │                      PANEL WEB (Coordinadores/Admin)                │   │
│  └─────────────────────────────────────────────────┼───────────────────┘   │
│                                                    │                       │
│                                                    ▼                       │
│                              ┌─────────────────────────────────┐           │
│                              │      CLOUD (a definir)          │           │
│                              ├─────────────────────────────────┤           │
│                              │ • Autenticación                 │           │
│                              │ • Estado de ubicaciones/visitas │           │
│                              │ • Catálogos (delta sync)        │           │
│                              │ • Estadísticas agregadas        │           │
│                              │ • Stock y movimientos           │           │
│                              │ • Estado de cuenta colportor    │           │
│                              │ • SIN datos personales clientes │           │
│                              └─────────────────────────────────┘           │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

#### Distribución de Datos

| Tipo de Dato | Almacenamiento | Justificación |
|--------------|----------------|---------------|
| Datos de clientes (nombre, teléfono, notas) | **Local (DB encriptada)** | Privacidad, reducción de costos cloud |
| Estado de ubicaciones/visitas | **Cloud (backend a definir)** | Necesario para reportes y coordinación |
| Catálogo de productos | **Cloud → Local (delta sync)** | Se descarga una vez y actualiza solo cambios |
| Historial de visitas detallado | **Local** | Alto volumen, bajo valor para coordinador |
| Estadísticas agregadas | **Cloud** | Necesario para dashboards |
| Estado de cuenta del colportor, pedidos, stock y pagos | **Cloud** | Necesario para control coordinador/administración |
| Backups de datos locales | **Nube del usuario/organización (a definir)** | Control del usuario y/o política institucional |

**Interfaces del sistema:**

1. **Aplicación móvil**: Para uso de colportores en campo, con almacenamiento local encriptado.
2. **Panel web**: Para coordinadores y administradores.
3. **API REST**: Comunicación mínima mediante sincronización por lotes (delta).
4. **Autenticación**: Servicio de autenticación (email/contraseña) a definir.
5. **Backup**: Integración con servicio de almacenamiento cloud para respaldo de datos locales (a definir).

### 2.2 Funciones del producto

El sistema se desarrollará en tres versiones incrementales:

#### Versión 1 (V1) - Funcionalidad Base

**Módulo Colportor:**
- RF-C01: Registrar ubicaciones (casas, negocios, edificios)
- RF-C02: Registrar espacios dentro de ubicaciones
- RF-C03: Registrar personas/clientes asociados a espacios
- RF-C04: Planificar visitas (agendar entrevistas y cobranzas)
- RF-C05: Registrar resultado de visitas
- RF-C06: Registrar ventas con número de talonario
- RF-C07: Gestionar entregas de materiales a clientes
- RF-C08: Registrar cobranzas (efectivo, tarjeta, transferencia)
- RF-C09: Iniciar y finalizar jornada de trabajo
- RF-C10: Indicar acompañamiento durante la jornada

**Módulo Coordinador:**
- RF-CO01: Crear y gestionar campañas
- RF-CO02: Añadir colportores a su campaña
- RF-CO03: Asignar zonas a colportores
- RF-CO04: Visualizar avance de colportores en sus zonas
- RF-CO05: Generar reportes de horas trabajadas
- RF-CO06: Configurar precios por colección/zona
- RF-CO07: Registrar acompañamiento a colportores

**Módulo Admin:**
- RF-A01: Gestionar usuarios del sistema
- RF-A02: Asignar roles (Coordinador)
- RF-A03: Gestionar ciudades y zonas
- RF-A04: Visualizar estadísticas generales del país
- RF-A05: **Gestionar catálogo de productos** (libros, revistas, materiales - bonificables/no bonificables)

#### Versión 2 (V2) - Gestión de Stock y Finanzas

**Módulo Colportor:**
- RF-C11: Visualizar stock propio
- RF-C12: Transferir stock a otros colportores
- RF-C13: Ver estado de cuenta (deuda, depósito, dinero en mano, por cobrar)
- RF-C14: Cargar tickets de pagos con tarjeta
- RF-C15: Ver materiales entregados y estado de cuenta por cliente

**Módulo Coordinador:**
- RF-CO08: Autorizar movimientos de stock entre colportores
- RF-CO09: Autorizar pedidos a casa editora
- RF-CO10: Revisar y gestionar cuenta de colportores
- RF-CO11: Registrar pedidos a casa editora (genera deuda al colportor)
- RF-CO12: Gestionar sistema de becas (metas por carrera)

**Módulo Admin:**
- RF-A06: Configurar parámetros de becas por carrera
- RF-A07: Visualizar mapa de ventas (heatmap/luces)

#### Versión 3 (V3) - Integración con Sistema Brasil y Optimización

**Módulo Colportor:**
- RF-C16: Pathing automático (ruta óptima a casas por visitar)
- RF-C17: Sección de finanzas personales
- RF-C18: Tracking de ubicación en tiempo real (opcional)
- RF-C19: Cargar tickets de depósito bancario
- RF-C20: Cargar comprobantes de pago con tarjeta

**Módulo Coordinador/Financiero:**
- RF-CO13: Monitoreo en tiempo real de colportores (opcional)
- RF-CO14: Cargar y validar tickets de depósito de colportores
- RF-CO15: Registrar depósitos en sistema Brasil vía API
- RF-CO16: Realizar pedidos de libros a casa editora vía API Brasil
- RF-CO17: Consultar estado de pedidos y despachos desde API Brasil
- RF-CO18: Sincronizar cuenta del colportor con sistema Brasil

**Integración API Sistema Brasil:**
- RF-INT01: Conectar con API de sistema de pedidos de Brasil
- RF-INT02: Registrar depósitos a cuenta del colportor vía API
- RF-INT03: Crear pedidos de libros/productos vía API
- RF-INT04: Consultar estado de despachos vía API
- RF-INT05: Sincronizar saldos de cuenta del colportor

### 2.3 Características de los usuarios

| Usuario | Descripción | Nivel Técnico | Frecuencia de Uso |
|---------|-------------|---------------|-------------------|
| **Colportor Eventual** | Estudiante que participa en campañas de verano/invierno para financiar sus estudios. Edad típica: 18-25 años. | Medio-Alto (nativos digitales) | Diario durante campaña |
| **Colportor Permanente** | Persona dedicada al colportaje durante todo el año como actividad principal. | Medio | Diario |
| **Coordinador** | Responsable de un grupo de colportores. Gestiona zonas, stock y finanzas. Puede incluir roles de asistente financiero y acompañante. | Medio | Diario |
| **Administrador** | Personal de la Unión Uruguaya encargado de la gestión global del sistema. | Medio-Alto | Semanal |

### 2.4 Restricciones

#### Restricciones de Presupuesto y Costos

| ID | Restricción | Detalle |
|----|-------------|---------|
| RP-01 | **Presupuesto operativo mensual** | El costo de mantenimiento cloud debe mantenerse entre **$20-30 USD/mes**. |
| RP-02 | **Usuarios estimados** | El sistema debe soportar entre **80-200 usuarios** con el presupuesto establecido. |
| RP-03 | **Minimización de transferencia de datos** | Se debe minimizar el volumen de datos transferidos al cloud mediante sincronización delta y almacenamiento local. |
| RP-04 | **Sin costos altos de almacenamiento de backups** | Los backups se realizan en un proveedor cloud definido, priorizando bajo costo para la organización. |

#### Restricciones de Privacidad y Datos

| ID | Restricción | Detalle |
|----|-------------|---------|
| RV-01 | **Datos locales encriptados** | La información personal de clientes se almacena **solo localmente** con encriptación. |
| RV-02 | **Sin datos personales en cloud** | El cloud **NO almacena** nombres, teléfonos ni información personal de clientes. |
| RV-03 | **Solo estado y estadísticas en cloud** | Se sube únicamente: estado de ubicaciones, resultados de visitas y estadísticas agregadas. |
| RV-04 | **Backup controlado por usuario** | Cada usuario controla su backup en el proveedor de almacenamiento definido. |

#### Restricciones Operativas

1. **Conectividad**: El sistema debe funcionar en modo offline para funciones básicas (registro de casas, navegación) debido a zonas con mala cobertura.
2. **Sincronización por lotes**: La subida de datos debe realizarse por sistema de lotes (delta) para optimizar costos y ancho de banda.
3. **Catálogos delta**: Los catálogos de productos se descargan una vez y solo se actualizan los cambios.
4. **Autorización de Stock**: Los pedidos a casa editora y transferencias de stock requieren autorización del coordinador.
5. **Límite de Pedidos**: El stock que puede pedir un colportor depende de su situación financiera.
6. **Precios Variables**: El precio final de venta puede variar por ciudad/zona; el costo de compra con casa editora se mantiene según catálogo base.
7. **Plataformas**: La app móvil debe soportar Android e iOS; el panel web debe ser responsive.
8. **Autenticación**: Se utilizará un sistema de autenticación a definir.

### 2.5 Suposiciones y dependencias

**Suposiciones:**
1. Los colportores tienen acceso a un smartphone con Android o iOS.
2. Existe conectividad a internet al menos una vez al día para sincronización.
3. Los coordinadores tienen acceso a un dispositivo con navegador web.
4. La casa editora proporciona el catálogo de productos con precios base.
5. **(V3)** El sistema de pedidos de Brasil dispone de una API REST accesible.

**Dependencias:**
1. Servicio de autenticación (proveedor a definir).
2. Servicio de base de datos PostgreSQL.
3. Servicio de mapas para geolocalización (Google Maps, OpenStreetMap).
4. Infraestructura de hosting para API y panel web.
5. Proveedor de almacenamiento cloud para backups (a definir).
6. **(V3)** API del sistema de pedidos de Brasil (pendiente verificar disponibilidad).

---

## 3. Requisitos Específicos

### 3.1 Requisitos Funcionales

#### 3.1.1 Módulo de Autenticación y Usuarios

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-AU01 | El sistema debe permitir el registro de usuarios con email y contraseña. | Alta | V1 |
| RF-AU02 | El sistema debe permitir el inicio de sesión con email y contraseña. | Alta | V1 |
| RF-AU03 | El sistema debe permitir la recuperación de contraseña por email. | Alta | V1 |
| RF-AU04 | El coordinador debe poder asociar colportores registrados a su campaña. | Alta | V1 |
| RF-AU05 | El administrador debe poder asignar el rol de coordinador a usuarios. | Alta | V1 |
| RF-AU06 | El sistema debe mantener sesiones activas y permitir cierre de sesión. | Alta | V1 |

#### 3.1.2 Módulo de Gestión de Ubicaciones

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-UB01 | El colportor debe poder registrar una ubicación con tipo (CASA, NEGOCIO, EDIFICIO), calle, número y coordenadas GPS. | Alta | V1 |
| RF-UB02 | El sistema debe usar la zona del colportor para control general, sin asociar obligatoriamente cada ubicación registrada a una zona específica. | Alta | V1 |
| RF-UB03 | El colportor debe poder registrar espacios dentro de una ubicación (departamentos en edificios). | Alta | V1 |
| RF-UB04 | El colportor debe poder registrar personas asociadas a un espacio. | Alta | V1 |
| RF-UB05 | El sistema debe permitir indicar una ubicación alternativa de cobranza para una persona. | Media | V1 |
| RF-UB06 | El colportor debe poder visualizar las ubicaciones registradas en un mapa. | Media | V1 |
| RF-UB07 | El colportor debe poder editar la información de ubicaciones, espacios y personas. | Alta | V1 |
| RF-UB08 | El sistema debe evitar la duplicación de ubicaciones (misma calle, número, ciudad). | Alta | V1 |

#### 3.1.3 Módulo de Visitas y Agenda

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-VI01 | El colportor debe poder agendar visitas con tipo (ENTREVISTA, COBRANZA), fecha y hora. | Alta | V1 |
| RF-VI02 | El colportor debe poder registrar el resultado de una visita (VENTA, NO_CONTESTO, RECHAZO, ENTREVISTA). | Alta | V1 |
| RF-VI03 | El colportor debe poder agregar notas asociadas a la persona visitada. | Media | V1 |
| RF-VI04 | El sistema debe mostrar las agendas pendientes ordenadas por fecha. | Alta | V1 |
| RF-VI05 | El sistema debe registrar automáticamente el seguimiento de la visita en la agenda al registrar su resultado (ej: CONTESTÓ/NO_CONTESTÓ), según decisiones de diseño. | Alta | V1 |
| RF-VI06 | El sistema debe permitir agendar cobranzas en ubicación alternativa si está configurada. | Media | V1 |
| RF-VI07 | El sistema debe mostrar el historial de visitas por persona/espacio. | Media | V1 |

#### 3.1.4 Módulo de Ventas y Entregas

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-VE01 | El colportor debe poder registrar una venta con número de talonario, monto y productos. | Alta | V1 |
| RF-VE02 | El sistema debe asociar la venta a la persona y espacio correspondiente. | Alta | V1 |
| RF-VE03 | El colportor debe poder registrar la entrega de materiales al cliente (inmediata o diferida). | Alta | V1 |
| RF-VE04 | El sistema debe llevar registro de materiales entregados por cliente (pendientes de cobro). | Alta | V1 |
| RF-VE05 | El colportor debe poder visualizar el estado de entregas y cobros por cliente. | Alta | V2 |

#### 3.1.5 Módulo de Cobranzas

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-CO01 | El colportor debe poder registrar pagos en efectivo. | Alta | V1 |
| RF-CO02 | El colportor debe poder registrar pagos con tarjeta (débito/crédito). | Alta | V1 |
| RF-CO03 | El colportor debe poder registrar pagos por transferencia bancaria. | Alta | V1 |
| RF-CO04 | El sistema debe permitir pagos parciales (cuotas). | Alta | V1 |
| RF-CO05 | El colportor debe poder cargar imagen del ticket para pagos con tarjeta. | Alta | V2 |
| RF-CO06 | El sistema debe calcular automáticamente el saldo pendiente por cliente. | Alta | V1 |
| RF-CO07 | El coordinador debe poder revisar los tickets cargados. | Media | V2 |
| RF-CO08A | El sistema debe guardar una versión comprimida del ticket en almacenamiento local para consulta/borrado por el colportor y subir copia a cloud (proveedor probable: Cloudflare R2) con retención máxima de 4 meses. | Media | V2 |

#### 3.1.6 Módulo de Jornada Laboral

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-JO01 | El colportor debe poder iniciar su jornada de trabajo registrando hora de inicio. | Alta | V1 |
| RF-JO02 | El colportor debe poder finalizar su jornada de trabajo registrando hora de fin. | Alta | V1 |
| RF-JO03 | El colportor debe poder indicar si está siendo acompañado durante la jornada. | Media | V1 |
| RF-JO04 | El coordinador debe poder agregar acompañamiento a una jornada finalizada. | Media | V1 |
| RF-JO05 | El sistema debe generar reportes de horas trabajadas por colportor. | Alta | V1 |
| RF-JO06 | El sistema debe permitir tracking de ubicación en tiempo real durante la jornada (opcional, configurable). | Baja | V3 |

#### 3.1.7 Módulo de Campañas y Zonas

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-CA01 | El coordinador debe poder crear campañas con nombre, tipo (VERANO, INVIERNO, PERMANENTE) y fechas. | Alta | V1 |
| RF-CA02 | El coordinador debe poder añadir colportores a su campaña. | Alta | V1 |
| RF-CA03 | El coordinador debe poder asignar una zona a cada colportor. | Alta | V1 |
| RF-CA04 | El colportor debe poder trabajar fuera de su zona asignada si es necesario. | Media | V1 |
| RF-CA05 | El coordinador debe poder reasignar colportores a otras ciudades de la misma campaña. | Media | V1 |
| RF-CA06 | El administrador debe poder crear y gestionar ciudades y zonas. | Alta | V1 |

#### 3.1.8 Módulo de Stock

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-ST01 | El coordinador debe poder registrar pedidos a casa editora para un colportor. | Alta | V2 |
| RF-ST02 | El sistema debe generar automáticamente la deuda al colportor por el pedido. | Alta | V2 |
| RF-ST03 | El colportor debe poder visualizar su stock actual. | Alta | V2 |
| RF-ST04 | El colportor debe poder solicitar transferencia de stock a otro colportor. | Media | V2 |
| RF-ST05 | El coordinador debe poder autorizar transferencias de stock. | Alta | V2 |
| RF-ST06 | El coordinador debe poder autorizar pedidos a casa editora según situación financiera. | Alta | V2 |
| RF-ST07 | El sistema debe diferenciar productos bonificables de no bonificables. | Alta | V2 |
| RF-ST08 | El sistema debe descontar stock automáticamente al registrar entregas. | Alta | V2 |

#### 3.1.9 Módulo de Estado de Cuenta

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-EC01 | El colportor debe poder ver su deuda total (con casa editora). | Alta | V2 |
| RF-EC02 | El colportor debe poder ver su dinero depositado (tarjeta + efectivo entregado). | Alta | V2 |
| RF-EC03 | El colportor debe poder ver su dinero en mano (efectivo no depositado). | Alta | V2 |
| RF-EC04 | El colportor debe poder ver su dinero por cobrar (ventas pendientes de clientes). | Alta | V2 |
| RF-EC05 | El coordinador debe poder revisar el estado de cuenta de cada colportor. | Alta | V2 |
| RF-EC06 | El sistema debe registrar los depósitos de efectivo realizados por el colportor. | Alta | V2 |
| RF-EC07 | El colportor debe poder visualizar el estado de cuenta por cliente (saldo, pagos y entregas). | Alta | V2 |

#### 3.1.10 Módulo de Becas

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-BE01 | El sistema debe permitir configurar metas de libros bonificables por carrera. | Alta | V2 |
| RF-BE02 | El sistema debe calcular automáticamente el avance hacia la beca (media/completa). | Alta | V2 |
| RF-BE03 | El colportor debe poder ver su progreso hacia la beca. | Alta | V2 |
| RF-BE04 | El coordinador debe poder ver el progreso de becas de sus colportores. | Alta | V2 |
| RF-BE05 | El sistema debe permitir transferir libros acumulados entre campañas (casos excepcionales). | Baja | V2 |

#### 3.1.11 Módulo de Precios y Catálogo

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-PR01 | El administrador debe poder gestionar el catálogo de productos (libros, revistas, materiales). | Alta | V1 |
| RF-PR02 | El administrador debe poder marcar productos como bonificables o no bonificables. | Alta | V1 |
| RF-PR03 | El administrador debe poder marcar productos como "misioneros". | Alta | V1 |
| RF-PR04 | El administrador debe poder definir precios base de compra para cada producto. | Alta | V1 |
| RF-PR05 | El coordinador debe poder configurar precios de venta por colección/producto por zona. | Alta | V1 |
| RF-PR06 | El sistema debe mostrar los precios configurados para la zona del colportor. | Alta | V1 |
| RF-PR07 | El sistema debe diferenciar precio de compra (costo) y precio de venta. | Alta | V1 |
| RF-PR08 | El catálogo debe sincronizarse a los dispositivos mediante delta sync. | Alta | V1 |

#### 3.1.12 Módulo de Reportes y Estadísticas

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-RE01 | El coordinador debe poder ver el avance de cada colportor en su zona (casas visitadas, resultados). | Alta | V1 |
| RF-RE02 | El coordinador debe poder generar reportes de horas trabajadas por período. | Alta | V1 |
| RF-RE03 | El coordinador debe poder ver estadísticas de ventas por colportor. | Alta | V1 |
| RF-RE04 | El administrador debe poder ver estadísticas generales del país. | Alta | V1 |
| RF-RE05 | El administrador debe poder visualizar un mapa de ventas con heatmap o luces por venta. | Media | V2 |

#### 3.1.13 Módulo de Pathing y Optimización (V3)

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-PA01 | El sistema debe sugerir una ruta óptima para visitar las casas agendadas. | Media | V3 |
| RF-PA02 | El colportor debe poder ver las direcciones a visitar ordenadas por proximidad. | Media | V3 |
| RF-PA03 | El sistema debe integrarse con aplicaciones de navegación externas. | Baja | V3 |

#### 3.1.14 Módulo de Finanzas Personales (V3)

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-FI01 | El colportor debe poder registrar gastos personales durante la campaña. | Baja | V3 |
| RF-FI02 | El colportor debe poder ver un balance de sus finanzas personales. | Baja | V3 |
| RF-FI03 | El sistema debe proyectar la ganancia esperada según ventas actuales. | Baja | V3 |

#### 3.1.15 Módulo de Integración con Sistema Brasil (V3)

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-BR01 | El sistema debe conectarse con la API del sistema de pedidos de Brasil. | Alta | V3 |
| RF-BR02 | El colportor debe poder cargar tickets/comprobantes de depósito bancario. | Alta | V3 |
| RF-BR03 | El colportor debe poder cargar comprobantes de pago con tarjeta. | Alta | V3 |
| RF-BR04 | El coordinador/financiero debe poder validar y aprobar tickets de depósito. | Alta | V3 |
| RF-BR05 | El sistema debe registrar depósitos a cuenta del colportor en el sistema Brasil vía API. | Alta | V3 |
| RF-BR06 | El coordinador debe poder realizar pedidos de libros/productos a la casa editora vía API Brasil. | Alta | V3 |
| RF-BR07 | El sistema debe consultar el estado de pedidos y despachos desde la API Brasil. | Media | V3 |
| RF-BR08 | El sistema debe sincronizar el saldo de cuenta del colportor con el sistema Brasil. | Alta | V3 |
| RF-BR09 | El sistema debe mostrar notificaciones cuando se actualice el estado de un pedido. | Media | V3 |
| RF-BR10 | El sistema debe manejar errores de conexión con la API Brasil de forma graceful. | Alta | V3 |

#### 3.1.16 Módulo de Notificaciones

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-NO01 | El sistema debe enviar notificaciones push de recordatorio de visitas agendadas. | Media | V1 |
| RF-NO02 | El sistema debe notificar al colportor cuando se autoriza un pedido de stock. | Media | V2 |
| RF-NO03 | El sistema debe notificar al coordinador cuando un colportor carga un ticket. | Media | V2 |
| RF-NO04 | El sistema debe enviar alertas de cuotas pendientes de clientes. | Baja | V2 |

#### 3.1.17 Módulo de Almacenamiento Local y Backup

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-AL01 | El sistema debe almacenar datos de clientes (nombre, teléfono, notas) exclusivamente en el dispositivo local. | Alta | V1 |
| RF-AL02 | El almacenamiento local debe usar una base local con encriptación AES-256 (tecnología específica a definir). | Alta | V1 |
| RF-AL03 | El colportor debe poder realizar backup de sus datos locales a un almacenamiento cloud definido por el proyecto. | Alta | V1 |
| RF-AL04 | El colportor debe poder restaurar sus datos desde ese backup cloud. | Alta | V1 |
| RF-AL05 | El sistema debe solicitar autenticación del proveedor cloud seleccionado para backup/restore. | Alta | V1 |
| RF-AL06 | Los backups deben estar encriptados antes de subirse al cloud. | Alta | V1 |
| RF-AL07 | La estrategia de backups automáticos queda pendiente de definición. | Media | V2 |
| RF-AL08 | El sistema debe mostrar fecha y tamaño del último backup. | Media | V1 |

#### 3.1.18 Módulo de Sincronización

| ID | Requisito | Prioridad | Versión |
|----|-----------|-----------|---------|
| RF-SY01 | El sistema debe sincronizar solo estado de ubicaciones y resultados de visitas al cloud. | Alta | V1 |
| RF-SY02 | La sincronización debe ser por lotes (batch) para minimizar peticiones. | Alta | V1 |
| RF-SY03 | El sistema debe implementar sincronización delta (solo cambios desde última sync). | Alta | V1 |
| RF-SY04 | Los catálogos de productos deben descargarse solo cuando hay cambios (delta). | Alta | V1 |
| RF-SY05 | El colportor debe poder forzar una sincronización manual. | Media | V1 |
| RF-SY06 | El sistema debe mostrar estado de última sincronización (fecha, registros pendientes). | Media | V1 |
| RF-SY07 | La sincronización debe poder ejecutarse en segundo plano. | Media | V2 |
| RF-SY08 | El colportor debe poder activar/desactivar ahorro de datos; cuando está activado, la sincronización automática solo se ejecuta por Wi-Fi. | Alta | V1 |

### 3.2 Requisitos de Interfaz Externa

#### 3.2.1 Interfaces de Usuario

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RI-UI01 | La aplicación móvil debe tener una interfaz intuitiva adaptada a uso en campo. | Alta |
| RI-UI02 | El panel web debe ser responsive y funcionar en tablets y computadoras. | Alta |
| RI-UI04 | Los mapas deben mostrar ubicaciones con iconos diferenciados por estado de última visita. | Media |
| RI-UI05 | El sistema debe usar una paleta de colores consistente con la identidad de la IASD. | Baja |

#### 3.2.2 Interfaces de Hardware

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RI-HW01 | La aplicación móvil debe acceder al GPS del dispositivo para geolocalización. | Alta |
| RI-HW02 | La aplicación móvil debe acceder a la cámara para captura de tickets. | Alta |
| RI-HW03 | La aplicación debe funcionar en dispositivos con Android 10+ e iOS 13+. | Alta |

#### 3.2.3 Interfaces de Software

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RI-SW01 | El sistema debe integrarse con un backend cloud para autenticación y datos sincronizados (proveedor a definir). | Alta |
| RI-SW02 | El sistema debe integrarse con un servicio de mapas, incluyendo compatibilidad con OpenStreetMap. | Alta |
| RI-SW03 | El sistema debe integrarse con servicios de notificaciones push (Firebase/OneSignal). | Media |
| RI-SW04 | El sistema debe permitir exportar reportes a PDF/Excel. | Media |
| RI-SW05 | El sistema debe usar una base de datos local con encriptación AES (tecnología a definir). | Alta |
| RI-SW06 | El sistema debe integrarse con un proveedor cloud de backup/restore (a definir). | Alta |
| RI-SW07 | La app móvil debe implementarse con tecnología multiplataforma para soporte Android/iOS (framework a definir). | Alta |
| RI-SW08 | **(V3) El sistema debe integrarse con la API del sistema de pedidos de Brasil.** | Alta |
| RI-SW09 | **(V1) El sistema debe integrar OpenStreetMap con soporte offline, descargando el motor de mapas y la ciudad/zona de trabajo para uso sin conexión.** | Alta |

#### 3.2.4 Interfaces de Comunicación

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RI-CO01 | La comunicación entre cliente y servidor debe ser mediante API REST sobre HTTPS. | Alta |
| RI-CO02 | El sistema debe soportar sincronización por lotes (delta sync). | Alta |
| RI-CO03 | La app móvil debe almacenar datos localmente para funcionamiento offline. | Alta |
| RI-CO04 | **(V3) La comunicación con API Brasil debe ser mediante API REST autenticada.** | Alta |

### 3.3 Requisitos de Rendimiento

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RR-01 | El sistema cloud debe soportar **80-200 usuarios** dentro del presupuesto de $20-30 USD/mes. | Alta |
| RR-02 | La sincronización de datos offline no debe exceder 30 segundos para lotes de hasta 100 registros. | Alta |
| RR-03 | Las consultas de listados deben responder en menos de 2 segundos. | Alta |
| RR-04 | La carga del mapa con ubicaciones debe completarse en menos de 3 segundos. | Media |
| RR-05 | El almacenamiento local (base local encriptada) debe soportar al menos 10,000 registros sin degradación. | Alta |
| RR-06 | La app móvil no debe consumir más de 150MB de almacenamiento local para datos offline y caché. | Media |
| RR-07 | La sincronización delta debe transferir menos de 1MB por sesión de sync típica. | Alta |

### 3.4 Restricciones de Diseño

#### Arquitectura Híbrida Local/Cloud

| ID | Restricción |
|----|-------------|
| RD-01 | **Almacenamiento local**: Los datos personales de clientes deben almacenarse exclusivamente en el dispositivo usando una base local con encriptación AES. |
| RD-02 | **Cloud mínimo**: El backend cloud solo almacena: autenticación, estado de ubicaciones, resultados agregados, stock, movimientos y estado de cuenta del colportor. |
| RD-03 | **Sincronización delta**: Las sincronizaciones deben transferir solo cambios desde la última sync (delta), no datos completos. |
| RD-04 | **Catálogos delta**: El catálogo de productos se descarga completo una vez; actualizaciones posteriores solo incluyen cambios. |
| RD-05 | **Backup cloud**: La app debe permitir backup/restore de datos locales al proveedor cloud definido. |

#### Restricciones Técnicas

| ID | Restricción |
|----|-------------|
| RD-06 | El backend debe usar servicios cloud administrados para base de datos, autenticación y almacenamiento (stack a definir). |
| RD-07 | La base de datos cloud debe seguir un esquema simplificado sin datos personales de clientes. |
| RD-08 | Los datos sensibles (contraseñas, tokens, datos locales) deben almacenarse de forma encriptada. |
| RD-09 | El código debe seguir estándares de desarrollo definidos por el equipo. |
| RD-10 | La app móvil debe implementarse con una tecnología multiplataforma (framework a definir). |

### 3.5 Atributos del Sistema

#### 3.5.1 Disponibilidad

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RA-DI01 | El sistema debe estar disponible 99% del tiempo durante horarios de colportaje (8:00-20:00). | Alta |
| RA-DI02 | Las funcionalidades offline deben estar disponibles 100% del tiempo sin conexión. | Alta |
| RA-DI03 | El sistema debe recuperarse automáticamente de fallos de conexión. | Alta |

#### 3.5.2 Seguridad y Privacidad

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RA-SE01 | Todas las comunicaciones deben estar encriptadas con TLS 1.2+. | Alta |
| RA-SE02 | Las contraseñas deben almacenarse con hash seguro (bcrypt/argon2). | Alta |
| RA-SE03 | El sistema debe implementar control de acceso basado en roles (RBAC). | Alta |
| RA-SE04 | Las sesiones deben expirar después de 30 días de inactividad. | Media |
| RA-SE05 | El sistema debe registrar logs de auditoría para operaciones críticas. | Media |
| RA-SE06 | Los datos locales de clientes deben encriptarse con AES-256 en la base local. | Alta |
| RA-SE07 | Los backups cloud deben estar encriptados antes de subirse. | Alta |
| RA-SE08 | **La clave de encriptación local debe derivarse de las credenciales del usuario.** | Alta |

#### 3.5.3 Mantenibilidad

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RA-MA01 | El código debe estar documentado según estándares del equipo. | Media |
| RA-MA02 | El sistema debe tener cobertura de pruebas unitarias mínima del 70%. | Media |
| RA-MA03 | La arquitectura debe permitir agregar nuevos módulos sin afectar los existentes. | Alta |

#### 3.5.4 Portabilidad

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RA-PO01 | La app móvil debe funcionar en Android 10+ e iOS 13+. | Alta |
| RA-PO02 | El panel web debe funcionar en Chrome, Firefox, Safari y Edge (últimas 2 versiones). | Alta |
| RA-PO03 | El backend debe poder desplegarse en diferentes proveedores cloud si es necesario. | Baja |

### 3.6 Otros Requisitos

#### 3.6.1 Requisitos de Datos

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RO-DA01 | El sistema debe realizar backups automáticos diarios de la base de datos. | Alta |
| RO-DA02 | Los datos deben retenerse por al menos 5 años para fines históricos. | Media |
| RO-DA03 | El sistema debe permitir exportar datos del colportor a solicitud. | Baja |

#### 3.6.2 Requisitos de Internacionalización

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RO-IN01 | La interfaz debe estar en español (Uruguay). | Alta |
| RO-IN02 | El sistema debe usar formato de fecha DD/MM/AAAA. | Alta |
| RO-IN03 | El sistema debe usar formato de moneda con símbolo $ y separador de miles. | Alta |

#### 3.6.3 Requisitos Legales

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RO-LE01 | El sistema debe cumplir con la Ley de Protección de Datos Personales de Uruguay (Ley 18.331). | Alta |
| RO-LE02 | Los usuarios deben aceptar términos y condiciones al registrarse. | Alta |

---

## Apéndice A: Modelo de Datos

El modelo de datos del archivo `esquema.sql` está en **borrador** y corresponde al **modelo local** (no al modelo cloud definitivo). A continuación se presenta un resumen referencial de entidades:

```
┌─────────────────────────────────────────────────────────────────┐
│                    MODELO DE ENTIDADES                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Ciudad ──1:N──► Ubicación ──1:N──► Espacio                    │
│                    │                               │            │
│                    │                               │            │
│                    ▼                               ▼            │
│                  Zona ◄──1:N── Usuario      Espacio_Persona     │
│                    │              │                    │        │
│                    │              │                    │        │
│                    ▼              ▼                    ▼        │
│               Jornada         Agenda ◄────────────► Visita     │
│                                   │                    │        │
│                                   │                    │        │
│                                   ▼                    ▼        │
│                               Cobranza ◄─────────► Venta       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Apéndice B: Glosario Extendido

| Término | Definición |
|---------|------------|
| **Delta Sync** | Método de sincronización que solo transfiere los cambios desde la última sincronización, no todos los datos. |
| **Heatmap** | Visualización de datos donde los valores se representan con colores, típicamente de frío (azul) a caliente (rojo). |
| **RBAC** | Control de Acceso Basado en Roles (Role-Based Access Control). |
| **Colección** | Agrupación de productos/libros con un precio común para una zona. |
| **Hive** | Base de datos NoSQL ligera para Flutter que permite almacenamiento local con encriptación. |
| **AES-256** | Estándar de encriptación simétrica de 256 bits. |

---

## Apéndice C: Arquitectura Híbrida y Estimación de Costos

### C.1 Justificación de la Arquitectura

La arquitectura híbrida local/cloud fue diseñada para cumplir con las siguientes restricciones:

1. **Presupuesto limitado**: $20-30 USD/mes para 80-200 usuarios
2. **Privacidad de datos**: Cumplimiento con Ley 18.331 de Uruguay
3. **Funcionamiento offline**: Zonas con mala conectividad
4. **Control del usuario**: Backups en proveedor cloud definido por política del proyecto

### C.2 Distribución de Datos

```
┌────────────────────────────────────────────────────────────────────────┐
│                      DATOS POR UBICACIÓN                               │
├────────────────────────────────────────────────────────────────────────┤
│                                                                        │
│  ALMACENAMIENTO LOCAL (DB + AES)           CLOUD (backend a definir)   │
│  ─────────────────────────────────         ─────────────────          │
│  ✓ Nombre del cliente                      ✓ ID de ubicación          │
│  ✓ Teléfono                                ✓ Coordenadas GPS          │
│  ✓ Dirección completa                      ✓ Tipo (Casa/Negocio/Edif) │
│  ✓ Notas personales                        ✓ Estado última visita     │
│  ✓ Historial de visitas detallado          ✓ Resultado (Venta/Rechazo)│
│  ✓ Materiales entregados                   ✓ Fecha última visita      │
│  ✓ Saldo pendiente                         ✓ Zona asignada            │
│  ✓ Fotos de tickets                        ✓ Estadísticas agregadas   │
│                                                                        │
│  Backup → proveedor cloud definido         Sync → Delta por lotes      │
│                                                                        │
└────────────────────────────────────────────────────────────────────────┘
```

### C.3 Estimación de Costos Cloud (referencial, ejemplo con Supabase)

| Componente | Plan Free | Plan Pro ($25/mes) |
|------------|-----------|-------------------|
| Base de datos | 500MB | 8GB |
| Almacenamiento | 1GB | 100GB |
| Bandwidth | 2GB | 250GB |
| Auth MAU | 50,000 | Ilimitado |
| Edge Functions | 500K invocaciones | 2M invocaciones |

**Estimación para 80-200 usuarios:**

| Métrica | Estimación | Justificación |
|---------|------------|---------------|
| Datos por usuario (cloud) | ~50KB | Solo estado de ubicaciones, sin datos personales |
| Total DB (200 usuarios) | ~10MB | Muy por debajo del límite free |
| Sync diarias | ~400 | 200 usuarios × 2 sync/día |
| Bandwidth mensual | ~200MB | 400 sync × 30 días × 16KB promedio |

**Conclusión**: Con la arquitectura híbrida, el sistema puede operar en planes cloud de bajo costo; la tabla anterior es solo una referencia si se adopta Supabase.

### C.4 Optimizaciones de Costo Implementadas

| Optimización | Ahorro | Impacto |
|--------------|--------|---------|
| Datos personales en local | ~80% storage | Sin datos de clientes en cloud |
| Delta sync | ~70% bandwidth | Solo cambios, no datos completos |
| Catálogos delta | ~90% transferencia | Catálogo se descarga 1 vez |
| Batch sync | ~60% peticiones | Múltiples cambios en 1 request |
| Backup cloud definido | 100% backup cost cloud propio | Usuario/organización asume política de costo según proveedor |

### C.5 Riesgos y Mitigaciones

| Riesgo | Probabilidad | Mitigación |
|--------|--------------|------------|
| Pérdida de datos locales | Media | Backup a proveedor cloud definido (manual/automático según política final) |
| Cambio de dispositivo | Media | Restore desde proveedor cloud definido al nuevo dispositivo |
| Exceso de usuarios | Baja | Upgrade a Supabase Pro ($25/mes) |
| Falta de sync | Media | Cola de cambios pendientes, retry automático |

---

## Historial de Revisiones

| Versión | Fecha | Descripción | Autor |
|---------|-------|-------------|-------|
| 1.0 | 24/03/2026 | Versión inicial del documento | - |
| 1.1 | 24/03/2026 | Agregada arquitectura híbrida local/cloud, restricciones de presupuesto, módulos de almacenamiento local y sincronización | - |
| 1.2 | 25/03/2026 | Ajustes de requisitos: módulo colportor V2, estado de cuenta por cliente, zonas/visitas, interfaces y tecnologías a definir, OSM offline V1, ahorro de datos y política de tickets | - |

---

*Documento generado siguiendo el estándar IEEE 830-1998*
