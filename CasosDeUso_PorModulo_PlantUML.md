# Casos de Uso por Módulo - Colportaje App (PlantUML)

Documento simplificado orientado al usuario. Cada módulo agrupa sus gestores y funcionalidades.
Los `<<include>>` solo se muestran cuando un caso de uso reutiliza otro caso de uso de otro módulo o gestor.

**Actores:**

| Actor | Qué hace |
|-------|----------|
| **Guest** | Se registra e inicia sesión |
| **Colportor** | Trabaja en campo: registra casas, visitas, ventas y cobros |
| **Coordinador** | Supervisa colportores, gestiona campañas, stock y cuentas |
| **Administrador** | Configura el sistema: usuarios, catálogo, becas y reportes globales |

---

## 1. Jerarquía de Actores

```plantuml
@startuml
left to right direction
skinparam actorStyle awesome

actor "Guest" as G
actor "Colportor" as C
actor "Coordinador" as CO
actor "Administrador" as A

C --|> G : hereda
CO --|> C : hereda
A --|> CO : hereda

note bottom of G
    Solo acceso público
  (registro, login)
end note

note bottom of C
  Todo lo del Guest
  + trabajo en campo
end note

note bottom of CO
  Todo lo del Colportor
    + supervisión y gestión
end note

note bottom of A
  Todo lo del Coordinador
  + configuración global
end note
@enduml
```

---

## 2. Módulo de Autenticación

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Guest" as G
actor "Colportor" as C

rectangle "Autenticación" {
    usecase "CU2.1 - Registrarse" as REG
    usecase "CU2.2 - Iniciar sesión" as LOG
    usecase "CU2.3 - Recuperar contraseña" as REC
    usecase "CU2.4 - Cerrar sesión" as OUT
}

G -- REG
G -- LOG
G -- REC
C -- OUT
@enduml
```

---

## 3. Módulo de Jornada Laboral

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Colportor" as C
actor "Coordinador" as CO

rectangle "Jornada Laboral" {
    usecase "CU3.1 - Iniciar jornada\nde trabajo" as INI
    usecase "CU3.2 - Finalizar jornada\nde trabajo" as FIN
    usecase "CU3.3 - Indicar\nacompañamiento" as ACOMP

    usecase "CU3.4 - Agregar acompañamiento\na jornada finalizada" as ACOMP_CO
    usecase "CU3.5 - Generar reportes\nde horas trabajadas" as REP_H
}

C -- INI
C -- FIN
INI <.. ACOMP : <<extend>>
FIN <.. ACOMP : <<extend>>

CO -- ACOMP_CO
CO -- REP_H
@enduml
```

---

## 4. Módulo de Trabajo en Campo

Este es el módulo principal del colportor. El flujo es: abrir el mapa, mover el selector a la ubicación deseada y registrar la casa automáticamente. Sobre esa ubicación se registran visitas, y según el resultado se registra (o no) a la persona.

### 4.1 Gestor de Ubicaciones y Personas

```plantuml
@startuml
left to right direction
skinparam actorStyle awesome

actor "Colportor" as C

rectangle "Gestor de Ubicaciones" as R_UB {
    usecase "CU4.1.1 - Gestionar\nubicaciones" as G_UB
    usecase "CU4.1.1.5 - Validar duplicación" as VAL_DUP
    usecase "CU4.1.1.4 - Baja de ubicación" as BAJA_UB
    usecase "CU4.1.1.3 - Modificar ubicación" as MOD_UB
    usecase "CU4.1.1.2 - Alta ubicación\nCasa/Negocio/Edificio" as ALTA_UB
    usecase "CU4.1.1.1 - Consultar ubicaciones\n(lista + mapa)" as CON_UB
}

rectangle "Gestor de Personas" as R_PE {
    usecase "CU4.1.2 - Gestionar personas\nen ubicación" as G_PE
    usecase "CU4.1.2.7 - Consultar estado de\ncuenta por cliente" as EC_CLI
    usecase "CU4.1.2.6 - Indicar ubicación\nalt. de cobranza" as UB_ALT
    usecase "CU4.1.2.5 - Agregar notas" as NOTAS
    usecase "CU4.1.2.4 - Baja de persona" as BAJA_PE
    usecase "CU4.1.2.3 - Modificar persona" as MOD_PE
    usecase "CU4.1.2.2 - Alta de persona" as ALTA_PE
    usecase "CU4.1.2.1 - Consultar personas\n(+ historial visitas)" as CON_PE
}





C -- G_UB
C -- G_PE

' --- Ubicaciones ABM ---
G_UB ..> CON_UB : <<include>>
G_UB <.. ALTA_UB : <<extend>>
G_UB <.. MOD_UB : <<extend>>
G_UB <.. BAJA_UB : <<extend>>
ALTA_UB ..> VAL_DUP : <<include>>

' --- Personas ABM ---
G_PE ..> CON_PE : <<include>>
G_PE <.. ALTA_PE : <<extend>>
G_PE <.. MOD_PE : <<extend>>
G_PE <.. BAJA_PE : <<extend>>
G_PE <.. NOTAS : <<extend>>
G_PE <.. UB_ALT : <<extend>>
G_PE <.. EC_CLI : <<extend>>
CON_PE ..> CON_UB : <<include>>
@enduml
```

### 4.2 Visitas y Agenda

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Colportor" as C

rectangle "Visitas y Agenda" {
    usecase "CU4.2.1 - Agendar visita\nEntrevista / Cobranza" as AGENDAR

    usecase "CU4.2.2 - Consultar agendas\npendientes" as PEND

    usecase "CU4.2.3 - Registrar resultado\nde visita" as RESULT
}

C -- AGENDAR
C -- PEND
C -- RESULT
@enduml
```

### 4.3 Ventas y Entregas

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Colportor" as C

rectangle "Ventas y Entregas" {
    usecase "CU4.3.1 - Registrar venta\n(con talonario)" as VENTA
    usecase "CU4.3.2 - Consultar precios\nde la zona" as PRECIOS
    usecase "CU4.3.3 - Registrar entrega\nde materiales" as ENTREGA
    usecase "CU4.4.1 - Registrar cobro" as COBRO
    usecase "CU4.2.1 - Agendar visita de\nseguimiento" as SEG
}

C -- VENTA

VENTA ..> PRECIOS : <<include>>
VENTA <.. ENTREGA : <<extend>>
VENTA <.. COBRO : <<extend>>
VENTA <.. SEG : <<extend>>
@enduml
```

> La visita de seguimiento reutiliza "Agendar visita" (CU4.2.1) del módulo de Visitas. El cobro reutiliza "Registrar cobro" (CU4.4.1) del módulo de Cobranzas.

### 4.4 Cobranzas

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Colportor" as C

rectangle "Cobranzas" {
    usecase "CU4.4.1 - Registrar cobro" as COBRO
    usecase "CU4.4.2 - Cobro en efectivo" as EF
    usecase "CU4.4.3 - Cobro con tarjeta" as TAR
    usecase "CU4.4.4 - Cobro por\ntransferencia" as TRANS
    usecase "CU4.4.5 - Calcular saldo\npendiente" as SALDO
    usecase "CU4.4.6 - Cargar imagen\nde ticket" as TICKET
}

C -- COBRO

EF --|> COBRO
TAR --|> COBRO
TRANS --|> COBRO

COBRO ..> SALDO : <<include>>
TAR <.. TICKET : <<extend>>
@enduml
```

> Los 3 medios de pago son especializaciones (herencia) del caso de uso "Registrar cobro" (CU4.4.1).

---

## 5. Módulo Mi Cuenta (Colportor)

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Colportor" as C

rectangle "Mi Cuenta" {
    usecase "CU5.1 - Gestionar\nmi cuenta" as MI
    usecase "CU5.1.1 - Consultar\ndeuda total" as DEUDA
    usecase "CU5.1.2 - Consultar dinero\ndepositado" as DEP
    usecase "CU5.1.3 - Consultar dinero\npor cobrar" as POR_COB
    usecase "CU5.1.4 - Consultar dinero\nen mano - V3" as MANO
    usecase "CU5.1.5 - Consultar\nstock propio" as STOCK
    usecase "CU5.1.6 - Consultar progreso\nhacia beca" as BECA

    usecase "CU5.2 - Solicitar transferencia\nde stock" as TRANS_ST
    usecase "CU5.3 - Registrar depósito\nde efectivo" as REG_DEP
    usecase "CU5.4 - Cargar imagen\nde comprobante" as IMG_COMP
}

C -- MI
C -- TRANS_ST
C -- REG_DEP

MI ..> DEUDA : <<include>>
MI ..> DEP : <<include>>
MI ..> POR_COB : <<include>>
MI ..> MANO : <<include>>
MI ..> STOCK : <<include>>
MI ..> BECA : <<include>>

REG_DEP ..> IMG_COMP : <<include>>
@enduml
```

---

## 6. Módulo Backup y Sincronización

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Colportor" as C

rectangle "Backup y Sincronización" {
    usecase "CU6.1 - Gestionar backup\ny sincronización" as GEST
    usecase "CU6.1.1 - Consultar estado de\núltima sincronización" as ESTADO
    usecase "CU6.1.2 - Configurar proveedor\ncloud de backup" as PROV
    usecase "CU6.1.3 - Forzar sincronización\nmanual" as FORZAR
    usecase "CU6.1.4 - Activar/desactivar\nahorro de datos" as AHORRO
}

C -- GEST

GEST ..> ESTADO : <<include>>
GEST <.. PROV : <<extend>>
GEST <.. FORZAR : <<extend>>
GEST <.. AHORRO : <<extend>>
@enduml
```

---

## 7. Módulo Notificaciones (Colportor)

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Colportor" as C

rectangle "Notificaciones - Colportor" {
    usecase "CU7.1 - Gestionar\nnotificaciones" as GEST
    usecase "CU7.1.1 - Recordatorio de\nvisita agendada" as REC_VIS
    usecase "CU7.1.2 - Notificación de\npedido autorizado" as NOT_PED
}

C -- GEST

GEST ..> REC_VIS : <<include>>
GEST ..> NOT_PED : <<include>>
@enduml
```

---

## 8. Módulo de Campaña y Zonas (Coordinador)

```plantuml
@startuml
left to right direction
skinparam actorStyle awesome

actor "Coordinador" as CO

rectangle "Gestor de Campaña" as R_CA {
    usecase "CU8.1 - Gestionar campaña" as G_CA
    usecase "CU8.1.3 - Modificar campaña" as MOD_CA
    usecase "CU8.1.2 - Crear campaña\nVerano/Invierno/Perm." as CREAR_CA
    usecase "CU8.1.1 - Consultar campaña" as CON_CA
}

rectangle "Gestor de Colportores en Campaña" as R_COL {
    usecase "CU8.2 - Gestionar colportores\nen campaña" as G_COL
    usecase "CU8.2.3 - Reasignar colportor\na otra ciudad" as REAS
    usecase "CU8.2.2 - Añadir colportor\na campaña" as ADD_COL
    usecase "CU8.2.1 - Consultar colportores" as CON_COL
}

rectangle "Gestor de Zonas" as R_ZO {
    usecase "CU8.3 - Gestionar zonas\nde campaña" as G_ZO
    usecase "CU8.3.5 - Asignar zona\na colportor" as ASIG_ZO
    usecase "CU8.3.4 - Baja de zona" as BAJA_ZO
    usecase "CU8.3.3 - Modificar zona" as MOD_ZO
    usecase "CU8.3.2 - Alta de zona" as ALTA_ZO
    usecase "CU8.3.1 - Consultar zonas" as CON_ZO
}

rectangle "Precios" {
    usecase "CU8.4 - Configurar precios\nde venta por zona" as PRECIOS
}

CO -- G_CA
CO -- G_COL
CO -- G_ZO
CO -- PRECIOS

' --- Campaña ABM ---
G_CA ..> CON_CA : <<include>>
G_CA <.. CREAR_CA : <<extend>>
G_CA <.. MOD_CA : <<extend>>

' --- Colportores ABM ---
G_COL ..> CON_COL : <<include>>
G_COL <.. ADD_COL : <<extend>>
G_COL <.. REAS : <<extend>>

' --- Zonas ABM ---
G_ZO ..> CON_ZO : <<include>>
G_ZO <.. ALTA_ZO : <<extend>>
G_ZO <.. MOD_ZO : <<extend>>
G_ZO <.. BAJA_ZO : <<extend>>
G_ZO <.. ASIG_ZO : <<extend>>
@enduml
```

---

## 9. Módulo de Stock (Coordinador)

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Coordinador" as CO

rectangle "Gestor de Stock" {
    usecase "CU9.1 - Gestionar stock" as G_ST
    usecase "CU9.1.1 - Registrar pedido\na casa editora" as PED
    usecase "CU9.1.2 - Generar deuda\nal colportor" as DEUDA
    usecase "CU9.1.3 - Autorizar transferencias\nde stock" as AUT_TRANS
    usecase "CU9.1.4 - Autorizar pedidos\na casa editora" as AUT_PED
    usecase "CU9.2 - Transferir libros\nentre campañas" as TRANS_LIB
}

CO -- G_ST
CO -- TRANS_LIB

G_ST <.. PED : <<extend>>
G_ST <.. AUT_TRANS : <<extend>>
G_ST <.. AUT_PED : <<extend>>
PED ..> DEUDA : <<include>>
@enduml
```

> "Generar deuda" (CU9.1.2) reutiliza "Consultar colportores" (CU8.2.1) del módulo Campaña (<<include>> inter-módulo).

---

## 10. Módulo Cuenta de Colportor (Coordinador)

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Coordinador" as CO

rectangle "Cuenta de Colportor" {
    usecase "CU10.1 - Consultar cuenta\nde colportor" as CUENTA
    usecase "CU10.1.1 - Revisar estado\nde cuenta" as EC
    usecase "CU10.1.2 - Consultar progreso\nde becas" as BECAS
    usecase "CU10.1.3 - Consultar estadísticas\nde ventas" as STATS

    usecase "CU10.2 - Revisar tickets\ncargados" as TICKETS
}

CO -- CUENTA
CO -- TICKETS

CUENTA ..> EC : <<include>>
CUENTA ..> BECAS : <<include>>
CUENTA ..> STATS : <<include>>
@enduml
```

---

## 11. Módulo de Reportes (Coordinador + Admin)

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Coordinador" as CO
actor "Administrador" as A

rectangle "Reportes y Estadísticas" {
    usecase "CU11.1 - Consultar avance de\ncolportores en zona" as AVANCE
    usecase "CU11.2 - Generar reportes de\nhoras por período" as HORAS

    usecase "CU11.3 - Consultar estadísticas\ngenerales del país" as PAIS
    usecase "CU11.4 - Consultar mapa de\nventas heatmap - V2" as HEAT
}

CO -- AVANCE
CO -- HORAS
A -- PAIS
A -- HEAT
@enduml
```

---

## 12. Módulo Notificaciones (Coordinador)

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Coordinador" as CO

rectangle "Notificaciones - Coordinador" {
    usecase "CU12.1 - Gestionar\nnotificaciones" as GEST
    usecase "CU12.1.1 - Ticket cargado\npor colportor" as NOT_TICK
    usecase "CU12.1.2 - Solicitud de\ntransferencia de stock" as NOT_TRANS
    usecase "CU12.1.3 - Pedido a\ncasa editora" as NOT_PED
}

CO -- GEST

GEST ..> NOT_TICK : <<include>>
GEST ..> NOT_TRANS : <<include>>
GEST ..> NOT_PED : <<include>>
@enduml
```

---

## 13. Módulo de Administración (Admin)

```plantuml
@startuml
left to right direction
skinparam actorStyle awesome

actor "Administrador" as A

rectangle "Gestor de Usuarios" as R_US {
    usecase "CU13.1 - Gestionar usuarios\ndel sistema" as G_US
    usecase "CU13.1.3 - Modificar usuario" as MOD_US
    usecase "CU13.1.2 - Alta de usuario" as ALTA_US
    usecase "CU13.1.1 - Consultar usuario" as CON_US
    usecase "CU13.1.5 - Asignar roles" as ROLES
    usecase "CU13.1.4 - Baja de usuario" as BAJA_US
    
}

rectangle "Gestor de Catálogo de Productos" as R_PR {
    usecase "CU13.2 - Gestionar catálogo\nde productos" as G_PR
    usecase "CU13.2.2 - Alta de producto" as ALTA_PR
    usecase "CU13.2.1 - Consultar producto" as CON_PR
    
    usecase "CU13.2.4 - Baja de producto" as BAJA_PR
    usecase "CU13.2.3 - Modificar producto" as MOD_PR
    usecase "CU13.2.5 - Marcar como\nbonificable" as BONIF
    usecase "CU13.2.6 - Marcar como\nmisionero" as MISION
    usecase "CU13.2.7 - Definir precio\nbase de compra" as PRECIO_B
}

rectangle "Configuración" {
    usecase "CU13.3 - Configurar metas\nde beca por carrera" as BECAS
}

A -- G_US
A -- G_PR
A -- BECAS

' --- Usuarios ABM ---
G_US ..> CON_US : <<include>>
G_US <.. ALTA_US : <<extend>>
G_US <.. MOD_US : <<extend>>
G_US <.. BAJA_US : <<extend>>
G_US <.. ROLES : <<extend>>

' --- Catálogo ABM ---
G_PR ..> CON_PR : <<include>>
G_PR <.. ALTA_PR : <<extend>>
G_PR <.. MOD_PR : <<extend>>
G_PR <.. BAJA_PR : <<extend>>
ALTA_PR <.. BONIF : <<extend>>
ALTA_PR <.. MISION : <<extend>>
ALTA_PR ..> PRECIO_B : <<include>>
MOD_PR <.. BONIF : <<extend>>
MOD_PR <.. MISION : <<extend>>
@enduml
```

---

## 14. Módulos V3 (Futuros)

### 14.1 Pathing y Navegación

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Colportor" as C

rectangle "Pathing - V3" {
    usecase "CU14.1.1 - Sugerir ruta\nóptima" as RUTA
    usecase "CU14.1.2 - Integrar con app\nde navegación" as NAV
    usecase "CU14.1.3 - Consultar direcciones\npor proximidad" as PROX
}

C -- RUTA
C -- PROX

RUTA <.. NAV : <<extend>>
@enduml
```

### 14.2 Finanzas Personales

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Colportor" as C

rectangle "Finanzas Personales - V3" {
    usecase "CU14.2.1 - Registrar gastos\npersonales" as GASTOS
    usecase "CU14.2.2 - Consultar balance\nde finanzas" as BALANCE
    usecase "CU14.2.3 - Proyectar\nganancia esperada" as PROY
}

C -- GASTOS
C -- BALANCE
C -- PROY
@enduml
```

### 14.3 Integración con Sistema Brasil

```plantuml
@startuml
top to bottom direction
skinparam actorStyle awesome

actor "Coordinador" as CO
actor "API Sistema\nBrasil" as API

rectangle "Integración Brasil - V3" {
    usecase "CU14.3.1 - Validar y aprobar\ntickets de depósito" as VAL
    usecase "CU14.3.2 - Registrar depósitos\nvía API" as DEP_API
    usecase "CU14.3.3 - Realizar pedidos\nvía API" as PED_API
    usecase "CU14.3.4 - Consultar estado\nde pedidos vía API" as EST_API
}

CO -- VAL
CO -- PED_API
CO -- EST_API

VAL ..> DEP_API : <<include>>
DEP_API -- API
PED_API -- API
EST_API -- API
@enduml
```

---

## 15. Diagrama Resumen de Paquetes

```plantuml
@startuml
left to right direction
skinparam packageStyle rectangle

actor "Guest" as G
actor "Colportor" as C
actor "Coordinador" as CO
actor "Administrador" as A

package "2 - Autenticación" as PKG_AUTH

package "Colportor\nFuncionalidades" as PKG_C {
    package "3 - Jornada Laboral" as PKG_JOR
    package "4 - Trabajo en Campo" as PKG_CAMPO {
        package "4.1 - Ubicaciones / Personas" as PKG_UBI
        package "4.2 - Visitas y Agenda" as PKG_VIS
        package "4.3 - Ventas y Entregas" as PKG_VEN
        package "4.4 - Cobranzas" as PKG_COB
    }
    package "5 - Mi Cuenta" as PKG_MI
    package "6 - Backup y Sync" as PKG_BACK
    package "7 - Notificaciones" as PKG_NOT_C
}

package "Coordinador\nFuncionalidades" as PKG_CO {
    package "8 - Campaña y Zonas" as PKG_CAMP
    package "9 - Stock" as PKG_STOCK
    package "10 - Cuenta de\nColportor" as PKG_CCOL
    package "12 - Notificaciones" as PKG_NOT_CO
    package "11 - Reportes" as PKG_REP_CO
}

package "13 - Administración" as PKG_ADM
package "11 - Reportes" as PKG_REP

package "V3 - Futuros" as PKG_V3 {
    package "14.1 - Pathing" as PKG_PATH
    package "14.2 - Finanzas\nPersonales" as PKG_FIN
    package "14.3 - Integración\nBrasil" as PKG_BR
}

G -- PKG_AUTH
C -- PKG_C
CO -- PKG_CO
A -- PKG_ADM
A -- PKG_REP
C -- PKG_V3
CO -- PKG_BR
@enduml
```

---

## Tabla resumen de numeración CU

| Nro. | Caso de uso | Módulo |
|------|-------------|--------|
| CU2.1 | Registrarse | 2 - Autenticación |
| CU2.2 | Iniciar sesión | 2 - Autenticación |
| CU2.3 | Recuperar contraseña | 2 - Autenticación |
| CU2.4 | Cerrar sesión | 2 - Autenticación |
| CU3.1 | Iniciar jornada de trabajo | 3 - Jornada Laboral |
| CU3.2 | Finalizar jornada de trabajo | 3 - Jornada Laboral |
| CU3.3 | Indicar acompañamiento | 3 - Jornada Laboral |
| CU3.4 | Agregar acompañamiento a jornada finalizada | 3 - Jornada Laboral |
| CU3.5 | Generar reportes de horas trabajadas | 3 - Jornada Laboral |
| CU4.1.1 | Gestionar ubicaciones | 4.1 - Ubicaciones |
| CU4.1.1.1 | Consultar ubicaciones (lista + mapa) | 4.1 - Ubicaciones |
| CU4.1.1.2 | Alta ubicación Casa/Negocio/Edificio | 4.1 - Ubicaciones |
| CU4.1.1.3 | Modificar ubicación | 4.1 - Ubicaciones |
| CU4.1.1.4 | Baja de ubicación | 4.1 - Ubicaciones |
| CU4.1.1.5 | Validar duplicación | 4.1 - Ubicaciones |
| CU4.1.2 | Gestionar personas en ubicación | 4.1 - Personas |
| CU4.1.2.1 | Consultar personas (+ historial visitas) | 4.1 - Personas |
| CU4.1.2.2 | Alta de persona | 4.1 - Personas |
| CU4.1.2.3 | Modificar persona | 4.1 - Personas |
| CU4.1.2.4 | Baja de persona | 4.1 - Personas |
| CU4.1.2.5 | Agregar notas | 4.1 - Personas |
| CU4.1.2.6 | Indicar ubicación alt. de cobranza | 4.1 - Personas |
| CU4.1.2.7 | Consultar estado de cuenta por cliente | 4.1 - Personas |
| CU4.2.1 | Agendar visita Entrevista / Cobranza | 4.2 - Visitas y Agenda |
| CU4.2.2 | Consultar agendas pendientes | 4.2 - Visitas y Agenda |
| CU4.2.3 | Registrar resultado de visita | 4.2 - Visitas y Agenda |
| CU4.3.1 | Registrar venta (con talonario) | 4.3 - Ventas y Entregas |
| CU4.3.2 | Consultar precios de la zona | 4.3 - Ventas y Entregas |
| CU4.3.3 | Registrar entrega de materiales | 4.3 - Ventas y Entregas |
| CU4.4.1 | Registrar cobro | 4.4 - Cobranzas *(reutilizado en 4.3)* |
| CU4.4.2 | Cobro en efectivo | 4.4 - Cobranzas |
| CU4.4.3 | Cobro con tarjeta | 4.4 - Cobranzas |
| CU4.4.4 | Cobro por transferencia | 4.4 - Cobranzas |
| CU4.4.5 | Calcular saldo pendiente | 4.4 - Cobranzas |
| CU4.4.6 | Cargar imagen de ticket | 4.4 - Cobranzas |
| CU5.1 | Gestionar mi cuenta | 5 - Mi Cuenta |
| CU5.1.1 | Consultar deuda total | 5 - Mi Cuenta |
| CU5.1.2 | Consultar dinero depositado | 5 - Mi Cuenta |
| CU5.1.3 | Consultar dinero por cobrar | 5 - Mi Cuenta |
| CU5.1.4 | Consultar dinero en mano (V3) | 5 - Mi Cuenta |
| CU5.1.5 | Consultar stock propio | 5 - Mi Cuenta |
| CU5.1.6 | Consultar progreso hacia beca | 5 - Mi Cuenta |
| CU5.2 | Solicitar transferencia de stock | 5 - Mi Cuenta |
| CU5.3 | Registrar depósito de efectivo | 5 - Mi Cuenta |
| CU5.4 | Cargar imagen de comprobante | 5 - Mi Cuenta |
| CU6.1 | Gestionar backup y sincronización | 6 - Backup y Sync |
| CU6.1.1 | Consultar estado de última sincronización | 6 - Backup y Sync |
| CU6.1.2 | Configurar proveedor cloud de backup | 6 - Backup y Sync |
| CU6.1.3 | Forzar sincronización manual | 6 - Backup y Sync |
| CU6.1.4 | Activar/desactivar ahorro de datos | 6 - Backup y Sync |
| CU7.1 | Gestionar notificaciones (Colportor) | 7 - Notificaciones C |
| CU7.1.1 | Recordatorio de visita agendada | 7 - Notificaciones C |
| CU7.1.2 | Notificación de pedido autorizado | 7 - Notificaciones C |
| CU8.1 | Gestionar campaña | 8 - Campaña y Zonas |
| CU8.1.1 | Consultar campaña | 8 - Campaña y Zonas |
| CU8.1.2 | Crear campaña Verano/Invierno/Perm. | 8 - Campaña y Zonas |
| CU8.1.3 | Modificar campaña | 8 - Campaña y Zonas |
| CU8.2 | Gestionar colportores en campaña | 8 - Campaña y Zonas |
| CU8.2.1 | Consultar colportores | 8 - Campaña y Zonas |
| CU8.2.2 | Añadir colportor a campaña | 8 - Campaña y Zonas |
| CU8.2.3 | Reasignar colportor a otra ciudad | 8 - Campaña y Zonas |
| CU8.3 | Gestionar zonas de campaña | 8 - Campaña y Zonas |
| CU8.3.1 | Consultar zonas | 8 - Campaña y Zonas |
| CU8.3.2 | Alta de zona | 8 - Campaña y Zonas |
| CU8.3.3 | Modificar zona | 8 - Campaña y Zonas |
| CU8.3.4 | Baja de zona | 8 - Campaña y Zonas |
| CU8.3.5 | Asignar zona a colportor | 8 - Campaña y Zonas |
| CU8.4 | Configurar precios de venta por zona | 8 - Campaña y Zonas |
| CU9.1 | Gestionar stock | 9 - Stock |
| CU9.1.1 | Registrar pedido a casa editora | 9 - Stock |
| CU9.1.2 | Generar deuda al colportor | 9 - Stock |
| CU9.1.3 | Autorizar transferencias de stock | 9 - Stock |
| CU9.1.4 | Autorizar pedidos a casa editora | 9 - Stock |
| CU9.2 | Transferir libros entre campañas | 9 - Stock |
| CU10.1 | Consultar cuenta de colportor | 10 - Cuenta Colportor |
| CU10.1.1 | Revisar estado de cuenta | 10 - Cuenta Colportor |
| CU10.1.2 | Consultar progreso de becas | 10 - Cuenta Colportor |
| CU10.1.3 | Consultar estadísticas de ventas | 10 - Cuenta Colportor |
| CU10.2 | Revisar tickets cargados | 10 - Cuenta Colportor |
| CU11.1 | Consultar avance de colportores en zona | 11 - Reportes |
| CU11.2 | Generar reportes de horas por período | 11 - Reportes |
| CU11.3 | Consultar estadísticas generales del país | 11 - Reportes |
| CU11.4 | Consultar mapa de ventas heatmap (V2) | 11 - Reportes |
| CU12.1 | Gestionar notificaciones (Coordinador) | 12 - Notificaciones CO |
| CU12.1.1 | Ticket cargado por colportor | 12 - Notificaciones CO |
| CU12.1.2 | Solicitud de transferencia de stock | 12 - Notificaciones CO |
| CU12.1.3 | Pedido a casa editora | 12 - Notificaciones CO |
| CU13.1 | Gestionar usuarios del sistema | 13 - Administración |
| CU13.1.1 | Consultar usuario | 13 - Administración |
| CU13.1.2 | Alta de usuario | 13 - Administración |
| CU13.1.3 | Modificar usuario | 13 - Administración |
| CU13.1.4 | Baja de usuario | 13 - Administración |
| CU13.1.5 | Asignar roles | 13 - Administración |
| CU13.2 | Gestionar catálogo de productos | 13 - Administración |
| CU13.2.1 | Consultar producto | 13 - Administración |
| CU13.2.2 | Alta de producto | 13 - Administración |
| CU13.2.3 | Modificar producto | 13 - Administración |
| CU13.2.4 | Baja de producto | 13 - Administración |
| CU13.2.5 | Marcar como bonificable | 13 - Administración |
| CU13.2.6 | Marcar como misionero | 13 - Administración |
| CU13.2.7 | Definir precio base de compra | 13 - Administración |
| CU13.3 | Configurar metas de beca por carrera | 13 - Administración |
| CU14.1.1 | Sugerir ruta óptima | 14.1 - Pathing (V3) |
| CU14.1.2 | Integrar con app de navegación | 14.1 - Pathing (V3) |
| CU14.1.3 | Consultar direcciones por proximidad | 14.1 - Pathing (V3) |
| CU14.2.1 | Registrar gastos personales | 14.2 - Finanzas (V3) |
| CU14.2.2 | Consultar balance de finanzas | 14.2 - Finanzas (V3) |
| CU14.2.3 | Proyectar ganancia esperada | 14.2 - Finanzas (V3) |
| CU14.3.1 | Validar y aprobar tickets de depósito | 14.3 - Integración Brasil (V3) |
| CU14.3.2 | Registrar depósitos vía API | 14.3 - Integración Brasil (V3) |
| CU14.3.3 | Realizar pedidos vía API | 14.3 - Integración Brasil (V3) |
| CU14.3.4 | Consultar estado de pedidos vía API | 14.3 - Integración Brasil (V3) |

> **Casos reutilizados:** CU4.2.1 (Agendar visita) se reutiliza en módulo 4.3 como visita de seguimiento. CU4.4.1 (Registrar cobro) se reutiliza en módulo 4.3 como cobro asociado a venta. CU8.2.1 (Consultar colportores) es referenciado por CU9.1.2 del módulo 9 vía <<include>> inter-módulo.
