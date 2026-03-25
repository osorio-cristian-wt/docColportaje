# Casos de Uso - Sistema de Colportaje
## Colportaje App

**Versión 1.0**
**Fecha:** 25 de marzo de 2026
**Organización:** Unión Uruguaya de la Iglesia Adventista del Séptimo Día

---

## Índice de Casos de Uso

### Versión 1 (V1)
| Nro | Caso de Uso | Actor |
|-----|-------------|-------|
| CU-01 | Registrar Usuario | Usuario |
| CU-02 | Iniciar Sesión | Usuario |
| CU-03 | Recuperar Contraseña | Usuario |
| CU-04 | Registrar Ubicación | Colportor |
| CU-05 | Registrar Espacio | Colportor |
| CU-06 | Registrar Cliente | Colportor |
| CU-07 | Agendar Visita | Colportor |
| CU-08 | Registrar Resultado de Visita | Colportor |
| CU-09 | Registrar Venta | Colportor |
| CU-10 | Registrar Entrega de Material | Colportor |
| CU-11 | Registrar Cobranza | Colportor |
| CU-12 | Iniciar Jornada | Colportor |
| CU-13 | Finalizar Jornada | Colportor |
| CU-14 | Crear Campaña | Coordinador |
| CU-15 | Añadir Colportor a Campaña | Coordinador |
| CU-16 | Asignar Zona a Colportor | Coordinador |
| CU-17 | Ver Avance de Colportores | Coordinador |
| CU-18 | Generar Reporte de Horas | Coordinador |
| CU-19 | Configurar Precios por Zona | Coordinador |
| CU-20 | Gestionar Ciudades y Zonas | Administrador |
| CU-21 | Asignar Rol de Coordinador | Administrador |
| CU-22 | Ver Estadísticas Generales | Administrador |
| CU-23 | **Gestionar Catálogo de Productos** | Administrador |

### Versión 2 (V2)
| Nro | Caso de Uso | Actor |
|-----|-------------|-------|
| CU-24 | Ver Stock Propio | Colportor |
| CU-25 | Solicitar Transferencia de Stock | Colportor |
| CU-26 | Ver Estado de Cuenta | Colportor |
| CU-27 | Cargar Ticket de Tarjeta | Colportor |
| CU-28 | Registrar Depósito de Efectivo | Colportor |
| CU-29 | Registrar Pedido a Casa Editora | Coordinador |
| CU-30 | Autorizar Transferencia de Stock | Coordinador |
| CU-31 | Autorizar Pedido de Stock | Coordinador |
| CU-32 | Revisar Cuenta de Colportor | Coordinador |
| CU-33 | Configurar Metas de Beca | Coordinador |
| CU-34 | Ver Progreso de Beca | Colportor |
| CU-35 | Ver Mapa de Ventas | Administrador |

### Versión 3 (V3)
| Nro | Caso de Uso | Actor |
|-----|-------------|-------|
| CU-36 | Obtener Ruta Óptima | Colportor |
| CU-37 | Registrar Gasto Personal | Colportor |
| CU-38 | Ver Balance de Finanzas Personales | Colportor |
| CU-39 | Activar Tracking en Tiempo Real | Colportor |
| CU-40 | Monitorear Colportores en Tiempo Real | Coordinador |
| CU-41 | **Cargar Ticket de Depósito Bancario** | Colportor |
| CU-42 | **Validar Ticket de Depósito** | Coordinador/Financiero |
| CU-43 | **Registrar Depósito en Sistema Brasil** | Coordinador/Financiero |
| CU-44 | **Realizar Pedido vía API Brasil** | Coordinador/Financiero |
| CU-45 | **Consultar Estado de Pedido Brasil** | Coordinador/Colportor |
| CU-46 | **Sincronizar Cuenta con Sistema Brasil** | Sistema |

---

# VERSIÓN 1 (V1) - CASOS DE USO

---

## CU-01: Registrar Usuario

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Usuario |
| **Nro** | CU-01 |
| **Versión** | 1.0 |
| **Actor** | Usuario (cualquier rol) |
| **Autor** | - |

**Descripción:**
Permite a un nuevo usuario crear una cuenta en el sistema utilizando su email y contraseña.

**Activación:**
El usuario accede a la pantalla de registro desde la app móvil o panel web.

**Pre-condiciones:**
- El usuario no tiene una cuenta existente con ese email.
- El usuario tiene acceso a internet.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El usuario selecciona "Registrarse" | |
| 2 | El sistema muestra el formulario de registro | |
| 3 | El usuario ingresa nombre, apellido, email y contraseña | 3a. El email ya está registrado: el sistema muestra error y sugiere recuperar contraseña |
| 4 | El usuario acepta términos y condiciones | 4a. El usuario no acepta: no puede continuar |
| 5 | El sistema valida los datos ingresados | 5a. Datos inválidos: el sistema muestra los errores específicos |
| 6 | El sistema crea la cuenta y envía email de verificación | |
| 7 | El usuario verifica su email | 7a. El usuario no verifica: la cuenta queda inactiva |
| 8 | El sistema confirma el registro exitoso | |

**Post-condiciones:**
- El usuario tiene una cuenta creada en estado "pendiente de asignación".
- El usuario puede iniciar sesión pero no tiene rol asignado hasta que un coordinador lo añada a una campaña.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- La contraseña debe tener mínimo 8 caracteres.
- El email debe ser único en el sistema.

---

## CU-02: Iniciar Sesión

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Iniciar Sesión |
| **Nro** | CU-02 |
| **Versión** | 1.0 |
| **Actor** | Usuario (cualquier rol) |
| **Autor** | - |

**Descripción:**
Permite a un usuario registrado acceder al sistema con sus credenciales.

**Activación:**
El usuario abre la aplicación o accede al panel web.

**Pre-condiciones:**
- El usuario tiene una cuenta registrada y verificada.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El sistema muestra la pantalla de login | |
| 2 | El usuario ingresa email y contraseña | |
| 3 | El sistema valida las credenciales | 3a. Credenciales incorrectas: el sistema muestra error |
| 4 | El sistema verifica el rol del usuario | 4a. Usuario sin rol: muestra mensaje de espera de asignación |
| 5 | El sistema carga el dashboard según el rol | |
| 6 | El sistema registra el inicio de sesión | |

**Post-condiciones:**
- El usuario accede al sistema con los permisos de su rol.
- Se inicia una sesión activa.

**Puntos de extensión:**
- CU-03: Recuperar Contraseña (desde paso 3a)

**Observaciones y datos:**
- La sesión expira después de 30 días de inactividad.
- Se permite mantener sesión iniciada en múltiples dispositivos.

---

## CU-03: Recuperar Contraseña

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Recuperar Contraseña |
| **Nro** | CU-03 |
| **Versión** | 1.0 |
| **Actor** | Usuario (cualquier rol) |
| **Autor** | - |

**Descripción:**
Permite a un usuario recuperar el acceso a su cuenta mediante restablecimiento de contraseña por email.

**Activación:**
El usuario selecciona "Olvidé mi contraseña" en la pantalla de login.

**Pre-condiciones:**
- El usuario tiene una cuenta registrada.
- El usuario tiene acceso al email registrado.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El usuario selecciona "Olvidé mi contraseña" | |
| 2 | El sistema solicita el email | |
| 3 | El usuario ingresa su email | |
| 4 | El sistema verifica que el email existe | 4a. Email no existe: el sistema muestra mensaje genérico por seguridad |
| 5 | El sistema envía enlace de recuperación | |
| 6 | El usuario accede al enlace desde su email | 6a. Enlace expirado: el usuario debe solicitar uno nuevo |
| 7 | El sistema muestra formulario de nueva contraseña | |
| 8 | El usuario ingresa y confirma nueva contraseña | |
| 9 | El sistema actualiza la contraseña | |
| 10 | El sistema confirma el cambio exitoso | |

**Post-condiciones:**
- La contraseña del usuario ha sido actualizada.
- Las sesiones anteriores se mantienen activas.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- El enlace de recuperación expira en 1 hora.
- Por seguridad, no se indica si el email existe o no.

---

## CU-04: Registrar Ubicación

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Ubicación |
| **Nro** | CU-04 |
| **Versión** | 1.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor registrar una nueva ubicación física (casa, negocio o edificio) en el sistema.

**Activación:**
El colportor selecciona "Registrar ubicación" o toca un punto en el mapa.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- El colportor tiene una zona asignada.
- El dispositivo tiene GPS activo (opcional pero recomendado).

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor selecciona "Nueva ubicación" | 1a. El colportor toca en el mapa: se autocompletan coordenadas |
| 2 | El sistema muestra formulario de ubicación | |
| 3 | El colportor selecciona tipo (CASA, NEGOCIO, EDIFICIO) | |
| 4 | El colportor ingresa calle y número | |
| 5 | El sistema obtiene coordenadas GPS automáticamente | 5a. Sin GPS: el colportor puede ingresar manualmente o buscar dirección |
| 6 | El sistema verifica que no existe ubicación duplicada | 6a. Ubicación existe: el sistema muestra la existente y pregunta si quiere verla |
| 7 | El sistema asigna la zona automáticamente | 7a. Fuera de zona asignada: el sistema advierte pero permite continuar |
| 8 | El colportor confirma el registro | |
| 9 | El sistema guarda la ubicación | 9a. Sin conexión: se guarda localmente para sincronizar después |

**Post-condiciones:**
- La ubicación queda registrada en el sistema.
- Si es EDIFICIO, el colportor puede agregar espacios (departamentos).
- Si es CASA o NEGOCIO, se crea automáticamente un espacio asociado.

**Puntos de extensión:**
- CU-05: Registrar Espacio (para edificios)
- CU-06: Registrar Cliente (después de crear ubicación)

**Observaciones y datos:**
- Tipos de ubicación: CASA, NEGOCIO, EDIFICIO
- Las coordenadas GPS son opcionales pero mejoran la funcionalidad de mapas.

---

## CU-05: Registrar Espacio

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Espacio |
| **Nro** | CU-05 |
| **Versión** | 1.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor registrar un espacio dentro de una ubicación tipo EDIFICIO (departamentos, oficinas).

**Activación:**
El colportor accede a una ubicación tipo EDIFICIO y selecciona "Agregar espacio".

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- Existe una ubicación tipo EDIFICIO registrada.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede a la ubicación | |
| 2 | El colportor selecciona "Agregar espacio" | |
| 3 | El sistema muestra formulario de espacio | |
| 4 | El colportor ingresa número de departamento | |
| 5 | El colportor ingresa piso (opcional) | |
| 6 | El colportor ingresa descripción (opcional) | |
| 7 | El sistema verifica que no existe espacio duplicado en esa ubicación | 7a. Espacio existe: el sistema muestra error |
| 8 | El sistema guarda el espacio | 8a. Sin conexión: se guarda localmente |

**Post-condiciones:**
- El espacio queda registrado dentro de la ubicación.
- El colportor puede agregar clientes al espacio.

**Puntos de extensión:**
- CU-06: Registrar Cliente

**Observaciones y datos:**
- Para CASA y NEGOCIO, el espacio se crea automáticamente con numero_depto = NULL.
- El piso es útil para organizar la navegación en edificios grandes.

---

## CU-06: Registrar Cliente

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Cliente |
| **Nro** | CU-06 |
| **Versión** | 1.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor registrar una persona (cliente potencial) asociada a un espacio.

**Activación:**
El colportor accede a un espacio y selecciona "Agregar persona".

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- Existe un espacio registrado.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede al espacio | |
| 2 | El colportor selecciona "Agregar persona" | |
| 3 | El sistema muestra formulario de persona | |
| 4 | El colportor ingresa nombre y apellido | |
| 5 | El colportor ingresa teléfono (opcional) | |
| 6 | El sistema pregunta si tiene ubicación de cobranza alternativa | 6a. Sí: el colportor selecciona o registra la ubicación alternativa |
| 7 | El sistema crea la relación espacio-persona | |
| 8 | El sistema guarda los datos | 8a. Sin conexión: se guarda localmente |

**Post-condiciones:**
- La persona queda registrada y asociada al espacio.
- Se puede agendar visitas y registrar ventas para esta persona.

**Puntos de extensión:**
- CU-04: Registrar Ubicación (para ubicación de cobranza alternativa)
- CU-07: Agendar Visita

**Observaciones y datos:**
- Una misma persona puede estar en múltiples espacios (ej: vive en un lugar, trabaja en otro).
- La ubicación de cobranza alternativa es útil para negocios donde el dueño cobra en su casa.

---

## CU-07: Agendar Visita

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Agendar Visita |
| **Nro** | CU-07 |
| **Versión** | 1.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor programar una visita futura a un cliente, ya sea para entrevista o cobranza.

**Activación:**
El colportor selecciona "Agendar visita" desde el perfil de una persona o desde la agenda.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- Existe una persona registrada en un espacio.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor selecciona "Agendar visita" | |
| 2 | El sistema muestra formulario de agenda | |
| 3 | El colportor selecciona el tipo (ENTREVISTA o COBRANZA) | |
| 4 | El colportor selecciona fecha y hora | 4a. Fecha pasada: el sistema muestra error |
| 5 | Si es COBRANZA, el sistema pregunta por ubicación | 5a. Ubicación alternativa: se selecciona la ubicación de cobranza configurada |
| 6 | El colportor confirma la agenda | |
| 7 | El sistema guarda con estado PENDIENTE | 7a. Sin conexión: se guarda localmente |

**Post-condiciones:**
- La agenda queda registrada como PENDIENTE.
- Aparecerá en el listado de visitas programadas del colportor.
- Se enviará notificación de recordatorio.

**Puntos de extensión:**
- CU-08: Registrar Resultado de Visita

**Observaciones y datos:**
- Tipos de agenda: ENTREVISTA, COBRANZA
- Estados: PENDIENTE, COMPLETADA, CANCELADA
- Las cobranzas pueden ser en ubicación alternativa si está configurada.

---

## CU-08: Registrar Resultado de Visita

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Resultado de Visita |
| **Nro** | CU-08 |
| **Versión** | 1.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor registrar qué ocurrió en una visita a un cliente.

**Activación:**
El colportor accede a una agenda pendiente o selecciona "Registrar visita" desde un espacio-persona.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- Existe una persona registrada.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor selecciona la persona o agenda | |
| 2 | El colportor selecciona "Registrar visita" | |
| 3 | El sistema muestra formulario de visita | |
| 4 | El colportor selecciona el resultado | |
| 5 | El colportor agrega notas (opcional) | |
| 6 | El sistema registra fecha y hora actual | |
| 7 | El sistema guarda la visita | 7a. Sin conexión: se guarda localmente |
| 8 | Si había agenda asociada, se marca como COMPLETADA | |

**Post-condiciones:**
- La visita queda registrada en el historial.
- Si el resultado fue VENTA, se habilita el registro de venta.
- La agenda asociada (si existe) cambia a COMPLETADA.

**Puntos de extensión:**
- CU-09: Registrar Venta (si resultado = VENTA)
- CU-07: Agendar Visita (si resultado = ENTREVISTA, para agendar seguimiento)

**Observaciones y datos:**
- Resultados posibles: VENTA, NO_CONTESTO, RECHAZO, ENTREVISTA
- ENTREVISTA significa que hubo conversación pero no venta, puede agendarse seguimiento.

---

## CU-09: Registrar Venta

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Venta |
| **Nro** | CU-09 |
| **Versión** | 1.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor registrar una venta de materiales a un cliente.

**Activación:**
El colportor selecciona "Registrar venta" después de una visita exitosa o desde el perfil de una persona.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- Existe una persona registrada.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor selecciona "Registrar venta" | |
| 2 | El sistema muestra formulario de venta | |
| 3 | El colportor ingresa número de talonario | 3a. Número duplicado: el sistema advierte |
| 4 | El colportor selecciona productos vendidos | |
| 5 | El sistema calcula el monto total según precios de zona | 5a. El colportor puede ajustar el monto si hay descuento |
| 6 | El colportor confirma la venta | |
| 7 | El sistema guarda la venta | 7a. Sin conexión: se guarda localmente |

**Post-condiciones:**
- La venta queda registrada con fecha y monto.
- Se habilita el registro de entrega y cobranza.
- En V2: se actualiza el stock del colportor.

**Puntos de extensión:**
- CU-10: Registrar Entrega de Material
- CU-11: Registrar Cobranza

**Observaciones y datos:**
- El número de talonario es el recibo físico que se entrega al cliente.
- Los precios se toman de la configuración de la zona.

---

## CU-10: Registrar Entrega de Material

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Entrega de Material |
| **Nro** | CU-10 |
| **Versión** | 1.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor registrar la entrega física de materiales a un cliente, que puede ser inmediata o diferida.

**Activación:**
El colportor selecciona "Registrar entrega" desde una venta o desde el perfil del cliente.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- Existe una venta registrada para el cliente.
- Hay materiales pendientes de entrega.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede a la venta o cliente | |
| 2 | El colportor selecciona "Registrar entrega" | |
| 3 | El sistema muestra los materiales pendientes de entrega | |
| 4 | El colportor selecciona los materiales a entregar | 4a. Entrega parcial: solo selecciona algunos materiales |
| 5 | El colportor confirma la entrega | |
| 6 | El sistema registra la entrega con fecha | 6a. Sin conexión: se guarda localmente |

**Post-condiciones:**
- Los materiales entregados quedan registrados.
- El cliente tiene un registro de materiales "en casa" pendientes de pago completo.
- En V2: se descuenta del stock del colportor.

**Puntos de extensión:**
- CU-11: Registrar Cobranza

**Observaciones y datos:**
- La entrega puede ser inmediata (al momento de la venta) o diferida (en otra visita).
- Se lleva control de qué materiales tiene el cliente.

---

## CU-11: Registrar Cobranza

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Cobranza |
| **Nro** | CU-11 |
| **Versión** | 1.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor registrar un pago recibido de un cliente, parcial o total.

**Activación:**
El colportor selecciona "Registrar pago" desde una venta o desde el perfil del cliente.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- Existe una venta con saldo pendiente.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede a la venta o cliente | |
| 2 | El colportor selecciona "Registrar pago" | |
| 3 | El sistema muestra el saldo pendiente | |
| 4 | El colportor ingresa el monto recibido | 4a. Monto mayor al saldo: el sistema advierte |
| 5 | El colportor selecciona método de pago | |
| 6 | Si es tarjeta, el sistema solicita cargar ticket | 6a. V1: se registra sin ticket; V2: se habilita CU-26 |
| 7 | El colportor confirma el pago | |
| 8 | El sistema actualiza el saldo del cliente | 8a. Sin conexión: se guarda localmente |

**Post-condiciones:**
- El pago queda registrado.
- El saldo pendiente del cliente se actualiza.
- Si el pago es total, la venta queda saldada.

**Puntos de extensión:**
- CU-26: Cargar Ticket de Tarjeta (V2)
- CU-07: Agendar Visita (para próxima cuota)

**Observaciones y datos:**
- Métodos de pago: EFECTIVO, TARJETA, TRANSFERENCIA
- Se permiten pagos parciales (cuotas).
- El efectivo queda como "dinero en mano" del colportor.

---

## CU-12: Iniciar Jornada

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Iniciar Jornada |
| **Nro** | CU-12 |
| **Versión** | 1.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor registrar el inicio de su jornada de trabajo del día.

**Activación:**
El colportor selecciona "Iniciar jornada" al comenzar a trabajar.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- No tiene una jornada activa del día actual.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor selecciona "Iniciar jornada" | |
| 2 | El sistema verifica que no hay jornada activa | 2a. Jornada activa: el sistema muestra opción de continuar o finalizar |
| 3 | El sistema registra fecha y hora de inicio | |
| 4 | El sistema pregunta si está siendo acompañado | 4a. Sí: se registra el acompañamiento |
| 5 | El sistema confirma el inicio de jornada | 5a. Sin conexión: se guarda localmente |

**Post-condiciones:**
- La jornada queda iniciada.
- Se comienza a contabilizar el tiempo trabajado.
- El coordinador puede ver que el colportor está activo.

**Puntos de extensión:**
- CU-13: Finalizar Jornada

**Observaciones y datos:**
- Solo se permite una jornada activa por día.
- El acompañamiento puede indicarse al inicio o durante la jornada.

---

## CU-13: Finalizar Jornada

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Finalizar Jornada |
| **Nro** | CU-13 |
| **Versión** | 1.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor registrar el fin de su jornada de trabajo del día.

**Activación:**
El colportor selecciona "Finalizar jornada" al terminar de trabajar.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- Tiene una jornada activa.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor selecciona "Finalizar jornada" | |
| 2 | El sistema muestra resumen del día | |
| 3 | El sistema pregunta si hubo acompañamiento | 3a. Sí y no estaba registrado: se permite agregar |
| 4 | El colportor confirma la finalización | |
| 5 | El sistema registra hora de fin y calcula horas trabajadas | 5a. Sin conexión: se guarda localmente |

**Post-condiciones:**
- La jornada queda finalizada con el total de horas.
- Los datos quedan disponibles para reportes.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- El coordinador también puede agregar acompañamiento después.
- Las horas se calculan automáticamente.

---

## CU-14: Crear Campaña

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Crear Campaña |
| **Nro** | CU-14 |
| **Versión** | 1.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador crear una nueva campaña de colportaje.

**Activación:**
El coordinador selecciona "Nueva campaña" desde el panel de gestión.

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- El usuario tiene rol de Coordinador asignado.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador selecciona "Nueva campaña" | |
| 2 | El sistema muestra formulario de campaña | |
| 3 | El coordinador ingresa nombre de la campaña | |
| 4 | El coordinador selecciona tipo (VERANO, INVIERNO, PERMANENTE) | |
| 5 | El coordinador ingresa fecha de inicio y fin | 5a. Fechas inválidas: el sistema muestra error |
| 6 | El coordinador selecciona ciudad | |
| 7 | El coordinador confirma la creación | |
| 8 | El sistema guarda la campaña | |

**Post-condiciones:**
- La campaña queda creada y activa.
- El coordinador puede añadir colportores a la campaña.

**Puntos de extensión:**
- CU-15: Añadir Colportor a Campaña

**Observaciones y datos:**
- Tipos: VERANO (3 meses), INVIERNO (1 mes), PERMANENTE (varios meses).
- La campaña está asociada a una ciudad principal.

---

## CU-15: Añadir Colportor a Campaña

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Añadir Colportor a Campaña |
| **Nro** | CU-15 |
| **Versión** | 1.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador asociar un colportor registrado a su campaña.

**Activación:**
El coordinador selecciona "Añadir colportor" desde la gestión de campaña.

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- Existe una campaña creada.
- El colportor tiene una cuenta registrada sin campaña asignada.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador accede a la campaña | |
| 2 | El coordinador selecciona "Añadir colportor" | |
| 3 | El sistema muestra lista de usuarios disponibles | |
| 4 | El coordinador busca por nombre o email | 4a. No encuentra: el usuario no está registrado |
| 5 | El coordinador selecciona el colportor | |
| 6 | El sistema asigna rol COLPORTOR al usuario | |
| 7 | El sistema asocia al colportor con la campaña | |
| 8 | El sistema confirma la asignación | |

**Post-condiciones:**
- El colportor queda asociado a la campaña.
- El colportor puede ver la campaña al iniciar sesión.
- Falta asignarle una zona para comenzar a trabajar.

**Puntos de extensión:**
- CU-16: Asignar Zona a Colportor

**Observaciones y datos:**
- Un colportor solo puede estar en una campaña a la vez.
- El colportor puede cambiar de ciudad dentro de la misma campaña.

---

## CU-16: Asignar Zona a Colportor

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Asignar Zona a Colportor |
| **Nro** | CU-16 |
| **Versión** | 1.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador designar una zona de trabajo a un colportor.

**Activación:**
El coordinador selecciona un colportor y elige "Asignar zona".

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- El colportor está en la campaña del coordinador.
- Existen zonas configuradas en la ciudad.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador selecciona el colportor | |
| 2 | El coordinador selecciona "Asignar zona" | |
| 3 | El sistema muestra las zonas disponibles en la ciudad | |
| 4 | El coordinador selecciona una zona | 4a. Zona ya tiene colportor: el sistema advierte pero permite |
| 5 | El coordinador confirma la asignación | |
| 6 | El sistema actualiza la zona del colportor | |

**Post-condiciones:**
- El colportor tiene una zona asignada.
- El colportor puede comenzar a registrar ubicaciones y trabajar.
- Las nuevas ubicaciones se asocian automáticamente a esa zona.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- Una zona puede tener múltiples colportores.
- El colportor puede trabajar fuera de su zona si es necesario.

---

## CU-17: Ver Avance de Colportores

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Ver Avance de Colportores |
| **Nro** | CU-17 |
| **Versión** | 1.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador visualizar el progreso de cada colportor en su zona.

**Activación:**
El coordinador accede al dashboard o selecciona "Ver avance".

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- Tiene colportores asignados a su campaña.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador accede al panel de avance | |
| 2 | El sistema muestra lista de colportores con resumen | |
| 3 | El coordinador puede filtrar por zona o colportor | |
| 4 | El sistema muestra métricas por colportor: | |
|   | - Casas visitadas | |
|   | - Resultados (ventas, rechazos, etc.) | |
|   | - Horas trabajadas | |
| 5 | El coordinador puede ver detalle de un colportor | |
| 6 | El sistema muestra mapa con ubicaciones y estado | 6a. Sin datos: el sistema indica que no hay registros |

**Post-condiciones:**
- El coordinador visualiza el estado actual del avance.

**Puntos de extensión:**
- CU-18: Generar Reporte de Horas

**Observaciones y datos:**
- El mapa muestra colores según última visita: verde (venta), amarillo (entrevista), rojo (rechazo), gris (no contestó).
- Se puede ver avance diario, semanal o total de campaña.

---

## CU-18: Generar Reporte de Horas

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Generar Reporte de Horas |
| **Nro** | CU-18 |
| **Versión** | 1.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador generar un reporte de horas trabajadas por sus colportores.

**Activación:**
El coordinador selecciona "Generar reporte" desde el panel de reportes.

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- Existen jornadas registradas por los colportores.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador accede a "Reportes" | |
| 2 | El coordinador selecciona "Reporte de horas" | |
| 3 | El coordinador selecciona rango de fechas | |
| 4 | El coordinador selecciona colportores (todos o específicos) | |
| 5 | El sistema genera el reporte | |
| 6 | El sistema muestra tabla con: | |
|   | - Colportor | |
|   | - Días trabajados | |
|   | - Horas totales | |
|   | - Promedio diario | |
|   | - Jornadas con acompañamiento | |
| 7 | El coordinador puede exportar a PDF/Excel | 7a. Error de exportación: el sistema muestra error |

**Post-condiciones:**
- El reporte queda generado y disponible para descarga.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- El reporte incluye detalle de cada jornada si se requiere.
- Se indica cuántas jornadas tuvieron acompañamiento.

---

## CU-19: Configurar Precios por Zona

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Configurar Precios por Zona |
| **Nro** | CU-19 |
| **Versión** | 1.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador establecer los precios de venta de productos/colecciones para su zona.

**Activación:**
El coordinador selecciona "Configurar precios" desde el panel de configuración.

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- Existe un catálogo de productos definido por el administrador.
- El coordinador tiene zonas asignadas.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador accede a "Configurar precios" | |
| 2 | El sistema muestra el catálogo de productos | |
| 3 | El coordinador selecciona una zona | |
| 4 | El coordinador puede crear colecciones (agrupaciones de productos) | |
| 5 | El coordinador asigna precio a cada producto o colección | 5a. Sin precio: se usa el precio base del catálogo |
| 6 | El coordinador confirma la configuración | |
| 7 | El sistema guarda los precios para la zona | |

**Post-condiciones:**
- Los precios quedan configurados para la zona.
- Los colportores de esa zona verán estos precios al registrar ventas.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- Los precios pueden variar por ciudad/zona.
- Las colecciones permiten agrupar libros con un precio conjunto.

---

## CU-20: Gestionar Ciudades y Zonas

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Gestionar Ciudades y Zonas |
| **Nro** | CU-20 |
| **Versión** | 1.0 |
| **Actor** | Administrador |
| **Autor** | - |

**Descripción:**
Permite al administrador crear y administrar las ciudades y zonas del sistema.

**Activación:**
El administrador accede a "Gestión territorial" desde el panel de administración.

**Pre-condiciones:**
- El administrador ha iniciado sesión.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El administrador accede a "Gestión territorial" | |
| 2 | El sistema muestra lista de ciudades | |
| 3 | El administrador puede crear una ciudad | 3a. Ciudad duplicada: el sistema muestra error |
| 4 | El administrador ingresa nombre y país | |
| 5 | El sistema guarda la ciudad | |
| 6 | El administrador puede crear zonas dentro de la ciudad | |
| 7 | El administrador ingresa nombre de la zona | 7a. Zona duplicada en la ciudad: error |
| 8 | El sistema guarda la zona | |

**Post-condiciones:**
- Las ciudades y zonas quedan disponibles para asignar a campañas y colportores.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- Las zonas son subdivisiones de una ciudad.
- Se pueden editar y eliminar ciudades/zonas sin campañas activas.

---

## CU-21: Asignar Rol de Coordinador

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Asignar Rol de Coordinador |
| **Nro** | CU-21 |
| **Versión** | 1.0 |
| **Actor** | Administrador |
| **Autor** | - |

**Descripción:**
Permite al administrador asignar el rol de Coordinador a un usuario registrado.

**Activación:**
El administrador selecciona un usuario y elige "Asignar rol".

**Pre-condiciones:**
- El administrador ha iniciado sesión.
- El usuario tiene una cuenta registrada.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El administrador accede a "Gestión de usuarios" | |
| 2 | El sistema muestra lista de usuarios | |
| 3 | El administrador busca el usuario | |
| 4 | El administrador selecciona "Asignar rol" | |
| 5 | El administrador selecciona "Coordinador" | |
| 6 | El sistema actualiza el rol del usuario | |
| 7 | El sistema notifica al usuario del cambio | |

**Post-condiciones:**
- El usuario tiene rol de Coordinador.
- Puede crear campañas y gestionar colportores.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- Solo el administrador puede asignar este rol.
- El coordinador puede gestionar múltiples campañas.

---

## CU-22: Ver Estadísticas Generales

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Ver Estadísticas Generales |
| **Nro** | CU-22 |
| **Versión** | 1.0 |
| **Actor** | Administrador |
| **Autor** | - |

**Descripción:**
Permite al administrador visualizar estadísticas globales del sistema a nivel país.

**Activación:**
El administrador accede al dashboard principal.

**Pre-condiciones:**
- El administrador ha iniciado sesión.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El administrador accede al dashboard | |
| 2 | El sistema muestra resumen general: | |
|   | - Total de campañas activas | |
|   | - Total de colportores activos | |
|   | - Ventas totales del período | |
|   | - Comparativa con período anterior | |
| 3 | El administrador puede filtrar por período | |
| 4 | El administrador puede ver detalle por ciudad | |
| 5 | El sistema muestra gráficos de tendencias | 5a. Sin datos: el sistema indica período sin registros |

**Post-condiciones:**
- El administrador visualiza el estado general del sistema.

**Puntos de extensión:**
- CU-35: Ver Mapa de Ventas (V2)

**Observaciones y datos:**
- Las estadísticas se actualizan en tiempo real o con sincronización periódica.
- Se pueden exportar los datos.

---

## CU-23: Gestionar Catálogo de Productos

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Gestionar Catálogo de Productos |
| **Nro** | CU-23 |
| **Versión** | 1.0 |
| **Actor** | Administrador |
| **Autor** | - |

**Descripción:**
Permite al administrador gestionar el catálogo de productos disponibles para venta (libros, revistas, materiales).

**Activación:**
El administrador accede a "Gestión de productos" desde el panel de administración.

**Pre-condiciones:**
- El administrador ha iniciado sesión.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El administrador accede a "Productos" | |
| 2 | El sistema muestra catálogo actual | |
| 3 | El administrador selecciona "Nuevo producto" | 3a. Editar existente: selecciona producto de la lista |
| 4 | El sistema muestra formulario | |
| 5 | El administrador ingresa: | |
|   | - Nombre del producto | |
|   | - Categoría (Libro, Revista, Material) | |
|   | - Precio base de costo | |
|   | - Es bonificable (Sí/No) | |
|   | - Es misionero (Sí/No) | |
|   | - Descripción (opcional) | |
|   | - Imagen (opcional) | |
| 6 | El administrador confirma | |
| 7 | El sistema guarda el producto | |
| 8 | El sistema marca el catálogo para sincronización delta | |

**Post-condiciones:**
- El producto queda disponible en el catálogo.
- Los dispositivos recibirán la actualización en próxima sincronización delta.

**Puntos de extensión:**
- CU-19: Configurar Precios por Zona (Coordinador)

**Observaciones y datos:**
- Bonificable: cuenta para la beca.
- Misionero: libro barato para mantener el día a día del colportor.
- El precio de costo es lo que paga el colportor a la editora.
- El catálogo se sincroniza mediante delta (solo cambios).

---

# VERSIÓN 2 (V2) - CASOS DE USO

---

## CU-24: Ver Stock Propio

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Ver Stock Propio |
| **Nro** | CU-23 |
| **Versión** | 2.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor visualizar su inventario actual de materiales.

**Activación:**
El colportor accede a la sección "Mi stock" desde el menú.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- El colportor tiene stock asignado.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede a "Mi stock" | |
| 2 | El sistema muestra lista de productos con cantidades | |
| 3 | El sistema diferencia bonificables y no bonificables | |
| 4 | El colportor puede filtrar por categoría | |
| 5 | El sistema muestra totales: | |
|   | - Cantidad total de items | |
|   | - Valor total a precio de costo | |
|   | - Items bonificables vs no bonificables | |

**Post-condiciones:**
- El colportor conoce su inventario actual.

**Puntos de extensión:**
- CU-24: Solicitar Transferencia de Stock

**Observaciones y datos:**
- El stock se descuenta automáticamente al registrar entregas.
- Los productos bonificables se marcan con indicador visual.

---

## CU-24: Solicitar Transferencia de Stock

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Solicitar Transferencia de Stock |
| **Nro** | CU-24 |
| **Versión** | 2.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor solicitar transferir parte de su stock a otro colportor.

**Activación:**
El colportor selecciona "Transferir stock" desde su inventario.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- El colportor tiene stock disponible.
- Existe otro colportor en la misma campaña.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor selecciona "Transferir stock" | |
| 2 | El sistema muestra su stock disponible | |
| 3 | El colportor selecciona productos y cantidades | 3a. Cantidad mayor a stock: error |
| 4 | El colportor selecciona el colportor destino | |
| 5 | El colportor confirma la solicitud | |
| 6 | El sistema crea solicitud con estado PENDIENTE | |
| 7 | El sistema notifica al coordinador | |

**Post-condiciones:**
- La solicitud queda pendiente de autorización.
- El stock no se mueve hasta la autorización.

**Puntos de extensión:**
- CU-29: Autorizar Transferencia de Stock (Coordinador)

**Observaciones y datos:**
- Las transferencias requieren autorización del coordinador.
- La transferencia mueve la deuda junto con el stock.

---

## CU-25: Ver Estado de Cuenta

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Ver Estado de Cuenta |
| **Nro** | CU-25 |
| **Versión** | 2.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor visualizar su situación financiera completa.

**Activación:**
El colportor accede a "Mi cuenta" desde el menú.

**Pre-condiciones:**
- El colportor ha iniciado sesión.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede a "Mi cuenta" | |
| 2 | El sistema calcula y muestra: | |
|   | - Deuda total (con casa editora) | |
|   | - Depósito (tarjeta + efectivo depositado) | |
|   | - Dinero en mano (efectivo cobrado) | |
|   | - Por cobrar (clientes con saldo) | |
| 3 | El sistema muestra balance neto | |
| 4 | El colportor puede ver detalle de cada concepto | |
| 5 | El sistema muestra historial de movimientos | |

**Post-condiciones:**
- El colportor conoce su situación financiera actual.

**Puntos de extensión:**
- CU-27: Registrar Depósito de Efectivo

**Observaciones y datos:**
- Deuda = valor de stock recibido
- El dinero de tarjeta va directo a depósito
- El efectivo está en mano hasta que se deposita

---

## CU-26: Cargar Ticket de Tarjeta

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Cargar Ticket de Tarjeta |
| **Nro** | CU-26 |
| **Versión** | 2.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor adjuntar la foto del ticket de un pago con tarjeta.

**Activación:**
El colportor registra un pago con tarjeta o accede a pagos pendientes de ticket.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- Existe un pago con tarjeta registrado.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede al pago con tarjeta | |
| 2 | El colportor selecciona "Cargar ticket" | |
| 3 | El sistema abre la cámara o galería | |
| 4 | El colportor toma foto o selecciona imagen | |
| 5 | El sistema muestra vista previa | |
| 6 | El colportor confirma la carga | |
| 7 | El sistema sube la imagen | 7a. Sin conexión: se guarda para subir después |
| 8 | El sistema notifica al coordinador | |

**Post-condiciones:**
- El ticket queda asociado al pago.
- El coordinador puede revisar el ticket.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- Los pagos con tarjeta sin ticket quedan marcados como pendientes.
- El coordinador debe revisar los tickets.

---

## CU-27: Registrar Depósito de Efectivo

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Depósito de Efectivo |
| **Nro** | CU-27 |
| **Versión** | 2.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor registrar cuando entrega efectivo al coordinador o deposita en cuenta.

**Activación:**
El colportor selecciona "Registrar depósito" desde su estado de cuenta.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- El colportor tiene dinero en mano.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede a "Registrar depósito" | |
| 2 | El sistema muestra dinero en mano disponible | |
| 3 | El colportor ingresa monto a depositar | 3a. Monto mayor a disponible: error |
| 4 | El colportor selecciona tipo de depósito | |
|   | - Entrega a coordinador | |
|   | - Depósito bancario | |
| 5 | El colportor confirma | |
| 6 | El sistema actualiza la cuenta | |
| 7 | El sistema notifica al coordinador | |

**Post-condiciones:**
- El dinero pasa de "en mano" a "depositado".
- El coordinador debe validar el depósito.

**Puntos de extensión:**
- CU-31: Revisar Cuenta de Colportor (Coordinador)

**Observaciones y datos:**
- El dinero depositado reduce el "dinero en mano".
- El coordinador valida que se recibió el efectivo.

---

## CU-28: Registrar Pedido a Casa Editora

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Pedido a Casa Editora |
| **Nro** | CU-28 |
| **Versión** | 2.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador registrar un pedido de materiales para un colportor.

**Activación:**
El coordinador selecciona "Nuevo pedido" desde la gestión de stock.

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- El colportor está en su campaña.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador selecciona "Nuevo pedido" | |
| 2 | El coordinador selecciona el colportor | |
| 3 | El sistema muestra catálogo de productos | |
| 4 | El coordinador selecciona productos y cantidades | |
| 5 | El sistema calcula el costo total | |
| 6 | El sistema verifica situación financiera del colportor | 6a. Deuda alta: el sistema advierte |
| 7 | El coordinador confirma el pedido | |
| 8 | El sistema genera la deuda al colportor | |
| 9 | El sistema actualiza el stock del colportor | |

**Post-condiciones:**
- El stock del colportor aumenta.
- La deuda del colportor aumenta por el valor del pedido.

**Puntos de extensión:**
- CU-30: Autorizar Pedido de Stock (si requiere autorización superior)

**Observaciones y datos:**
- El pedido genera deuda inmediata al colportor.
- El precio es el de costo (compra a editora).
- Diferencia entre productos bonificables y no bonificables.

---

## CU-29: Autorizar Transferencia de Stock

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Autorizar Transferencia de Stock |
| **Nro** | CU-29 |
| **Versión** | 2.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador aprobar o rechazar una solicitud de transferencia de stock entre colportores.

**Activación:**
El coordinador recibe notificación o accede a "Solicitudes pendientes".

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- Existe una solicitud de transferencia pendiente.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador accede a solicitudes pendientes | |
| 2 | El sistema muestra detalle de la transferencia | |
|   | - Colportor origen y destino | |
|   | - Productos y cantidades | |
|   | - Valor total | |
| 3 | El coordinador revisa la información | |
| 4 | El coordinador aprueba la transferencia | 4a. Rechaza: el sistema cancela la solicitud y notifica |
| 5 | El sistema mueve el stock entre colportores | |
| 6 | El sistema ajusta las deudas correspondientes | |
| 7 | El sistema notifica a ambos colportores | |

**Post-condiciones:**
- El stock y la deuda se transfieren entre colportores.
- Ambos colportores son notificados.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- La deuda se transfiere junto con el stock.
- El coordinador puede agregar observaciones.

---

## CU-30: Autorizar Pedido de Stock

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Autorizar Pedido de Stock |
| **Nro** | CU-30 |
| **Versión** | 2.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador evaluar y autorizar un pedido de stock para un colportor según su situación financiera.

**Activación:**
El coordinador accede a "Pedidos por autorizar" o recibe solicitud.

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- El colportor ha solicitado materiales.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador accede a pedidos pendientes | |
| 2 | El sistema muestra solicitud con: | |
|   | - Productos solicitados | |
|   | - Situación financiera del colportor | |
|   | - Deuda actual | |
|   | - Historial de pagos | |
| 3 | El coordinador evalúa la solicitud | |
| 4 | El coordinador aprueba el pedido | 4a. Rechaza: notifica al colportor con motivo |
|   | | 4b. Aprueba parcialmente: modifica cantidades |
| 5 | El sistema registra el pedido | |
| 6 | El sistema actualiza stock y deuda | |
| 7 | El sistema notifica al colportor | |

**Post-condiciones:**
- El pedido queda autorizado y procesado.
- El colportor recibe su stock.

**Puntos de extensión:**
- CU-28: Registrar Pedido a Casa Editora

**Observaciones y datos:**
- El límite de pedido depende de la situación financiera.
- El coordinador puede modificar la cantidad solicitada.

---

## CU-31: Revisar Cuenta de Colportor

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Revisar Cuenta de Colportor |
| **Nro** | CU-31 |
| **Versión** | 2.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador revisar y validar la cuenta de un colportor.

**Activación:**
El coordinador selecciona un colportor y accede a "Ver cuenta".

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- El colportor está en su campaña.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador selecciona el colportor | |
| 2 | El coordinador accede a "Ver cuenta" | |
| 3 | El sistema muestra estado de cuenta completo: | |
|   | - Deuda total | |
|   | - Depósitos realizados | |
|   | - Dinero en mano | |
|   | - Por cobrar | |
|   | - Historial de movimientos | |
| 4 | El coordinador puede validar depósitos pendientes | |
| 5 | El coordinador puede revisar tickets de tarjeta | |
| 6 | El coordinador puede agregar ajustes manuales | 6a. Ajuste: requiere justificación |

**Post-condiciones:**
- Los depósitos quedan validados.
- Los ajustes quedan registrados con justificación.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- El coordinador valida que el efectivo fue recibido.
- Los ajustes manuales quedan en el historial con auditoría.

---

## CU-32: Configurar Metas de Beca

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Configurar Metas de Beca |
| **Nro** | CU-32 |
| **Versión** | 2.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador configurar las metas de libros bonificables para el sistema de becas según la carrera del colportor.

**Activación:**
El coordinador accede a "Configurar becas" desde la gestión de campaña.

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- Tiene una campaña activa.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador accede a "Configurar becas" | |
| 2 | El sistema muestra configuración actual | |
| 3 | El coordinador puede definir tipos de carrera | |
| 4 | Para cada carrera, define: | |
|   | - Meta de media beca (ej: 60 libros) | |
|   | - Meta de beca completa (ej: 120 libros) | |
| 5 | El coordinador asigna carrera a cada colportor | |
| 6 | El sistema guarda la configuración | |

**Post-condiciones:**
- Las metas de beca quedan configuradas.
- Los colportores pueden ver su progreso hacia la beca.

**Puntos de extensión:**
- CU-33: Ver Progreso de Beca

**Observaciones y datos:**
- Carreras más caras tienen metas más altas.
- Solo cuentan los libros bonificables.
- La meta es por campaña.

---

## CU-33: Ver Progreso de Beca

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Ver Progreso de Beca |
| **Nro** | CU-33 |
| **Versión** | 2.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor visualizar su avance hacia la beca de la campaña.

**Activación:**
El colportor accede a "Mi progreso de beca" desde el menú.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- Tiene una carrera y meta asignada.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede a "Mi beca" | |
| 2 | El sistema calcula y muestra: | |
|   | - Libros bonificables vendidos | |
|   | - Meta de media beca y porcentaje | |
|   | - Meta de beca completa y porcentaje | |
|   | - Libros restantes para cada meta | |
| 3 | El sistema muestra gráfico de progreso | |
| 4 | El sistema muestra proyección según ritmo actual | 4a. Sin suficientes datos: no muestra proyección |

**Post-condiciones:**
- El colportor conoce su progreso hacia la beca.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- Solo cuentan ventas de productos bonificables.
- La bonificación se paga al cumplir la meta.

---

## CU-34: Gestionar Catálogo de Productos

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Gestionar Catálogo de Productos |
| **Nro** | CU-34 |
| **Versión** | 2.0 |
| **Actor** | Administrador |
| **Autor** | - |

**Descripción:**
Permite al administrador gestionar el catálogo de productos del sistema.

**Activación:**
El administrador accede a "Gestión de productos" desde el panel.

**Pre-condiciones:**
- El administrador ha iniciado sesión.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El administrador accede a "Productos" | |
| 2 | El sistema muestra catálogo actual | |
| 3 | El administrador puede crear nuevo producto | |
| 4 | El administrador ingresa: | |
|   | - Nombre del producto | |
|   | - Categoría (Libro, Revista, Material) | |
|   | - Precio base de costo | |
|   | - Es bonificable (Sí/No) | |
|   | - Es misionero (Sí/No) | |
| 5 | El administrador confirma | |
| 6 | El sistema guarda el producto | |

**Post-condiciones:**
- El producto queda disponible en el catálogo.
- Los coordinadores pueden configurar precios de venta.

**Puntos de extensión:**
- CU-19: Configurar Precios por Zona

**Observaciones y datos:**
- Bonificable: cuenta para la beca.
- Misionero: libro barato para mantener el día a día.
- El precio de costo es el que paga el colportor a la editora.

---

## CU-35: Ver Mapa de Ventas

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Ver Mapa de Ventas |
| **Nro** | CU-35 |
| **Versión** | 2.0 |
| **Actor** | Administrador |
| **Autor** | - |

**Descripción:**
Permite al administrador visualizar las ventas del país en un mapa interactivo tipo heatmap o con luces por venta.

**Activación:**
El administrador accede a "Mapa de ventas" desde el dashboard.

**Pre-condiciones:**
- El administrador ha iniciado sesión.
- Existen ventas registradas con coordenadas GPS.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El administrador accede a "Mapa de ventas" | |
| 2 | El sistema carga el mapa del país | |
| 3 | El sistema muestra las ventas como: | |
|   | - Puntos de luz por cada venta | |
|   | - O heatmap de densidad de ventas | |
| 4 | El administrador puede filtrar por período | |
| 5 | El administrador puede filtrar por ciudad/zona | |
| 6 | El administrador puede hacer zoom para ver detalle | |
| 7 | El sistema muestra estadísticas al seleccionar área | 7a. Sin ventas en área: muestra mensaje |

**Post-condiciones:**
- El administrador visualiza la distribución geográfica de ventas.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- Eslogan "Ilumina" - cada venta es una luz.
- Requiere que las ubicaciones tengan coordenadas GPS.
- Se puede alternar entre vista heatmap y puntos.

---

# VERSIÓN 3 (V3) - CASOS DE USO

---

## CU-36: Obtener Ruta Óptima

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Obtener Ruta Óptima |
| **Nro** | CU-36 |
| **Versión** | 3.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor obtener una ruta optimizada para visitar las casas agendadas del día.

**Activación:**
El colportor selecciona "Optimizar ruta" desde su agenda diaria.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- Tiene visitas agendadas para el día.
- Las ubicaciones tienen coordenadas GPS.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede a "Mi agenda del día" | |
| 2 | El colportor selecciona "Optimizar ruta" | |
| 3 | El sistema obtiene ubicación actual del colportor | 3a. Sin GPS: solicita activar GPS |
| 4 | El sistema calcula ruta óptima (menor distancia) | |
| 5 | El sistema muestra las visitas ordenadas | |
| 6 | El sistema muestra el recorrido en mapa | |
| 7 | El colportor puede iniciar navegación | |
| 8 | El sistema abre app de navegación externa | 8a. Sin app: muestra indicaciones en mapa |

**Post-condiciones:**
- El colportor tiene una ruta optimizada.
- Puede iniciar navegación turn-by-turn.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- Usa algoritmo de optimización de rutas (TSP).
- Se integra con Google Maps, Waze, etc.
- Considera tráfico si está disponible.

---

## CU-37: Registrar Gasto Personal

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Gasto Personal |
| **Nro** | CU-37 |
| **Versión** | 3.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor registrar sus gastos personales durante la campaña para llevar control de sus finanzas.

**Activación:**
El colportor selecciona "Registrar gasto" desde la sección de finanzas personales.

**Pre-condiciones:**
- El colportor ha iniciado sesión.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede a "Mis finanzas" | |
| 2 | El colportor selecciona "Nuevo gasto" | |
| 3 | El sistema muestra formulario | |
| 4 | El colportor ingresa: | |
|   | - Monto | |
|   | - Categoría (comida, transporte, etc.) | |
|   | - Descripción (opcional) | |
| 5 | El colportor confirma | |
| 6 | El sistema guarda el gasto | |

**Post-condiciones:**
- El gasto queda registrado en las finanzas personales.
- Se actualiza el balance personal.

**Puntos de extensión:**
- CU-38: Ver Balance de Finanzas Personales

**Observaciones y datos:**
- Categorías sugeridas: comida, transporte, alojamiento, otros.
- Datos privados del colportor, no visibles para coordinador.

---

## CU-38: Ver Balance de Finanzas Personales

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Ver Balance de Finanzas Personales |
| **Nro** | CU-38 |
| **Versión** | 3.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor visualizar su balance de finanzas personales durante la campaña.

**Activación:**
El colportor accede a "Mis finanzas" desde el menú.

**Pre-condiciones:**
- El colportor ha iniciado sesión.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede a "Mis finanzas" | |
| 2 | El sistema calcula y muestra: | |
|   | - Ingresos (ganancia de ventas) | |
|   | - Gastos registrados | |
|   | - Balance neto | |
| 3 | El sistema muestra gráfico de gastos por categoría | |
| 4 | El sistema muestra proyección de ganancia | |
| 5 | El colportor puede filtrar por período | |

**Post-condiciones:**
- El colportor conoce su situación financiera personal.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- La ganancia se calcula: precio venta - precio costo.
- No incluye la beca (se suma al final de campaña).
- Datos privados del colportor.

---

## CU-39: Activar Tracking en Tiempo Real

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Activar Tracking en Tiempo Real |
| **Nro** | CU-39 |
| **Versión** | 3.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor activar el seguimiento de su ubicación en tiempo real durante la jornada laboral.

**Activación:**
El colportor activa la opción "Compartir ubicación" al iniciar jornada.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- El colportor ha iniciado su jornada.
- El dispositivo tiene GPS activo.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor inicia jornada o accede a configuración | |
| 2 | El colportor activa "Compartir ubicación" | |
| 3 | El sistema solicita permiso de ubicación en segundo plano | 3a. Permiso denegado: no se activa el tracking |
| 4 | El sistema comienza a enviar ubicación periódicamente | |
| 5 | El colportor puede ver indicador de tracking activo | |
| 6 | El colportor puede desactivar en cualquier momento | |
| 7 | Al finalizar jornada, se desactiva automáticamente | |

**Post-condiciones:**
- La ubicación del colportor es visible para el coordinador.
- Se guarda historial de recorrido.

**Puntos de extensión:**
- CU-40: Monitorear Colportores en Tiempo Real

**Observaciones y datos:**
- Funcionalidad opcional, el colportor decide si activar.
- Consume batería, se advierte al usuario.
- Frecuencia de actualización configurable (30s - 5min).

---

## CU-40: Monitorear Colportores en Tiempo Real

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Monitorear Colportores en Tiempo Real |
| **Nro** | CU-40 |
| **Versión** | 3.0 |
| **Actor** | Coordinador |
| **Autor** | - |

**Descripción:**
Permite al coordinador ver la ubicación en tiempo real de los colportores que tienen tracking activo.

**Activación:**
El coordinador accede a "Mapa en vivo" desde su dashboard.

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- Existen colportores con tracking activo.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador accede a "Mapa en vivo" | |
| 2 | El sistema muestra mapa con colportores activos | |
| 3 | Cada colportor se muestra como marcador con: | |
|   | - Nombre | |
|   | - Última actualización | |
|   | - Estado de jornada | |
| 4 | El coordinador puede seleccionar un colportor | |
| 5 | El sistema muestra recorrido del día | |
| 6 | El coordinador puede ver estadísticas en vivo | 6a. Colportor sin tracking: aparece en gris |

**Post-condiciones:**
- El coordinador visualiza la actividad en tiempo real.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- Solo se muestran colportores con tracking activado voluntariamente.
- Se indica la hora de última actualización.
- Útil para acompañamiento remoto.

---

## CU-41: Cargar Ticket de Depósito Bancario

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Cargar Ticket de Depósito Bancario |
| **Nro** | CU-41 |
| **Versión** | 3.0 |
| **Actor** | Colportor |
| **Autor** | - |

**Descripción:**
Permite al colportor cargar el comprobante/ticket de un depósito bancario realizado.

**Activación:**
El colportor selecciona "Cargar depósito" desde su estado de cuenta.

**Pre-condiciones:**
- El colportor ha iniciado sesión.
- El colportor ha realizado un depósito bancario.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El colportor accede a "Mi cuenta" | |
| 2 | El colportor selecciona "Cargar depósito" | |
| 3 | El sistema abre la cámara o galería | |
| 4 | El colportor toma foto o selecciona imagen del ticket | |
| 5 | El colportor ingresa monto del depósito | |
| 6 | El colportor ingresa fecha del depósito | |
| 7 | El colportor agrega observaciones (opcional) | |
| 8 | El sistema muestra vista previa | |
| 9 | El colportor confirma la carga | |
| 10 | El sistema guarda el ticket con estado PENDIENTE | 10a. Sin conexión: se guarda localmente |
| 11 | El sistema notifica al coordinador/financiero | |

**Post-condiciones:**
- El ticket queda pendiente de validación.
- El coordinador/financiero es notificado.

**Puntos de extensión:**
- CU-42: Validar Ticket de Depósito

**Observaciones y datos:**
- El depósito NO se refleja en la cuenta hasta ser validado.
- Los tickets sin conexión se envían en la próxima sincronización.

---

## CU-42: Validar Ticket de Depósito

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Validar Ticket de Depósito |
| **Nro** | CU-42 |
| **Versión** | 3.0 |
| **Actor** | Coordinador/Financiero |
| **Autor** | - |

**Descripción:**
Permite al coordinador/financiero validar o rechazar un ticket de depósito cargado por un colportor.

**Activación:**
El coordinador recibe notificación o accede a "Tickets pendientes".

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- Existe un ticket de depósito pendiente de validación.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador accede a "Tickets pendientes" | |
| 2 | El sistema muestra lista de tickets por validar | |
| 3 | El coordinador selecciona un ticket | |
| 4 | El sistema muestra: | |
|   | - Imagen del ticket | |
|   | - Monto declarado | |
|   | - Fecha del depósito | |
|   | - Datos del colportor | |
| 5 | El coordinador verifica que el ticket es válido | |
| 6 | El coordinador aprueba el ticket | 6a. Rechaza: ingresa motivo y notifica al colportor |
| 7 | El sistema actualiza el estado a APROBADO | |
| 8 | El sistema notifica al colportor | |

**Post-condiciones:**
- El ticket queda validado o rechazado.
- Si es aprobado, está listo para registrar en Sistema Brasil.

**Puntos de extensión:**
- CU-43: Registrar Depósito en Sistema Brasil

**Observaciones y datos:**
- El coordinador debe verificar que el monto coincida.
- Los tickets rechazados pueden volver a cargarse corregidos.

---

## CU-43: Registrar Depósito en Sistema Brasil

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Registrar Depósito en Sistema Brasil |
| **Nro** | CU-43 |
| **Versión** | 3.0 |
| **Actor** | Coordinador/Financiero |
| **Autor** | - |

**Descripción:**
Permite al coordinador registrar un depósito validado en el sistema de Brasil mediante API.

**Activación:**
El coordinador selecciona "Registrar en Brasil" desde un ticket aprobado.

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- El ticket de depósito está validado/aprobado.
- Hay conexión a internet.
- La API de Brasil está disponible.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador selecciona ticket aprobado | |
| 2 | El coordinador selecciona "Registrar en Brasil" | |
| 3 | El sistema prepara los datos para la API | |
| 4 | El sistema envía la solicitud a la API de Brasil | 4a. Error de conexión: el sistema guarda para reintentar |
| 5 | La API de Brasil responde con confirmación | 5a. Error de API: el sistema muestra error y opciones |
| 6 | El sistema actualiza el estado a REGISTRADO | |
| 7 | El sistema actualiza la cuenta del colportor localmente | |
| 8 | El sistema notifica al colportor | |

**Post-condiciones:**
- El depósito queda registrado en el sistema de Brasil.
- La cuenta del colportor se actualiza en ambos sistemas.

**Puntos de extensión:**
- CU-46: Sincronizar Cuenta con Sistema Brasil (en caso de discrepancias)

**Observaciones y datos:**
- Los errores de API se registran para seguimiento.
- El sistema debe manejar timeouts y reintentos.

---

## CU-44: Realizar Pedido vía API Brasil

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Realizar Pedido vía API Brasil |
| **Nro** | CU-44 |
| **Versión** | 3.0 |
| **Actor** | Coordinador/Financiero |
| **Autor** | - |

**Descripción:**
Permite al coordinador realizar un pedido de libros/productos a la casa editora mediante la API del sistema de Brasil.

**Activación:**
El coordinador selecciona "Nuevo pedido" desde la gestión de stock.

**Pre-condiciones:**
- El coordinador ha iniciado sesión.
- Hay conexión a internet.
- La API de Brasil está disponible.
- El colportor tiene situación financiera aprobada.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El coordinador accede a "Nuevo pedido" | |
| 2 | El coordinador selecciona el colportor | |
| 3 | El sistema consulta catálogo actualizado de la API Brasil | 3a. Error de conexión: usa catálogo local |
| 4 | El coordinador selecciona productos y cantidades | |
| 5 | El sistema calcula el total | |
| 6 | El sistema verifica situación financiera del colportor | 6a. Deuda alta: advierte pero permite continuar |
| 7 | El coordinador confirma el pedido | |
| 8 | El sistema envía el pedido a la API de Brasil | 8a. Error: guarda como borrador para reintentar |
| 9 | La API responde con número de pedido | |
| 10 | El sistema registra el pedido localmente | |
| 11 | El sistema genera la deuda al colportor | |
| 12 | El sistema notifica al colportor | |

**Post-condiciones:**
- El pedido queda registrado en el sistema de Brasil.
- El colportor tiene una deuda pendiente.
- Se puede consultar el estado del pedido.

**Puntos de extensión:**
- CU-45: Consultar Estado de Pedido Brasil

**Observaciones y datos:**
- El pedido genera deuda inmediata al colportor.
- El stock se actualiza cuando llega el despacho.

---

## CU-45: Consultar Estado de Pedido Brasil

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Consultar Estado de Pedido Brasil |
| **Nro** | CU-45 |
| **Versión** | 3.0 |
| **Actor** | Coordinador, Colportor |
| **Autor** | - |

**Descripción:**
Permite consultar el estado de un pedido realizado al sistema de Brasil.

**Activación:**
El usuario accede a "Mis pedidos" o "Pedidos de colportores".

**Pre-condiciones:**
- El usuario ha iniciado sesión.
- Existe un pedido registrado.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El usuario accede a la lista de pedidos | |
| 2 | El usuario selecciona un pedido | |
| 3 | El sistema consulta estado en API Brasil | 3a. Sin conexión: muestra último estado conocido |
| 4 | El sistema muestra: | |
|   | - Número de pedido | |
|   | - Fecha de solicitud | |
|   | - Productos solicitados | |
|   | - Estado actual (PENDIENTE, EN_PROCESO, DESPACHADO, ENTREGADO) | |
|   | - Fecha estimada de entrega | |
| 5 | Si hay cambio de estado, se actualiza localmente | |

**Post-condiciones:**
- El usuario conoce el estado actualizado del pedido.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- Estados posibles: PENDIENTE, EN_PROCESO, DESPACHADO, ENTREGADO, CANCELADO
- El colportor solo ve sus propios pedidos.
- El coordinador ve todos los pedidos de su campaña.

---

## CU-46: Sincronizar Cuenta con Sistema Brasil

| Campo | Valor |
|-------|-------|
| **Caso de uso** | Sincronizar Cuenta con Sistema Brasil |
| **Nro** | CU-46 |
| **Versión** | 3.0 |
| **Actor** | Sistema (automático), Coordinador (manual) |
| **Autor** | - |

**Descripción:**
Sincroniza el saldo de cuenta del colportor entre el sistema local y el sistema de Brasil.

**Activación:**
- Automática: periódicamente o al detectar discrepancias.
- Manual: el coordinador selecciona "Sincronizar cuenta".

**Pre-condiciones:**
- Hay conexión a internet.
- La API de Brasil está disponible.

| Paso | Curso Normal | Curso Alternativo |
|------|--------------|-------------------|
| 1 | El sistema inicia sincronización | |
| 2 | El sistema consulta saldo en API Brasil | 2a. Error de conexión: marca para reintentar |
| 3 | El sistema compara con saldo local | |
| 4 | Si hay discrepancia, el sistema la registra | |
| 5 | El sistema actualiza el saldo local con el de Brasil | 5a. Discrepancia grande: notifica al coordinador |
| 6 | El sistema registra la sincronización | |

**Post-condiciones:**
- Los saldos están sincronizados.
- Las discrepancias quedan registradas para revisión.

**Puntos de extensión:**
- Ninguno

**Observaciones y datos:**
- El sistema de Brasil es la fuente de verdad para saldos.
- Discrepancias mayores al 5% generan alerta.
- Se registra historial de sincronizaciones.

---

# DIAGRAMA DE CASOS DE USO

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        SISTEMA DE COLPORTAJE                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────┐                                           ┌─────────────┐     │
│  │Colportor│                                           │ Coordinador │     │
│  └────┬────┘                                           └──────┬──────┘     │
│       │                                                       │            │
│       ├── CU-04: Registrar Ubicación                          │            │
│       ├── CU-05: Registrar Espacio                            │            │
│       ├── CU-06: Registrar Cliente                            │            │
│       ├── CU-07: Agendar Visita                               │            │
│       ├── CU-08: Registrar Resultado Visita                   │            │
│       ├── CU-09: Registrar Venta                              │            │
│       ├── CU-10: Registrar Entrega                            │            │
│       ├── CU-11: Registrar Cobranza                           │            │
│       ├── CU-12: Iniciar Jornada                              │            │
│       ├── CU-13: Finalizar Jornada                            │            │
│       ├── CU-23: Ver Stock (V2)                               │            │
│       ├── CU-24: Solicitar Transferencia (V2)                 │            │
│       ├── CU-25: Ver Estado Cuenta (V2)                       │            │
│       ├── CU-26: Cargar Ticket (V2)                           │            │
│       ├── CU-27: Registrar Depósito (V2)                      │            │
│       ├── CU-33: Ver Progreso Beca (V2)                       │            │
│       ├── CU-36: Obtener Ruta Óptima (V3)                     │            │
│       ├── CU-37: Registrar Gasto (V3)           ┌─────────────┤            │
│       ├── CU-38: Ver Balance (V3)               │             │            │
│       └── CU-39: Activar Tracking (V3)          │             │            │
│                                                 │             │            │
│                                                 │   ├── CU-14: Crear Campaña
│                                                 │   ├── CU-15: Añadir Colportor
│  ┌───────────┐                                  │   ├── CU-16: Asignar Zona
│  │Administra-│                                  │   ├── CU-17: Ver Avance
│  │   dor     │                                  │   ├── CU-18: Generar Reporte
│  └─────┬─────┘                                  │   ├── CU-19: Config Precios
│        │                                        │   ├── CU-28: Registrar Pedido (V2)
│        ├── CU-20: Gestionar Ciudades/Zonas      │   ├── CU-29: Autorizar Transfer (V2)
│        ├── CU-21: Asignar Rol Coordinador       │   ├── CU-30: Autorizar Pedido (V2)
│        ├── CU-22: Ver Estadísticas              │   ├── CU-31: Revisar Cuenta (V2)
│        ├── CU-34: Gestionar Catálogo (V2)       │   ├── CU-32: Config Metas Beca (V2)
│        └── CU-35: Ver Mapa Ventas (V2)          │   └── CU-40: Monitorear Tiempo Real (V3)
│                                                 │             │            │
│                                                 └─────────────┘            │
│                                                                             │
│  ┌──────────┐                                                              │
│  │ Usuario  │── CU-01: Registrar Usuario                                   │
│  │(Cualquier│── CU-02: Iniciar Sesión                                      │
│  │   rol)   │── CU-03: Recuperar Contraseña                                │
│  └──────────┘                                                              │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Historial de Revisiones

| Versión | Fecha | Descripción | Autor |
|---------|-------|-------------|-------|
| 1.0 | 25/03/2026 | Versión inicial - 40 casos de uso (V1, V2, V3) | - |
| 1.1 | 25/03/2026 | Agregados CU-23 Gestionar Catálogo (V1), CU-41 a CU-46 Integración con Sistema Brasil (V3). Total: 46 casos de uso | - |

---

*Documento generado siguiendo plantilla de caso de uso estándar*
