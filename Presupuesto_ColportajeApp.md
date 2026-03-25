# Propuesta de Desarrollo
## Sistema de Gestión de Colportaje - "Colportaje App"

**Preparado para:** Unión Uruguaya de la Iglesia Adventista del Séptimo Día
**Fecha:** 25 de marzo de 2026
**Versión:** 1.0

---

## Resumen Ejecutivo

Se propone el desarrollo de una aplicación móvil y panel web que permitirá a los colportores, coordinadores y administradores gestionar de forma eficiente todas las actividades de colportaje: registro de casas y clientes, planificación de visitas, control de ventas, cobranzas y seguimiento del progreso hacia las becas.

**Inversión total estimada:** $2,400 - $3,200 USD
**Costo operativo mensual:** $0 - $25 USD
**Tiempo de desarrollo:** 4-5 meses (V1 + V2)

---

## El Problema Actual

| Situación Actual | Impacto |
|------------------|---------|
| Registro manual en papel o planillas | Errores, pérdida de información, difícil seguimiento |
| Sin visibilidad del avance de colportores | Coordinadores no pueden tomar decisiones a tiempo |
| Control de cuentas en hojas de cálculo | Errores de cálculo, demoras en liquidaciones |
| Sin planificación de rutas | Tiempo perdido en desplazamientos |
| Datos dispersos entre personas | Dificultad para reportes y estadísticas |

---

## La Solución: Colportaje App

### Para el Colportor

**Desde su celular podrá:**
- Registrar las casas que visita con ubicación en el mapa
- Anotar los datos de cada cliente y el resultado de cada visita
- Agendar sus próximas visitas y recibir recordatorios
- Registrar ventas y cobros (efectivo, tarjeta, transferencia)
- Ver cuánto le falta para llegar a la beca
- Iniciar y finalizar su jornada de trabajo
- Funciona sin internet y sincroniza cuando hay conexión

### Para el Coordinador

**Desde su celular o computadora podrá:**
- Ver en el mapa cómo avanzan sus colportores
- Saber cuántas horas trabajó cada uno
- Ver las ventas y el progreso hacia las becas
- Autorizar pedidos de libros
- Revisar las cuentas de cada colportor
- Generar reportes para la administración

### Para la Administración

**Desde la computadora podrá:**
- Ver estadísticas generales del país
- Visualizar un mapa con todas las ventas
- Gestionar el catálogo de productos
- Configurar las metas de becas por carrera

---

## Funcionalidades por Versión

### Versión 1 (V1) - Base Funcional
*Disponible: Julio 2026 (para testing)*

| Funcionalidad | Descripción |
|---------------|-------------|
| Registro de casas y clientes | El colportor registra cada casa con su ubicación en el mapa |
| Planificación de visitas | Agendar cuándo volver a visitar a cada cliente |
| Registro de visitas | Anotar qué pasó: vendió, no estaba, no le interesó, etc. |
| Ventas y cobranzas | Registrar cada venta y los pagos recibidos |
| Control de jornada | Iniciar y finalizar el día de trabajo |
| Asignación de zonas | El coordinador asigna qué zona trabaja cada colportor |
| Reportes básicos | Horas trabajadas, casas visitadas, ventas realizadas |
| Catálogo de productos | El administrador carga los libros y productos disponibles |
| Funciona sin internet | Los datos se guardan en el celular y se envían después |
| Respaldo automático | Cada colportor puede guardar sus datos en su Google Drive |

**Ventajas V1:**
- Los colportores ya no pierden información de clientes
- El coordinador puede ver el avance sin esperar reportes
- Se elimina el papeleo y las planillas manuales

---

### Versión 2 (V2) - Gestión Financiera Completa
*Disponible: Octubre-Noviembre 2026 (antes de verano)*

| Funcionalidad | Descripción |
|---------------|-------------|
| Control de stock | Cada colportor ve qué libros tiene disponibles |
| Transferencia de stock | Un colportor puede pasar libros a otro (con autorización) |
| Estado de cuenta | Ver deuda, depósitos, dinero en mano, pendiente de cobro |
| Cargar tickets | Subir foto del comprobante de pago con tarjeta |
| Sistema de becas | Ver el progreso hacia media beca y beca completa |
| Pedidos de libros | El coordinador puede registrar pedidos para cada colportor |
| Mapa de ventas | Ver dónde se concentran las ventas en el país |

**Ventajas V2:**
- Control financiero transparente para todos
- Los colportores saben exactamente cuánto les falta para la beca
- Se reduce el tiempo de liquidaciones y cierres de campaña

---

### Versión 3 (V3) - Integración y Optimización
*Disponible: 2027 (para próxima campaña completa)*

| Funcionalidad | Descripción |
|---------------|-------------|
| Ruta óptima | La app sugiere el mejor recorrido para visitar las casas agendadas |
| Finanzas personales | El colportor puede llevar control de sus gastos |
| Conexión con sistema Brasil | Los depósitos y pedidos se registran automáticamente en el sistema de la editorial |
| Seguimiento en tiempo real | (Opcional) El coordinador puede ver dónde está cada colportor |

**Ventajas V3:**
- Se ahorra tiempo en desplazamientos
- Se eliminan errores de carga manual en el sistema de Brasil
- Los colportores pueden planificar mejor sus finanzas personales

---

## Cronograma de Desarrollo

```
2026
├── Abril-Mayo ────────► Desarrollo V1 (8 semanas)
├── Junio ─────────────► Pruebas internas
├── Julio ─────────────► V1 LISTA - Testing con colportores reales
├── Agosto-Septiembre ─► Correcciones + Desarrollo V2
├── Octubre ───────────► Pruebas V2
├── Noviembre ─────────► V2 LISTA - Listo para campaña de verano
└── Diciembre-Febrero ─► Campaña de VERANO con sistema completo

2027
├── Marzo-Junio ───────► Desarrollo V3
└── Julio+ ────────────► V3 disponible para campaña de invierno
```

---

## Inversión Requerida

### Costos de Desarrollo

| Versión | Tiempo Estimado | Costo |
|---------|-----------------|-------|
| **V1** - Base Funcional | 8-10 semanas | $1,200 - $1,500 USD |
| **V2** - Gestión Financiera | 6-8 semanas | $900 - $1,200 USD |
| **V3** - Integración Brasil | 6-8 semanas | $900 - $1,200 USD |
| **Total** | 20-26 semanas | **$3,000 - $3,900 USD** |

*Nota: Los costos están calculados considerando el mercado uruguayo para un desarrollador con experiencia previa en sistemas similares.*

### Opción Recomendada: V1 + V2

Para tener el sistema funcionando en la **campaña de verano 2026-2027**:

| Concepto | Costo |
|----------|-------|
| Desarrollo V1 + V2 | $2,100 - $2,700 USD |
| Margen para imprevistos (15%) | $300 - $400 USD |
| **Total V1 + V2** | **$2,400 - $3,100 USD** |

### Forma de Pago Sugerida

| Hito | Monto | Fecha |
|------|-------|-------|
| Inicio del proyecto (adelanto) | 30% (~$750 USD) | Abril 2026 |
| Entrega V1 funcional | 35% (~$875 USD) | Julio 2026 |
| Entrega V2 completa | 35% (~$875 USD) | Noviembre 2026 |

---

## Costos Operativos Mensuales

Una vez desarrollado, el sistema tiene costos mínimos de operación:

| Concepto | Costo Mensual | Notas |
|----------|---------------|-------|
| Servidor y base de datos (Supabase) | $0 - $25 USD | Plan gratuito cubre hasta ~200 usuarios |
| Almacenamiento de respaldos | $0 USD | Cada usuario usa su Google Drive personal |
| Notificaciones push | $0 USD | Plan gratuito de Firebase |
| **Total mensual** | **$0 - $25 USD** | |

**Costo anual de operación: $0 - $300 USD**

*Nota: El sistema está diseñado para minimizar costos. Los datos de clientes se guardan en el celular de cada colportor, no en servidores de pago.*

---

## Comparativa de Inversión

### Costo por Colportor

Asumiendo 100 colportores en campaña:

| Concepto | Cálculo | Costo por Colportor |
|----------|---------|---------------------|
| Desarrollo (V1+V2) | $2,750 / 100 | $27.50 USD (único) |
| Operación anual | $150 / 100 | $1.50 USD/año |

### Ahorro Estimado

| Beneficio | Ahorro Estimado |
|-----------|-----------------|
| Reducción de errores en registros | 5-10 horas/mes por coordinador |
| Eliminación de papeleo | Costo de formularios y planillas |
| Liquidaciones más rápidas | 2-3 días menos al fin de campaña |
| Mejor seguimiento = más ventas | Potencial aumento de 5-10% |

---

## Ventajas Clave del Sistema

### Privacidad y Seguridad
- Los datos de los clientes quedan en el celular del colportor, no en internet
- Cada colportor controla su propio respaldo
- Cumple con la ley de protección de datos de Uruguay

### Funciona Sin Internet
- Perfecto para zonas rurales o con mala señal
- Los datos se sincronizan cuando hay conexión WiFi

### Bajo Costo de Mantenimiento
- Diseñado para operar con presupuesto mínimo
- Sin costos de servidores costosos
- Escala sin aumentar significativamente los costos

### Experiencia del Desarrollador
- 2 años de experiencia en desarrollo
- 1 año trabajando en un sistema muy similar
- Conocimiento del contexto del colportaje

---

## Alcance y Limitaciones

### Lo que INCLUYE este presupuesto:
- Aplicación móvil para Android e iOS (colportores)
- Panel web para coordinadores y administradores
- Soporte durante el desarrollo
- Corrección de errores por 3 meses post-entrega
- Capacitación básica para coordinadores

### Lo que NO incluye:
- Publicación en tiendas de aplicaciones (Google Play, App Store)*
- Servidor dedicado (se usa plan gratuito)
- Soporte técnico extendido (negociable)
- Modificaciones mayores fuera del alcance acordado

*La publicación tiene un costo único de ~$25 USD (Google Play) y ~$99 USD/año (App Store). Se puede distribuir la app de forma alternativa sin estos costos.*

---

## Riesgos y Mitigaciones

| Riesgo | Probabilidad | Cómo se mitiga |
|--------|--------------|----------------|
| Retraso en el desarrollo | Media | Margen de tiempo incluido en cronograma |
| El sistema de Brasil no tiene API | Media | Se puede operar manualmente hasta V3 |
| Colportores sin celular compatible | Baja | La app funciona en celulares de 5+ años |
| Pérdida de datos del celular | Media | Respaldo automático a Google Drive |

---

## Próximos Pasos

1. **Aprobación del presupuesto** - Decisión de la administración
2. **Reunión de inicio** - Definir detalles específicos y prioridades
3. **Firma de acuerdo** - Formalizar términos y forma de pago
4. **Inicio del desarrollo** - Abril 2026
5. **Primera versión de prueba** - Julio 2026

---

## Contacto

**Desarrollador:** [Tu nombre]
**Email:** [Tu email]
**Teléfono:** [Tu teléfono]

---

*Este documento es una propuesta inicial. Los costos y tiempos pueden ajustarse según los requerimientos específicos que se definan en la reunión de inicio del proyecto.*
