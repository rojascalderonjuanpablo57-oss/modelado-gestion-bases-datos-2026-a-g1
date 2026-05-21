# Diagramas Iniciales — Sistema Hotelero

Estos diagramas son puntos de partida para interpretar el dominio. No representan el modelo final obligatorio.

## 1. Diagrama de contexto

```mermaid
flowchart LR
    Recepcion[Recepción] --> Reserva[Gestión de reservas]
    Recepcion --> CheckIn[Check-in / Check-out]
    Restaurante[Restaurante o bar] --> Consumos[Registro de consumos]
    Housekeeping[Housekeeping] --> Habitaciones[Estado de habitaciones]
    Administracion[Administración] --> Reportes[Consultas y reportes]
    Auditoria[Auditoría] --> Pagos[Pagos y caja]

    Reserva --> BD[(Base de datos)]
    CheckIn --> BD
    Consumos --> BD
    Habitaciones --> BD
    Reportes --> BD
    Pagos --> BD
```

## 2. Flujo inicial de estadía

```mermaid
flowchart TD
    A[Registrar reserva] --> B[Validar fechas y disponibilidad]
    B --> C[Asignar habitación]
    C --> D[Realizar check-in]
    D --> E[Registrar consumos]
    E --> F[Registrar pagos]
    F --> G[Realizar check-out]
    G --> H[Cambiar habitación a pendiente de limpieza]
```

## 3. Modelo conceptual inicial

```mermaid
erDiagram
    HUESPED ||--o{ RESERVA : realiza
    TIPO_HABITACION ||--o{ HABITACION : clasifica
    HABITACION ||--o{ RESERVA : puede_asignarse
    RESERVA ||--o| ESTADIA : genera
    ESTADIA ||--o{ CONSUMO : acumula
    CONSUMO }o--|| PRODUCTO : referencia
    ESTADIA ||--o{ PAGO : recibe
    PRODUCTO ||--o{ MOVIMIENTO_INVENTARIO : registra
```

## 4. Relaciones que el estudiante debe analizar

- Una reserva puede o no convertirse en estadía.
- Una habitación puede tener muchos estados a lo largo del tiempo.
- Un consumo puede estar asociado a una estadía o ser venta directa.
- Un pago puede cubrir una o varias obligaciones del dominio.
- Un producto puede afectar inventario, pero el equipo debe decidir cómo registrar esos movimientos.

## 5. Posible consulta compleja

Pregunta orientadora:

> Qué huéspedes tuvieron estadías finalizadas en un periodo, con habitación asignada, consumos registrados, productos consumidos y pagos asociados?

Esta pregunta puede requerir un JOIN de más de 5 tablas, pero el diseño exacto depende del modelo construido por el equipo.
