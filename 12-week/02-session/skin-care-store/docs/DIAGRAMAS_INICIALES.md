# Diagramas Iniciales — Skin Care Store

Estos diagramas son puntos de partida para interpretar el dominio. No representan el modelo final obligatorio.

## 1. Diagrama de contexto

```mermaid
flowchart LR
    Cliente[Cliente] --> Catalogo[Consulta catálogo]
    Cliente --> Carrito[Gestiona carrito]
    Cliente --> Pedido[Genera pedido]
    Administrador[Administrador] --> Productos[Gestiona productos]
    Administrador --> Parametros[Gestiona datos canónicos]
    Operador[Operador de tienda] --> Inventario[Controla inventario]
    Auditor[Revisor] --> Reportes[Consulta reportes]

    Catalogo --> BD[(Base de datos)]
    Carrito --> BD
    Pedido --> BD
    Productos --> BD
    Parametros --> BD
    Inventario --> BD
    Reportes --> BD
```

## 2. Flujo inicial de compra

```mermaid
flowchart TD
    A[Registrar productos y categorías] --> B[Consultar catálogo]
    B --> C[Agregar productos al carrito]
    C --> D[Validar cantidades]
    D --> E[Generar pedido]
    E --> F[Registrar pago]
    F --> G[Actualizar inventario]
    G --> H[Consultar venta]
```

## 3. Modelo conceptual inicial

```mermaid
erDiagram
    CLIENTE ||--o{ CARRITO : crea
    CARRITO ||--o{ ITEM_CARRITO : contiene
    PRODUCTO ||--o{ ITEM_CARRITO : seleccionado
    CLIENTE ||--o{ PEDIDO : realiza
    PEDIDO ||--o{ ITEM_PEDIDO : detalla
    PRODUCTO ||--o{ ITEM_PEDIDO : vendido
    CATEGORIA ||--o{ PRODUCTO : clasifica
    MARCA ||--o{ PRODUCTO : agrupa
    PEDIDO ||--o{ PAGO : registra
    PRODUCTO ||--o{ MOVIMIENTO_INVENTARIO : afecta
```

## 4. Relaciones que el estudiante debe analizar

- Un carrito puede o no convertirse en pedido.
- Un pedido debe conservar detalle de productos, cantidades y valores.
- Un producto puede tener categoría, marca o clasificación equivalente.
- Un movimiento de inventario debe explicar el cambio de existencia.
- Un pago debe estar relacionado con una operación válida.
- Una reseña puede relacionarse con cliente y producto, pero el equipo debe definir sus condiciones.

## 5. Posible consulta compleja

Pregunta orientadora:

> Qué clientes realizaron pedidos pagados en un periodo, con detalle de productos, categoría, marca y movimiento de inventario asociado?

Esta pregunta puede requerir un JOIN de más de 5 tablas, pero el diseño exacto depende del modelo construido por el equipo.
