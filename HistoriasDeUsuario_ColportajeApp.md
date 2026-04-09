# Historias de Usuario - Sistema de Colportaje
## Colportaje App

**Versión 1.0**
**Fecha:** 26 de marzo de 2026
**Organización:** Unión Uruguaya de la Iglesia Adventista del Séptimo Día

---

## Índice

- [Versión 1 (V1) - Base Funcional](#versión-1-v1---base-funcional)
  - [Autenticación](#autenticación)
  - [Gestión de Ubicaciones](#gestión-de-ubicaciones)
  - [Visitas y Agenda](#visitas-y-agenda)
  - [Ventas y Cobranzas](#ventas-y-cobranzas)
  - [Jornada Laboral](#jornada-laboral)
  - [Campañas y Zonas](#campañas-y-zonas)
  - [Catálogo y Precios](#catálogo-y-precios)
  - [Reportes](#reportes)
  - [Almacenamiento y Sincronización](#almacenamiento-y-sincronización)
- [Versión 2 (V2) - Gestión Financiera](#versión-2-v2---gestión-financiera)
  - [Stock](#stock)
  - [Estado de Cuenta](#estado-de-cuenta)
  - [Becas](#becas)
  - [Tickets y Comprobantes](#tickets-y-comprobantes)
- [Versión 3 (V3) - Integración y Optimización](#versión-3-v3---integración-y-optimización)
  - [Optimización de Rutas](#optimización-de-rutas)
  - [Finanzas Personales](#finanzas-personales)
  - [Integración Sistema Brasil](#integración-sistema-brasil)
  - [Tracking en Tiempo Real](#tracking-en-tiempo-real)

---

# Versión 1 (V1) - Base Funcional

---

## Autenticación

### HU-001: Registro de usuario
| Campo | Valor |
|-------|-------|
| **ID** | HU-001 |
| **Título** | Registro de usuario |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **persona interesada en ser colportor**, quiero **registrarme en el sistema con mi email y contraseña** para **poder acceder a la aplicación una vez que el coordinador me asigne a una campaña**.

**Criterios de aceptación:**
- [ ] Puedo ingresar mi nombre, apellido, email y contraseña
- [ ] La contraseña debe tener mínimo 8 caracteres
- [ ] Recibo un email de verificación
- [ ] No puedo registrarme con un email ya existente
- [ ] Debo aceptar términos y condiciones para completar el registro
- [ ] Mi cuenta queda en estado "pendiente" hasta ser asignado a una campaña

---

### HU-002: Inicio de sesión
| Campo | Valor |
|-------|-------|
| **ID** | HU-002 |
| **Título** | Inicio de sesión |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **usuario registrado**, quiero **iniciar sesión con mi email y contraseña** para **acceder a las funciones del sistema según mi rol**.

**Criterios de aceptación:**
- [ ] Puedo ingresar con email y contraseña correctos
- [ ] Veo un mensaje de error si las credenciales son incorrectas
- [ ] La sesión se mantiene activa por 30 días
- [ ] Puedo mantener sesión iniciada en múltiples dispositivos
- [ ] Veo el dashboard correspondiente a mi rol

---

### HU-003: Recuperación de contraseña
| Campo | Valor |
|-------|-------|
| **ID** | HU-003 |
| **Título** | Recuperación de contraseña |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **usuario**, quiero **recuperar mi contraseña por email** para **poder acceder nuevamente si la olvidé**.

**Criterios de aceptación:**
- [ ] Puedo solicitar recuperación ingresando mi email
- [ ] Recibo un enlace de recuperación por email
- [ ] El enlace expira en 1 hora
- [ ] Puedo establecer una nueva contraseña
- [ ] Por seguridad, no se indica si el email existe o no

---

## Gestión de Ubicaciones

### HU-004: Registrar casa o negocio
| Campo | Valor |
|-------|-------|
| **ID** | HU-004 |
| **Título** | Registrar casa o negocio |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **registrar las casas y negocios que visito** para **llevar un control de mi zona y no perder información de los clientes**.

**Criterios de aceptación:**
- [ ] Puedo registrar una ubicación indicando tipo (casa, negocio, edificio)
- [ ] Puedo ingresar calle y número
- [ ] El GPS captura automáticamente las coordenadas (si está disponible)
- [ ] Puedo buscar una dirección si no tengo GPS
- [ ] El sistema advierte si la ubicación ya existe
- [ ] Puedo ver la ubicación en el mapa
- [ ] Funciona sin conexión a internet

---

### HU-005: Registrar departamento en edificio
| Campo | Valor |
|-------|-------|
| **ID** | HU-005 |
| **Título** | Registrar departamento en edificio |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **agregar departamentos dentro de un edificio** para **organizar los contactos por cada unidad**.

**Criterios de aceptación:**
- [ ] Puedo agregar múltiples departamentos a un edificio
- [ ] Cada departamento tiene número y piso (opcional)
- [ ] No puedo duplicar el mismo departamento
- [ ] Puedo agregar clientes a cada departamento

---

### HU-006: Registrar cliente
| Campo | Valor |
|-------|-------|
| **ID** | HU-006 |
| **Título** | Registrar cliente |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **registrar los datos de las personas que encuentro** para **poder hacer seguimiento y no olvidar información importante**.

**Criterios de aceptación:**
- [ ] Puedo ingresar nombre y apellido del cliente
- [ ] Puedo ingresar teléfono (opcional)
- [ ] Puedo agregar notas sobre la persona
- [ ] Puedo indicar una dirección alternativa de cobranza
- [ ] Los datos del cliente se guardan solo en mi celular (privacidad)
- [ ] Puedo tener múltiples personas en una misma ubicación

---

### HU-007: Ver ubicaciones en mapa
| Campo | Valor |
|-------|-------|
| **ID** | HU-007 |
| **Título** | Ver ubicaciones en mapa |
| **Versión** | V1 |
| **Prioridad** | Media |

**Historia:**
> Como **colportor**, quiero **ver todas mis ubicaciones registradas en un mapa** para **planificar mejor mi recorrido y ver el avance de mi zona**.

**Criterios de aceptación:**
- [ ] Veo un mapa con todas las ubicaciones que registré
- [ ] Cada ubicación tiene un color según su estado (visitada, pendiente, venta, etc.)
- [ ] Puedo tocar una ubicación para ver sus detalles
- [ ] El mapa funciona sin internet (mapa offline de la zona)
- [ ] Puedo ver mi ubicación actual en el mapa

---

### HU-008: Editar ubicación o cliente
| Campo | Valor |
|-------|-------|
| **ID** | HU-008 |
| **Título** | Editar ubicación o cliente |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **editar la información de ubicaciones y clientes** para **corregir errores o actualizar datos**.

**Criterios de aceptación:**
- [ ] Puedo editar dirección, tipo y coordenadas de una ubicación
- [ ] Puedo editar nombre, teléfono y notas de un cliente
- [ ] Los cambios se guardan localmente
- [ ] Se sincroniza el estado (no los datos personales) cuando hay conexión

---

## Visitas y Agenda

### HU-009: Agendar visita
| Campo | Valor |
|-------|-------|
| **ID** | HU-009 |
| **Título** | Agendar visita |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **agendar una visita futura a un cliente** para **no olvidar volver y organizar mi tiempo**.

**Criterios de aceptación:**
- [ ] Puedo seleccionar un cliente y agendar una visita
- [ ] Puedo elegir el tipo: entrevista o cobranza
- [ ] Puedo seleccionar fecha y hora
- [ ] Para cobranzas, puedo elegir la ubicación alternativa si está configurada
- [ ] Veo mis visitas agendadas ordenadas por fecha
- [ ] Recibo notificación de recordatorio

---

### HU-010: Registrar resultado de visita
| Campo | Valor |
|-------|-------|
| **ID** | HU-010 |
| **Título** | Registrar resultado de visita |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **registrar qué pasó en cada visita** para **llevar un historial y que el coordinador pueda ver mi avance**.

**Criterios de aceptación:**
- [ ] Puedo indicar el resultado: venta, no contestó, rechazo, entrevista
- [ ] Puedo agregar notas sobre la visita
- [ ] Se registra automáticamente la fecha y hora
- [ ] Si había una agenda asociada, se marca como completada
- [ ] El estado de la visita se sincroniza al cloud (sin datos personales)

---

### HU-011: Ver agenda del día
| Campo | Valor |
|-------|-------|
| **ID** | HU-011 |
| **Título** | Ver agenda del día |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **ver las visitas que tengo agendadas para hoy** para **organizar mi jornada de trabajo**.

**Criterios de aceptación:**
- [ ] Veo una lista de visitas agendadas para hoy
- [ ] Veo el nombre del cliente, dirección y tipo de visita
- [ ] Puedo marcar una visita como completada o cancelada
- [ ] Puedo ver las visitas en el mapa

---

### HU-012: Ver historial de visitas de un cliente
| Campo | Valor |
|-------|-------|
| **ID** | HU-012 |
| **Título** | Ver historial de visitas de un cliente |
| **Versión** | V1 |
| **Prioridad** | Media |

**Historia:**
> Como **colportor**, quiero **ver el historial de visitas a un cliente** para **recordar qué ha pasado antes y darle mejor seguimiento**.

**Criterios de aceptación:**
- [ ] Puedo ver todas las visitas realizadas a un cliente
- [ ] Veo la fecha, resultado y notas de cada visita
- [ ] El historial está ordenado de más reciente a más antiguo

---

## Ventas y Cobranzas

### HU-013: Registrar venta
| Campo | Valor |
|-------|-------|
| **ID** | HU-013 |
| **Título** | Registrar venta |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **registrar una venta con los productos y el monto** para **llevar control de mis ventas y del progreso hacia mi beca**.

**Criterios de aceptación:**
- [ ] Puedo seleccionar los productos vendidos del catálogo
- [ ] El sistema calcula el monto total según precios de mi zona
- [ ] Puedo ajustar el monto si hay descuento
- [ ] Debo ingresar el número de talonario (recibo)
- [ ] La venta queda asociada al cliente
- [ ] Puedo indicar si entrego los materiales en el momento

---

### HU-014: Registrar entrega de materiales
| Campo | Valor |
|-------|-------|
| **ID** | HU-014 |
| **Título** | Registrar entrega de materiales |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **registrar cuándo entrego los materiales al cliente** para **saber qué tiene cada cliente en su poder**.

**Criterios de aceptación:**
- [ ] Puedo registrar la entrega de materiales de una venta
- [ ] Puedo hacer entregas parciales
- [ ] Veo qué materiales tiene cada cliente "en casa"
- [ ] La entrega puede ser en el momento de la venta o después

---

### HU-015: Registrar cobro
| Campo | Valor |
|-------|-------|
| **ID** | HU-015 |
| **Título** | Registrar cobro |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **registrar los pagos que recibo de los clientes** para **llevar control de cuánto me deben y cuánto cobré**.

**Criterios de aceptación:**
- [ ] Puedo registrar un pago indicando el monto
- [ ] Puedo elegir el método de pago: efectivo, tarjeta, transferencia
- [ ] Puedo hacer cobros parciales (cuotas)
- [ ] El sistema calcula automáticamente el saldo pendiente del cliente
- [ ] El cobro queda asociado a la venta correspondiente

---

### HU-016: Ver saldo pendiente de un cliente
| Campo | Valor |
|-------|-------|
| **ID** | HU-016 |
| **Título** | Ver saldo pendiente de un cliente |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **ver cuánto me debe cada cliente** para **saber a quién debo cobrar y cuánto**.

**Criterios de aceptación:**
- [ ] Veo el saldo pendiente total por cliente
- [ ] Veo el detalle de ventas y pagos realizados
- [ ] Puedo ver qué materiales tiene el cliente en su poder

---

## Jornada Laboral

### HU-017: Iniciar jornada de trabajo
| Campo | Valor |
|-------|-------|
| **ID** | HU-017 |
| **Título** | Iniciar jornada de trabajo |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **registrar cuándo empiezo a trabajar** para **que el coordinador pueda ver mis horas y yo tenga un control de mi tiempo**.

**Criterios de aceptación:**
- [ ] Puedo iniciar mi jornada con un botón
- [ ] Se registra la fecha y hora de inicio
- [ ] Puedo indicar si estoy siendo acompañado
- [ ] No puedo iniciar otra jornada si ya tengo una activa
- [ ] Funciona sin conexión

---

### HU-018: Finalizar jornada de trabajo
| Campo | Valor |
|-------|-------|
| **ID** | HU-018 |
| **Título** | Finalizar jornada de trabajo |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **registrar cuándo termino de trabajar** para **tener control de mis horas trabajadas**.

**Criterios de aceptación:**
- [ ] Puedo finalizar mi jornada con un botón
- [ ] Se registra la hora de fin
- [ ] Veo un resumen del día (horas, visitas, ventas)
- [ ] Puedo agregar si hubo acompañamiento
- [ ] Se calculan automáticamente las horas trabajadas

---

## Campañas y Zonas

### HU-019: Crear campaña
| Campo | Valor |
|-------|-------|
| **ID** | HU-019 |
| **Título** | Crear campaña |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador**, quiero **crear una campaña de colportaje** para **organizar el trabajo de mis colportores en un período de tiempo**.

**Criterios de aceptación:**
- [ ] Puedo crear una campaña con nombre
- [ ] Puedo elegir el tipo: verano, invierno, permanente
- [ ] Puedo definir fechas de inicio y fin
- [ ] Puedo asociar la campaña a una ciudad
- [ ] La campaña queda activa para agregar colportores

---

### HU-020: Añadir colportor a campaña
| Campo | Valor |
|-------|-------|
| **ID** | HU-020 |
| **Título** | Añadir colportor a campaña |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador**, quiero **agregar colportores registrados a mi campaña** para **que puedan empezar a trabajar y usar el sistema**.

**Criterios de aceptación:**
- [ ] Puedo buscar usuarios por nombre o email
- [ ] Puedo seleccionar y agregar a mi campaña
- [ ] El usuario recibe el rol de colportor
- [ ] El colportor puede ver la campaña al iniciar sesión

---

### HU-021: Asignar zona a colportor
| Campo | Valor |
|-------|-------|
| **ID** | HU-021 |
| **Título** | Asignar zona a colportor |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador**, quiero **asignar una zona de trabajo a cada colportor** para **organizar el territorio y evitar que se crucen**.

**Criterios de aceptación:**
- [ ] Puedo ver las zonas disponibles en la ciudad
- [ ] Puedo asignar una zona a un colportor
- [ ] Una zona puede tener varios colportores si es necesario
- [ ] El colportor puede trabajar fuera de su zona si es necesario

---

### HU-022: Ver avance de colportores
| Campo | Valor |
|-------|-------|
| **ID** | HU-022 |
| **Título** | Ver avance de colportores |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador**, quiero **ver cómo avanzan mis colportores en sus zonas** para **saber quién necesita ayuda y cómo va la campaña**.

**Criterios de aceptación:**
- [ ] Veo una lista de mis colportores con resumen de actividad
- [ ] Veo casas visitadas, ventas realizadas, horas trabajadas
- [ ] Puedo ver el avance en un mapa con colores por estado
- [ ] Puedo filtrar por zona, colportor o período

---

### HU-023: Generar reporte de horas
| Campo | Valor |
|-------|-------|
| **ID** | HU-023 |
| **Título** | Generar reporte de horas |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador**, quiero **generar un reporte de horas trabajadas** para **llevar control del esfuerzo de cada colportor**.

**Criterios de aceptación:**
- [ ] Puedo seleccionar un rango de fechas
- [ ] Puedo elegir todos o algunos colportores
- [ ] Veo días trabajados, horas totales y promedio diario
- [ ] Veo cuántas jornadas tuvieron acompañamiento
- [ ] Puedo exportar el reporte a PDF o Excel

---

## Catálogo y Precios

### HU-024: Gestionar catálogo de productos
| Campo | Valor |
|-------|-------|
| **ID** | HU-024 |
| **Título** | Gestionar catálogo de productos |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **administrador**, quiero **gestionar el catálogo de libros y productos** para **que los colportores puedan registrar sus ventas correctamente**.

**Criterios de aceptación:**
- [ ] Puedo agregar productos con nombre y categoría (libro, revista, material)
- [ ] Puedo definir el precio de costo (lo que paga el colportor)
- [ ] Puedo marcar si es bonificable (cuenta para la beca)
- [ ] Puedo marcar si es un libro misionero
- [ ] Los cambios se sincronizan a los dispositivos

---

### HU-025: Configurar precios por zona
| Campo | Valor |
|-------|-------|
| **ID** | HU-025 |
| **Título** | Configurar precios por zona |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador**, quiero **configurar los precios de venta para mi zona** para **que los colportores vean los precios correctos al vender**.

**Criterios de aceptación:**
- [ ] Puedo ver el catálogo de productos
- [ ] Puedo definir precio de venta por producto para mi zona
- [ ] Puedo crear colecciones (grupos de productos con precio conjunto)
- [ ] Los colportores de mi zona ven estos precios

---

## Reportes

### HU-026: Gestionar ciudades y zonas
| Campo | Valor |
|-------|-------|
| **ID** | HU-026 |
| **Título** | Gestionar ciudades y zonas |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **administrador**, quiero **crear y gestionar ciudades y zonas** para **organizar el territorio de trabajo de los colportores**.

**Criterios de aceptación:**
- [ ] Puedo crear ciudades con nombre y país
- [ ] Puedo crear zonas dentro de cada ciudad
- [ ] Puedo editar y eliminar ciudades/zonas sin campañas activas
- [ ] Las zonas quedan disponibles para asignar a colportores

---

### HU-027: Asignar rol de coordinador
| Campo | Valor |
|-------|-------|
| **ID** | HU-027 |
| **Título** | Asignar rol de coordinador |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **administrador**, quiero **asignar el rol de coordinador a usuarios** para **que puedan gestionar sus propias campañas y colportores**.

**Criterios de aceptación:**
- [ ] Puedo buscar usuarios registrados
- [ ] Puedo asignar el rol de coordinador
- [ ] El usuario es notificado del cambio
- [ ] El coordinador puede crear campañas

---

### HU-028: Ver estadísticas generales
| Campo | Valor |
|-------|-------|
| **ID** | HU-028 |
| **Título** | Ver estadísticas generales |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **administrador**, quiero **ver estadísticas generales del país** para **conocer el estado global del colportaje**.

**Criterios de aceptación:**
- [ ] Veo total de campañas activas
- [ ] Veo total de colportores activos
- [ ] Veo ventas totales del período
- [ ] Puedo comparar con períodos anteriores
- [ ] Puedo ver detalle por ciudad

---

## Almacenamiento y Sincronización

### HU-029: Trabajar sin conexión
| Campo | Valor |
|-------|-------|
| **ID** | HU-029 |
| **Título** | Trabajar sin conexión |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **poder usar la app sin conexión a internet** para **trabajar en zonas con mala señal**.

**Criterios de aceptación:**
- [ ] Puedo registrar ubicaciones, clientes y visitas sin internet
- [ ] Puedo ver el mapa de mi zona sin internet (mapa descargado)
- [ ] Los datos se guardan localmente
- [ ] Se sincronizan automáticamente cuando hay conexión
- [ ] Veo indicador de datos pendientes de sincronizar

---

### HU-030: Hacer backup de mis datos
| Campo | Valor |
|-------|-------|
| **ID** | HU-030 |
| **Título** | Hacer backup de mis datos |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **hacer una copia de seguridad de mis datos** para **no perder mi información si cambio de celular o se daña**.

**Criterios de aceptación:**
- [ ] Puedo hacer backup manual a un servicio cloud
- [ ] El backup incluye clientes, visitas y datos locales
- [ ] El backup está encriptado
- [ ] Veo la fecha y tamaño del último backup
- [ ] Puedo restaurar mis datos desde el backup

---

### HU-031: Sincronización por Wi-Fi
| Campo | Valor |
|-------|-------|
| **ID** | HU-031 |
| **Título** | Sincronización por Wi-Fi |
| **Versión** | V1 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **que la sincronización automática solo use Wi-Fi** para **no gastar mis datos móviles**.

**Criterios de aceptación:**
- [ ] Puedo activar modo "ahorro de datos"
- [ ] Con ahorro activado, solo sincroniza por Wi-Fi
- [ ] Puedo forzar una sincronización manual si necesito
- [ ] Veo cuántos datos están pendientes de sincronizar

---

### HU-032: Recibir notificaciones
| Campo | Valor |
|-------|-------|
| **ID** | HU-032 |
| **Título** | Recibir notificaciones |
| **Versión** | V1 |
| **Prioridad** | Media |

**Historia:**
> Como **colportor**, quiero **recibir notificaciones de mis visitas agendadas** para **no olvidar mis compromisos**.

**Criterios de aceptación:**
- [ ] Recibo recordatorio de visitas agendadas
- [ ] Puedo configurar con cuánta anticipación recibir el recordatorio
- [ ] Puedo desactivar las notificaciones si quiero

---

# Versión 2 (V2) - Gestión Financiera

---

## Stock

### HU-033: Ver mi stock
| Campo | Valor |
|-------|-------|
| **ID** | HU-033 |
| **Título** | Ver mi stock |
| **Versión** | V2 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **ver qué libros y materiales tengo disponibles** para **saber qué puedo ofrecer a los clientes**.

**Criterios de aceptación:**
- [ ] Veo lista de productos con cantidades
- [ ] Veo cuáles son bonificables y cuáles no
- [ ] Veo el valor total a precio de costo
- [ ] El stock se actualiza al registrar entregas

---

### HU-034: Solicitar transferencia de stock
| Campo | Valor |
|-------|-------|
| **ID** | HU-034 |
| **Título** | Solicitar transferencia de stock |
| **Versión** | V2 |
| **Prioridad** | Media |

**Historia:**
> Como **colportor**, quiero **transferir libros a otro colportor** para **ayudar si le falta material o si me sobra**.

**Criterios de aceptación:**
- [ ] Puedo seleccionar productos y cantidades a transferir
- [ ] Puedo elegir el colportor destino
- [ ] La solicitud queda pendiente hasta que el coordinador apruebe
- [ ] El stock no se mueve hasta la aprobación

---

### HU-035: Autorizar transferencia de stock
| Campo | Valor |
|-------|-------|
| **ID** | HU-035 |
| **Título** | Autorizar transferencia de stock |
| **Versión** | V2 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador**, quiero **aprobar o rechazar transferencias de stock** para **mantener control del inventario**.

**Criterios de aceptación:**
- [ ] Veo las solicitudes de transferencia pendientes
- [ ] Veo detalle de productos, cantidades y colportores involucrados
- [ ] Puedo aprobar o rechazar con un motivo
- [ ] Al aprobar, el stock y la deuda se transfieren
- [ ] Ambos colportores son notificados

---

### HU-036: Registrar pedido de libros
| Campo | Valor |
|-------|-------|
| **ID** | HU-036 |
| **Título** | Registrar pedido de libros |
| **Versión** | V2 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador**, quiero **registrar pedidos de libros para un colportor** para **que tenga material para vender**.

**Criterios de aceptación:**
- [ ] Puedo seleccionar colportor y productos
- [ ] Veo la situación financiera del colportor antes de aprobar
- [ ] El sistema me advierte si la deuda es muy alta
- [ ] Al confirmar, el pedido genera deuda al colportor
- [ ] El stock se actualiza en la cuenta del colportor

---

## Estado de Cuenta

### HU-037: Ver mi estado de cuenta
| Campo | Valor |
|-------|-------|
| **ID** | HU-037 |
| **Título** | Ver mi estado de cuenta |
| **Versión** | V2 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **ver mi situación financiera completa** para **saber cuánto debo, cuánto tengo y cuánto me deben**.

**Criterios de aceptación:**
- [ ] Veo mi deuda total con la casa editora
- [ ] Veo el dinero que ya deposité (tarjeta + efectivo entregado)
- [ ] Veo el dinero que tengo en mano
- [ ] Veo cuánto me deben los clientes (por cobrar)
- [ ] Veo un historial de movimientos

---

### HU-038: Ver estado de cuenta por cliente
| Campo | Valor |
|-------|-------|
| **ID** | HU-038 |
| **Título** | Ver estado de cuenta por cliente |
| **Versión** | V2 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **ver el detalle de lo que me debe cada cliente** para **saber exactamente cuánto cobrar y qué materiales tiene**.

**Criterios de aceptación:**
- [ ] Veo el saldo pendiente del cliente
- [ ] Veo las ventas realizadas y pagos recibidos
- [ ] Veo qué materiales tiene el cliente en su poder
- [ ] Veo el historial de transacciones con el cliente

---

### HU-039: Registrar depósito de efectivo
| Campo | Valor |
|-------|-------|
| **ID** | HU-039 |
| **Título** | Registrar depósito de efectivo |
| **Versión** | V2 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **registrar cuando entrego efectivo al coordinador** para **que se refleje en mi cuenta**.

**Criterios de aceptación:**
- [ ] Puedo registrar el monto que entrego
- [ ] Puedo indicar si es entrega al coordinador o depósito bancario
- [ ] El dinero pasa de "en mano" a "depositado"
- [ ] El coordinador debe validar el depósito

---

### HU-040: Revisar cuenta de colportor
| Campo | Valor |
|-------|-------|
| **ID** | HU-040 |
| **Título** | Revisar cuenta de colportor |
| **Versión** | V2 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador**, quiero **revisar la cuenta de cada colportor** para **validar depósitos y asegurar que los números están bien**.

**Criterios de aceptación:**
- [ ] Veo el estado de cuenta completo del colportor
- [ ] Puedo validar o rechazar depósitos pendientes
- [ ] Puedo revisar tickets de tarjeta
- [ ] Puedo hacer ajustes manuales con justificación
- [ ] Los ajustes quedan en el historial para auditoría

---

## Becas

### HU-041: Configurar metas de beca
| Campo | Valor |
|-------|-------|
| **ID** | HU-041 |
| **Título** | Configurar metas de beca |
| **Versión** | V2 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador**, quiero **configurar las metas de beca según la carrera** para **que cada colportor sepa cuántos libros debe vender**.

**Criterios de aceptación:**
- [ ] Puedo definir tipos de carrera (básica, técnica, universitaria, etc.)
- [ ] Puedo definir meta de media beca y beca completa por carrera
- [ ] Puedo asignar el tipo de carrera a cada colportor
- [ ] Solo cuentan los productos marcados como bonificables

---

### HU-042: Ver mi progreso hacia la beca
| Campo | Valor |
|-------|-------|
| **ID** | HU-042 |
| **Título** | Ver mi progreso hacia la beca |
| **Versión** | V2 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **ver cuánto me falta para llegar a la beca** para **motivarme y saber si voy bien**.

**Criterios de aceptación:**
- [ ] Veo libros bonificables vendidos
- [ ] Veo la meta de media beca y mi porcentaje de avance
- [ ] Veo la meta de beca completa y mi porcentaje de avance
- [ ] Veo cuántos libros me faltan para cada meta
- [ ] Veo un gráfico visual de mi progreso

---

### HU-043: Ver progreso de becas de colportores
| Campo | Valor |
|-------|-------|
| **ID** | HU-043 |
| **Título** | Ver progreso de becas de colportores |
| **Versión** | V2 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador**, quiero **ver el progreso hacia la beca de cada colportor** para **saber quién va bien y quién necesita apoyo**.

**Criterios de aceptación:**
- [ ] Veo una lista de colportores con su progreso
- [ ] Veo quiénes ya alcanzaron media beca o beca completa
- [ ] Puedo filtrar por campaña o zona

---

## Tickets y Comprobantes

### HU-044: Cargar ticket de tarjeta
| Campo | Valor |
|-------|-------|
| **ID** | HU-044 |
| **Título** | Cargar ticket de tarjeta |
| **Versión** | V2 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **cargar la foto del ticket cuando cobro con tarjeta** para **que el coordinador pueda verificarlo**.

**Criterios de aceptación:**
- [ ] Puedo tomar foto o seleccionar imagen del ticket
- [ ] El ticket queda asociado al cobro
- [ ] El ticket se guarda localmente (comprimido)
- [ ] Se sube una copia al cloud para el coordinador
- [ ] Los tickets se eliminan automáticamente después de 4 meses

---

### HU-045: Revisar tickets cargados
| Campo | Valor |
|-------|-------|
| **ID** | HU-045 |
| **Título** | Revisar tickets cargados |
| **Versión** | V2 |
| **Prioridad** | Media |

**Historia:**
> Como **coordinador**, quiero **revisar los tickets de tarjeta que cargan los colportores** para **verificar que los montos sean correctos**.

**Criterios de aceptación:**
- [ ] Veo los tickets cargados por mis colportores
- [ ] Puedo ver la imagen del ticket
- [ ] Veo el monto declarado
- [ ] Puedo marcar como revisado o solicitar corrección

---

### HU-046: Ver mapa de ventas
| Campo | Valor |
|-------|-------|
| **ID** | HU-046 |
| **Título** | Ver mapa de ventas |
| **Versión** | V2 |
| **Prioridad** | Media |

**Historia:**
> Como **administrador**, quiero **ver un mapa con las ventas del país** para **visualizar dónde se concentra el trabajo y "las luces" que iluminan**.

**Criterios de aceptación:**
- [ ] Veo un mapa del país con las ventas
- [ ] Cada venta es un punto de luz
- [ ] Puedo ver como heatmap (zonas calientes)
- [ ] Puedo filtrar por período
- [ ] Puedo hacer zoom para ver detalles

---

# Versión 3 (V3) - Integración y Optimización

---

## Optimización de Rutas

### HU-047: Obtener ruta óptima
| Campo | Valor |
|-------|-------|
| **ID** | HU-047 |
| **Título** | Obtener ruta óptima |
| **Versión** | V3 |
| **Prioridad** | Media |

**Historia:**
> Como **colportor**, quiero **que la app me sugiera la mejor ruta para mis visitas** para **ahorrar tiempo y caminar menos**.

**Criterios de aceptación:**
- [ ] Puedo solicitar optimizar la ruta del día
- [ ] El sistema ordena las visitas por proximidad
- [ ] Veo el recorrido sugerido en el mapa
- [ ] Puedo iniciar navegación con app externa (Google Maps, Waze)

---

## Finanzas Personales

### HU-048: Registrar gasto personal
| Campo | Valor |
|-------|-------|
| **ID** | HU-048 |
| **Título** | Registrar gasto personal |
| **Versión** | V3 |
| **Prioridad** | Baja |

**Historia:**
> Como **colportor**, quiero **registrar mis gastos personales** para **saber cuánto estoy gastando y si me alcanza la ganancia**.

**Criterios de aceptación:**
- [ ] Puedo registrar gastos con monto y categoría
- [ ] Categorías: comida, transporte, alojamiento, otros
- [ ] Los datos son privados (solo yo los veo)
- [ ] Puedo ver un resumen de gastos por categoría

---

### HU-049: Ver balance de finanzas personales
| Campo | Valor |
|-------|-------|
| **ID** | HU-049 |
| **Título** | Ver balance de finanzas personales |
| **Versión** | V3 |
| **Prioridad** | Baja |

**Historia:**
> Como **colportor**, quiero **ver mi balance personal de la campaña** para **saber cuánto estoy ganando realmente**.

**Criterios de aceptación:**
- [ ] Veo mis ingresos (ganancia de ventas)
- [ ] Veo mis gastos registrados
- [ ] Veo el balance neto
- [ ] Veo una proyección de ganancia si continúo al mismo ritmo

---

## Integración Sistema Brasil

### HU-050: Cargar ticket de depósito bancario
| Campo | Valor |
|-------|-------|
| **ID** | HU-050 |
| **Título** | Cargar ticket de depósito bancario |
| **Versión** | V3 |
| **Prioridad** | Alta |

**Historia:**
> Como **colportor**, quiero **cargar el comprobante de un depósito bancario** para **que se refleje en mi cuenta del sistema Brasil**.

**Criterios de aceptación:**
- [ ] Puedo tomar foto o seleccionar imagen del comprobante
- [ ] Puedo ingresar el monto y fecha del depósito
- [ ] El ticket queda pendiente de validación
- [ ] El coordinador es notificado

---

### HU-051: Validar ticket de depósito
| Campo | Valor |
|-------|-------|
| **ID** | HU-051 |
| **Título** | Validar ticket de depósito |
| **Versión** | V3 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador/financiero**, quiero **validar los tickets de depósito** para **asegurar que son correctos antes de registrarlos en el sistema Brasil**.

**Criterios de aceptación:**
- [ ] Veo los tickets pendientes de validación
- [ ] Veo la imagen, monto y datos del colportor
- [ ] Puedo aprobar o rechazar con motivo
- [ ] Si apruebo, queda listo para registrar en Brasil

---

### HU-052: Registrar depósito en sistema Brasil
| Campo | Valor |
|-------|-------|
| **ID** | HU-052 |
| **Título** | Registrar depósito en sistema Brasil |
| **Versión** | V3 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador/financiero**, quiero **registrar los depósitos en el sistema Brasil** para **que se actualice la cuenta del colportor automáticamente**.

**Criterios de aceptación:**
- [ ] Puedo enviar un depósito validado al sistema Brasil
- [ ] El sistema se conecta vía API
- [ ] La cuenta del colportor se actualiza en ambos sistemas
- [ ] Si hay error, se guarda para reintentar
- [ ] El colportor es notificado

---

### HU-053: Realizar pedido vía sistema Brasil
| Campo | Valor |
|-------|-------|
| **ID** | HU-053 |
| **Título** | Realizar pedido vía sistema Brasil |
| **Versión** | V3 |
| **Prioridad** | Alta |

**Historia:**
> Como **coordinador/financiero**, quiero **hacer pedidos de libros directamente al sistema Brasil** para **no tener que cargar los datos en dos lugares**.

**Criterios de aceptación:**
- [ ] Puedo seleccionar productos del catálogo de Brasil
- [ ] Puedo asignar el pedido a un colportor
- [ ] El pedido se envía vía API
- [ ] Se genera la deuda al colportor automáticamente
- [ ] Recibo número de pedido de confirmación

---

### HU-054: Consultar estado de pedido
| Campo | Valor |
|-------|-------|
| **ID** | HU-054 |
| **Título** | Consultar estado de pedido |
| **Versión** | V3 |
| **Prioridad** | Media |

**Historia:**
> Como **colportor o coordinador**, quiero **ver el estado de los pedidos de libros** para **saber cuándo van a llegar**.

**Criterios de aceptación:**
- [ ] Veo lista de mis pedidos (colportor) o de mi campaña (coordinador)
- [ ] Veo el estado: pendiente, en proceso, despachado, entregado
- [ ] Veo fecha estimada de entrega
- [ ] Recibo notificación cuando cambia el estado

---

### HU-055: Sincronizar cuenta con sistema Brasil
| Campo | Valor |
|-------|-------|
| **ID** | HU-055 |
| **Título** | Sincronizar cuenta con sistema Brasil |
| **Versión** | V3 |
| **Prioridad** | Alta |

**Historia:**
> Como **sistema**, quiero **sincronizar los saldos con el sistema Brasil** para **que los datos estén siempre actualizados**.

**Criterios de aceptación:**
- [ ] El sistema sincroniza periódicamente los saldos
- [ ] Si hay diferencias, se registra para revisión
- [ ] Diferencias grandes generan alerta al coordinador
- [ ] El sistema de Brasil es la fuente de verdad

---

## Tracking en Tiempo Real

### HU-056: Activar tracking de ubicación
| Campo | Valor |
|-------|-------|
| **ID** | HU-056 |
| **Título** | Activar tracking de ubicación |
| **Versión** | V3 |
| **Prioridad** | Baja |

**Historia:**
> Como **colportor**, quiero **compartir mi ubicación en tiempo real** para **que el coordinador pueda acompañarme de forma remota**.

**Criterios de aceptación:**
- [ ] Puedo activar/desactivar el tracking voluntariamente
- [ ] Veo un indicador cuando está activo
- [ ] Se desactiva automáticamente al finalizar la jornada
- [ ] Se advierte que consume batería

---

### HU-057: Monitorear colportores en tiempo real
| Campo | Valor |
|-------|-------|
| **ID** | HU-057 |
| **Título** | Monitorear colportores en tiempo real |
| **Versión** | V3 |
| **Prioridad** | Baja |

**Historia:**
> Como **coordinador**, quiero **ver la ubicación de mis colportores en el mapa** para **saber cómo están trabajando y apoyarlos si necesitan**.

**Criterios de aceptación:**
- [ ] Veo en el mapa los colportores con tracking activo
- [ ] Veo la última hora de actualización de cada uno
- [ ] Solo veo colportores que activaron tracking voluntariamente
- [ ] Puedo ver el recorrido del día de un colportor

---

# Resumen de Historias de Usuario

| Versión | Cantidad | Descripción |
|---------|----------|-------------|
| V1 | 32 | Base funcional: ubicaciones, visitas, ventas, jornada, campañas |
| V2 | 14 | Gestión financiera: stock, cuentas, becas, tickets |
| V3 | 11 | Integración Brasil, optimización rutas, finanzas personales |
| **Total** | **57** | |

---

## Historial de Revisiones

| Versión | Fecha | Descripción | Autor |
|---------|-------|-------------|-------|
| 1.0 | 26/03/2026 | Versión inicial - 57 historias de usuario (V1, V2, V3) | - |

---

*Documento generado basado en IEEE 830 v1.2 y Casos de Uso v1.1*
