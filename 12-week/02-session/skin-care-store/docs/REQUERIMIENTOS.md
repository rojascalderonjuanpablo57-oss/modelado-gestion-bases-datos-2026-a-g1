# Requerimientos Iniciales — Skin Care Store

## 1. Planteamiento del problema

Una tienda de productos de cuidado de la piel y maquillaje necesita registrar y consultar información relacionada con productos, categorías, marcas, inventario, carrito, pedidos, pagos, descuentos y reseñas. La base de datos debe permitir representar el ciclo de compra sin entregar un modelo final resuelto.

El estudiante debe interpretar este dominio y construir su propio modelo de datos.

## 2. Actores de referencia

- Cliente: consulta productos, agrega productos al carrito y realiza pedidos.
- Administrador: gestiona productos, categorías, marcas y parámetros base.
- Operador de tienda: revisa pedidos, pagos e inventario.
- Revisor o auditor: consulta trazabilidad de cambios y ventas.

Los actores ayudan a entender procesos, permisos y trazabilidad. No obligan a crear una tabla por cada actor.

## 3. Procesos del dominio

1. Registrar productos.
2. Clasificar productos por categoría o marca.
3. Consultar catálogo.
4. Agregar productos al carrito.
5. Convertir carrito en pedido.
6. Registrar detalle del pedido.
7. Registrar pago.
8. Aplicar descuentos o cupones.
9. Actualizar inventario.
10. Registrar reseñas.
11. Consultar ventas y productos más relevantes.

## 4. Requerimientos funcionales iniciales

RF-01. El sistema debe permitir registrar productos con información básica, clasificación y estado.

RF-02. El sistema debe permitir organizar productos por categorías o clasificaciones del dominio.

RF-03. El sistema debe permitir asociar productos con marcas u otra agrupación comercial, si aplica.

RF-04. El sistema debe permitir registrar existencias o movimientos de inventario.

RF-05. El sistema debe permitir crear un carrito con productos y cantidades.

RF-06. El sistema debe permitir convertir un carrito en pedido.

RF-07. El sistema debe permitir registrar los ítems de un pedido.

RF-08. El sistema debe permitir registrar pagos asociados a pedidos.

RF-09. El sistema debe permitir aplicar reglas de descuento, si el equipo decide incluirlas.

RF-10. El sistema debe permitir registrar reseñas o valoraciones, si el equipo decide incluirlas.

RF-11. El sistema debe permitir consultar ventas por producto, categoría, marca o periodo.

## 5. Requerimientos no funcionales de base de datos

RNF-01. La base de datos debe proteger la integridad referencial con llaves foráneas.

RNF-02. La base de datos debe impedir cantidades negativas cuando el dominio lo requiera.

RNF-03. Las migraciones deben estar versionadas con Liquibase.

RNF-04. El entorno debe levantarse con Docker.

RNF-05. Debe existir rollback funcional para cambios relevantes.

RNF-06. DDL y DML deben estar separados.

RNF-07. La entrega debe incluir evidencias reproducibles para el profesor.

## 6. Reglas de negocio sugeridas

Estas reglas son pistas. El estudiante debe decidir cuáles implementa y cómo las justifica.

- Un producto activo debería tener clasificación válida.
- El stock o existencia no debería ser negativo.
- Un carrito debería tener al menos un ítem para convertirse en pedido.
- Un pedido debería conservar el valor de los productos al momento de la compra.
- Un pago debería estar asociado a una operación válida.
- Un cupón o descuento puede tener vigencia y límites de uso.
- Una reseña puede depender de una compra previa o de una aprobación.

## 7. Entidades candidatas

Posibles entidades para analizar:

- usuario;
- rol;
- cliente;
- producto;
- categoría;
- marca;
- inventario;
- movimiento de inventario;
- carrito;
- ítem de carrito;
- pedido;
- ítem de pedido;
- pago;
- cupón;
- reseña.

No todas son obligatorias. El equipo debe seleccionar y justificar las entidades finales.

## 8. Datos canónicos posibles

- roles;
- estados de producto;
- estados de pedido;
- estados de pago;
- categorías;
- marcas;
- tipos de descuento;
- tipos de movimiento de inventario.

## 9. Datos volumétricos posibles

- productos;
- clientes;
- carritos;
- pedidos;
- ítems de pedido;
- pagos;
- movimientos de inventario;
- reseñas.

## 10. Preguntas SQL de validación

- Qué productos se vendieron más en un periodo?
- Qué categorías generan más pedidos?
- Qué pedidos tienen pago registrado?
- Qué productos tienen bajo inventario?
- Qué consulta requiere unir cliente, pedido, ítem de pedido, producto, categoría, marca y pago?
