# Sistema Hotelero — Caso de Referencia para Base de Datos

Este subproyecto es un caso académico para la asignatura **Modelado y Gestión de Base de Datos**.

Su propósito es ayudar al estudiante a interpretar un dominio de hotelería y convertirlo en requerimientos, reglas de negocio, entidades candidatas, relaciones posibles y diagramas iniciales.

No es una solución completa. No entrega el modelo final de datos. Cada equipo debe diseñar y justificar su propio modelo.

## Alcance del caso

El dominio representa operaciones básicas de un hotel:

- reservas;
- habitaciones;
- check-in;
- check-out;
- consumos internos;
- pagos;
- caja;
- inventario;
- auditoría.

## Qué debe analizar el estudiante

- Qué datos necesita guardar el hotel.
- Qué procesos cambian el estado de esos datos.
- Qué entidades podrían existir.
- Qué relaciones deben analizarse.
- Qué reglas de negocio deben protegerse desde la base de datos.
- Qué datos canónicos se requieren.
- Qué datos volumétricos permiten probar el modelo.
- Qué consultas SQL validarían el comportamiento del sistema.

## Archivos de esta carpeta

- [docs/REQUERIMIENTOS.md](docs/REQUERIMIENTOS.md): requerimientos iniciales y reglas de negocio.
- [docs/DIAGRAMAS_INICIALES.md](docs/DIAGRAMAS_INICIALES.md): diagramas de contexto, proceso y modelo conceptual inicial.

## Uso esperado

El profesor puede usar este caso para explicar cómo pasar de un dominio a un modelo de datos.

El estudiante puede usarlo como inspiración, pero no debe copiarlo como modelo obligatorio.

## Enfoque técnico del taller

Este caso debe conectarse con los entregables de base de datos:

- DDL;
- DML;
- Docker;
- migraciones con Liquibase;
- rollback;
- datos canónicos;
- datos volumétricos;
- trigger;
- procedure;
- function;
- consulta con JOIN de más de 5 tablas.
