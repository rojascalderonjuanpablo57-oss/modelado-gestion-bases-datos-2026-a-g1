# Taller Proyecto Final — Modelado y Gestión de Base de Datos

## 1. Información general

- **Asignatura:** Modelado y Gestión de Base de Datos.
- **Tipo de actividad:** Taller proyecto final.
- **Profesor:** Pendiente: nombre del profesor.
- **Corte:** Pendiente: corte académico.
- **Parcial:** Pendiente: parcial asociado.
- **Fecha de entrega:** Pendiente: fecha de entrega.
- **Modalidad de entrega:** Pendiente: modalidad de entrega.
- **Medio de publicación:** Pendiente: ruta en syllabus/Moodle, si aplica.

Esta guía define el proyecto final de la asignatura. El alcance técnico se limita a base de datos: DDL, DML, Docker, migraciones, rollback, objetos SQL y consultas de validación.

## 2. Objetivo de aprendizaje

El estudiante diseñará, documentará e implementará un modelo de base de datos relacional para un dominio seleccionado, aplicando modelado conceptual, lógico y físico, separación DDL/DML, migraciones con Liquibase, ejecución mediante Docker, rollback, carga de datos canónicos y volumétricos, y validación mediante consultas SQL.

## 3. Contexto del proyecto

Cada equipo debe seleccionar o proponer un dominio de trabajo. Puede inspirarse en los dominios de referencia `sistema-hotelero` y `skin-care-store`, pero no debe copiarlos ni tratarlos como modelos obligatorios.

El estudiante debe demostrar que entiende el problema antes de crear tablas. Por eso, la documentación debe explicar:

1. qué problema se quiere representar;
2. qué procesos ocurren en el dominio;
3. qué datos se necesitan;
4. qué entidades podrían existir;
5. qué relaciones se deben analizar;
6. qué reglas de negocio deben protegerse;
7. qué datos canónicos y volumétricos se cargarán;
8. qué consultas SQL validarán el modelo.

El diseño final del modelo debe ser construido y sustentado por cada equipo.

### Flujo de trabajo sugerido

El equipo debe trabajar en fases cortas y verificables:

1. **Observación:** revisar el dominio, leer los casos de referencia y anotar dudas.
2. **Análisis:** identificar procesos, entidades candidatas, relaciones posibles y reglas de negocio.
3. **Diseño:** construir modelo conceptual, lógico, físico y diccionario de datos.
4. **Implementación:** crear DDL, DML, migraciones Liquibase, Docker y rollback.
5. **Validación:** ejecutar migraciones, rollback, cargas de datos, objetos SQL y consultas JOIN.
6. **Entrega:** organizar evidencias en `project-docs` y dejar `project-bd` ejecutable para el profesor.

## 4. Dominios de referencia

Los proyectos `sistema-hotelero` y `skin-care-store` quedan como subproyectos académicos de referencia dentro de esta sesión. Cada carpeta contiene una versión depurada con:

- explicación del dominio;
- requerimientos iniciales;
- reglas de negocio;
- entidades candidatas;
- relaciones posibles;
- diagramas iniciales;
- pistas de datos canónicos y volumétricos.

Estos subproyectos no entregan el modelo resuelto. Su función es ayudar al estudiante a interpretar un dominio y convertirlo en un proyecto de base de datos.

### 4.1 `sistema-hotelero`

Dominio operacional de hotelería. Sirve para analizar reservas, habitaciones, check-in, check-out, consumos, pagos, caja, inventario y auditoría.

Pistas de análisis:

- actores posibles: recepcionista, administrador, personal de restaurante/bar, housekeeping, auditor;
- procesos posibles: registrar reserva, asignar habitación, hacer check-in, registrar consumo, pagar, hacer check-out, cerrar caja;
- entidades candidatas: usuario, rol, huésped, reserva, habitación, tipo de habitación, folio, orden, pago, producto, inventario, caja;
- reglas posibles: una habitación no puede asignarse si no está disponible; un check-out debe consolidar consumos y pagos; un cierre de caja debe conservar evidencia.

### 4.2 `skin-care-store`

Dominio comercial de tienda de productos. Sirve para analizar catálogo, productos, categorías, marcas, carrito, pedidos, pagos, descuentos, reseñas e inventario.

Pistas de análisis:

- actores posibles: cliente, administrador, operador de tienda;
- procesos posibles: registrar producto, consultar catálogo, agregar al carrito, generar pedido, registrar pago, aplicar cupón, actualizar inventario;
- entidades candidatas: usuario, producto, categoría, marca, carrito, ítem de carrito, pedido, ítem de pedido, pago, reseña, cupón;
- reglas posibles: el stock no debe ser negativo; un pedido debe tener detalle; un cupón debe tener vigencia; una reseña puede requerir compra previa.

### 4.3 Referencia técnica `shopping-cart`

El repositorio histórico de apoyo `https://github.com/code-corhuila/base-datos-ii-2026-a-g1`, ruta `12-week/02-session/shopping-cart`, se usa solo como referencia técnica para organizar un proyecto con Docker y Liquibase.

Para esta materia se debe tomar únicamente lo relacionado con:

- DDL;
- DML;
- Docker;
- migraciones;
- rollback;
- estructura de changelogs;
- evidencias reproducibles.

## 5. Organización del equipo y GitHub

Cada equipo debe crear o usar una GitHub Organization.

La documentación debe incluir:

- `name-project`: nombre del proyecto;
- `team`: nombre del equipo;
- `people`: integrantes del equipo;
- `add people`: miembros agregados a la organización;
- `profesor/revisor`: agregar el usuario `ariel5253`.

El equipo debe documentar:

- integrantes;
- roles;
- responsabilidades;
- aportes principales;
- evidencias de trabajo colaborativo.

## 6. Repositorios obligatorios

La entrega final debe estar organizada en dos repositorios dentro de la GitHub Organization del equipo:

1. `project-docs`: documentación del proyecto.
2. `project-bd`: base de datos, Docker, Liquibase, migraciones, rollback y datos.

### 6.1 Estructura sugerida para `project-docs`

```text
project-docs/
|-- README.md
|-- 01-planteamiento-problema.md
|-- 02-requerimientos.md
|-- 03-reglas-negocio.md
|-- 04-diagramas-iniciales.md
|-- 05-modelo-conceptual.md
|-- 06-modelo-logico.md
|-- 07-modelo-fisico.md
|-- 08-diccionario-datos.md
|-- 09-evidencias.md
`-- 10-conclusiones.md
```

### 6.2 Estructura sugerida para `project-bd`

```text
project-bd/
|-- docker/
|-- liquibase/
|   |-- changelog/
|   |-- ddl/
|   `-- dml/
|       |-- canonical/
|       `-- volumetric/
|-- rollback/
|-- scripts/
|-- docs/
|-- docker-compose.yml
|-- liquibase.properties.example
`-- README.md
```

La estructura puede ajustarse si el equipo justifica técnicamente su decisión, pero siempre debe separar DDL y DML.

## 7. Requerimientos técnicos obligatorios

### 7.1 Alcance obligatorio de base de datos

El proyecto debe incluir:

- DDL;
- DML;
- Docker;
- migraciones con Liquibase;
- rollback funcional;
- datos canónicos;
- datos volumétricos;
- objetos SQL;
- consultas SQL de validación;
- evidencias reproducibles.

### 7.2 DDL

El DDL debe incluir, según el dominio:

- creación de tablas;
- llaves primarias;
- llaves foráneas;
- restricciones `NOT NULL`;
- restricciones `UNIQUE`;
- restricciones `CHECK`;
- índices justificados;
- vistas, si el equipo las necesita;
- triggers;
- procedures;
- functions.

### 7.3 DML

El DML debe incluir:

- inserts de datos canónicos;
- inserts de datos volumétricos;
- updates controlados, si aplica;
- deletes controlados, si aplica;
- consultas SQL de validación.

Los datos canónicos son datos base de parametrización, como estados, roles, tipos, categorías, clasificaciones o catálogos.

Los datos volumétricos son datos de prueba para validar relaciones y consultas. El proyecto debe tener más de 100 registros de prueba en total.

### 7.4 Docker

El proyecto debe permitir levantar la base de datos usando Docker.

Debe incluir:

- `docker-compose.yml`;
- archivo de variables de entorno de ejemplo, si aplica;
- instrucciones para levantar la base de datos;
- instrucciones para ejecutar migraciones;
- instrucciones para ejecutar rollback;
- instrucciones para validar consultas.

### 7.5 Migraciones y rollback

El proyecto debe usar Liquibase para versionar la base de datos.

Debe incluir:

- changelog principal;
- changelog o carpeta para DDL;
- changelog o carpeta para DML;
- migraciones ejecutables;
- rollback documentado;
- rollback funcional;
- evidencia de migración;
- evidencia de rollback.

Comandos de referencia:

```bash
docker compose up -d
docker compose run --rm liquibase validate
docker compose run --rm liquibase update
docker compose run --rm liquibase status
docker compose run --rm liquibase rollback-count --count=1
```

### 7.6 Elementos SQL por cada integrante

Cada integrante del grupo debe entregar 5 evidencias técnicas individuales asociadas al proyecto:

1. Un aporte DDL o DML versionado en Liquibase.
2. Un trigger.
3. Un procedure.
4. Una function.
5. Una consulta SQL con JOIN de más de 5 tablas.

La consulta JOIN debe unir 6 o más tablas y responder una pregunta real del dominio.

Si el grupo tiene varios integrantes, el número total de evidencias debe crecer según la cantidad de integrantes. Ejemplo: si el grupo tiene 3 integrantes, se esperan 3 aportes DDL/DML, 3 triggers, 3 procedures, 3 functions y 3 consultas JOIN de más de 5 tablas.

Cada evidencia debe indicar:

- integrante responsable;
- archivo donde se implementó;
- comando o consulta de prueba;
- resultado esperado;
- evidencia de ejecución.

## 8. Documentación requerida

El estudiante debe documentar:

1. Título del proyecto.
2. Integrantes del equipo.
3. GitHub Organization.
4. Repositorios usados.
5. Planteamiento del problema.
6. Objetivo del proyecto.
7. Alcance.
8. Requerimientos funcionales.
9. Requerimientos no funcionales relacionados con base de datos.
10. Reglas de negocio.
11. Diagramas iniciales.
12. Modelo conceptual.
13. Modelo lógico.
14. Modelo físico.
15. Diccionario de datos.
16. Separación DDL/DML.
17. Descripción de datos canónicos.
18. Descripción de datos volumétricos.
19. Evidencia de Docker.
20. Evidencia de migraciones.
21. Evidencia de rollback.
22. Evidencia de carga de datos.
23. Evidencia del trigger de cada integrante.
24. Evidencia del procedure de cada integrante.
25. Evidencia de la function de cada integrante.
26. Evidencia del JOIN de más de 5 tablas de cada integrante.
27. Problemas encontrados.
28. Soluciones aplicadas.
29. Instrucciones de ejecución.
30. Conclusiones técnicas.

## 9. Entregables

Entregables obligatorios:

1. URL de la GitHub Organization.
2. URL del repositorio `project-docs`.
3. URL del repositorio `project-bd`.
4. README principal.
5. Documento de planteamiento del problema.
6. Documento de requerimientos.
7. Diagramas iniciales.
8. Modelo conceptual.
9. Modelo lógico.
10. Modelo físico.
11. Diccionario de datos.
12. Scripts Liquibase DDL.
13. Scripts Liquibase DML.
14. `docker-compose.yml`.
15. Datos canónicos.
16. Datos volumétricos con más de 100 registros.
17. Evidencia de migración.
18. Evidencia de rollback.
19. Trigger por cada integrante.
20. Procedure por cada integrante.
21. Function por cada integrante.
22. Consulta con JOIN de más de 5 tablas por cada integrante.
23. Registro de integrantes y responsabilidades.
24. Evidencias de trabajo colaborativo.
25. Instrucciones reproducibles para el profesor.

## 10. Criterios / rúbrica de evaluación

La rúbrica se presenta sin porcentajes porque no se suministraron pesos de evaluación. El profesor podrá asociarla al corte o parcial correspondiente según el syllabus/Moodle, si aplica.

| Criterio | Evidencia esperada | Cumple | Observaciones del profesor |
|---|---|---|---|
| Organización del repositorio | Estructura clara para documentación y base de datos. | Pendiente | Pendiente |
| Claridad del problema | Problema comprensible y relacionado con el dominio. | Pendiente | Pendiente |
| Requerimientos | Requerimientos centrados en datos y procesos del dominio. | Pendiente | Pendiente |
| Diagramas iniciales | Diagramas que orientan el análisis sin resolver todo el modelo. | Pendiente | Pendiente |
| Modelo conceptual | Entidades y relaciones de alto nivel justificadas. | Pendiente | Pendiente |
| Modelo lógico | Cardinalidades y reglas de normalización claras. | Pendiente | Pendiente |
| Modelo físico | Tablas, tipos, claves, restricciones e índices adecuados. | Pendiente | Pendiente |
| Diccionario de datos | Descripción coherente de tablas y campos. | Pendiente | Pendiente |
| Separación DDL/DML | Archivos o carpetas diferenciadas. | Pendiente | Pendiente |
| Docker | Base de datos levantada de forma reproducible. | Pendiente | Pendiente |
| Liquibase | Changelogs ejecutables y ordenados. | Pendiente | Pendiente |
| Migraciones | Evidencia de `validate`, `update` y estado. | Pendiente | Pendiente |
| Rollback | Evidencia de rollback funcional. | Pendiente | Pendiente |
| Datos canónicos | Datos base necesarios para el dominio. | Pendiente | Pendiente |
| Datos volumétricos | Más de 100 registros coherentes. | Pendiente | Pendiente |
| Trigger por integrante | Trigger funcional y probado. | Pendiente | Pendiente |
| Procedure por integrante | Procedure funcional y probado. | Pendiente | Pendiente |
| Function por integrante | Function funcional y probada. | Pendiente | Pendiente |
| JOIN por integrante | Consulta con 6 o más tablas y propósito claro. | Pendiente | Pendiente |
| Evidencias | Comandos, resultados y capturas o logs verificables. | Pendiente | Pendiente |
| Reproducibilidad | El profesor puede ejecutar el proyecto con el README. | Pendiente | Pendiente |
| Sustentación técnica | El estudiante justifica las decisiones del modelo. | Pendiente | Pendiente |

## 11. Checklist de validación para el profesor

- [ ] La GitHub Organization existe.
- [ ] El usuario `ariel5253` tiene acceso.
- [ ] El equipo está documentado.
- [ ] Existe el repositorio `project-docs`.
- [ ] Existe el repositorio `project-bd`.
- [ ] Existe README reproducible.
- [ ] Docker levanta correctamente.
- [ ] Liquibase ejecuta migraciones.
- [ ] Liquibase ejecuta rollback.
- [ ] Existe separación DDL/DML.
- [ ] Existen datos canónicos.
- [ ] Existen más de 100 registros volumétricos.
- [ ] Existe modelo conceptual.
- [ ] Existe modelo lógico.
- [ ] Existe modelo físico.
- [ ] Existe diccionario de datos.
- [ ] Existe al menos un aporte DDL o DML por integrante.
- [ ] Existe un trigger por integrante.
- [ ] Existe un procedure por integrante.
- [ ] Existe una function por integrante.
- [ ] Existe una consulta con JOIN de más de 5 tablas por integrante.
- [ ] Existen evidencias de ejecución.
- [ ] La documentación explica el proceso.
- [ ] El modelo no está copiado directamente del material de apoyo.
- [ ] El estudiante justifica las decisiones de diseño.
- [ ] La entrega es reproducible.

## 12. Recomendaciones para el estudiante

- Primero lea el dominio y escriba requerimientos.
- No empiece creando tablas sin entender el problema.
- Use diagramas iniciales para pensar, no para copiar.
- No copie el modelo de `sistema-hotelero`, `skin-care-store` ni `shopping-cart`.
- Mantenga DDL y DML separados.
- Pruebe Docker antes de entregar.
- Pruebe migraciones y rollback antes de entregar.
- Documente el aporte individual de cada integrante.
- La consulta JOIN debe responder una pregunta útil, no unir tablas sin propósito.
- El trigger, procedure y function deben tener sentido dentro del dominio.

## 13. Pendientes

- Pendiente: nombre del profesor.
- Pendiente: corte académico.
- Pendiente: parcial asociado.
- Pendiente: fecha de entrega.
- Pendiente: modalidad de entrega.
- Pendiente: cronograma institucional.
- Pendiente: ruta o actividad en syllabus/Moodle, si aplica.
- Pendiente: escala institucional de evaluación.
- Pendiente: formato de sustentación definido por el profesor.
- Pendiente: política de conformación de equipos.
