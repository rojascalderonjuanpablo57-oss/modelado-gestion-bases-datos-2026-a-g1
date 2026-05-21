# Requerimientos Iniciales — Sistema Hotelero

## 1. Planteamiento del problema

Un hotel necesita registrar y consultar información relacionada con reservas, habitaciones, huéspedes, consumos, pagos y control operativo. La base de datos debe permitir representar el ciclo de una estadía, desde la reserva hasta el check-out, sin resolver por completo el modelo final.

El estudiante debe interpretar este dominio y construir su propio modelo de datos.

## 2. Actores de referencia

- Recepcionista: registra reservas, asigna habitaciones y gestiona check-in/check-out.
- Administrador: configura datos base y consulta reportes.
- Personal de restaurante/bar: registra consumos.
- Personal de housekeeping: actualiza estados de habitaciones.
- Auditor o contador: revisa pagos, caja y trazabilidad.

Los actores ayudan a entender permisos y trazabilidad, pero no obligan a crear una tabla por cada actor.

## 3. Procesos del dominio

1. Registrar una reserva.
2. Consultar disponibilidad de habitaciones.
3. Asignar habitación.
4. Realizar check-in.
5. Registrar consumos durante la estadía.
6. Registrar pagos.
7. Realizar check-out.
8. Cambiar estado de habitación.
9. Registrar movimientos de inventario.
10. Consultar reportes operativos.

## 4. Requerimientos funcionales iniciales

RF-01. El sistema debe permitir registrar reservas con datos del huésped, fechas y tipo de habitación solicitado.

RF-02. El sistema debe permitir consultar disponibilidad de habitaciones por fecha y tipo.

RF-03. El sistema debe permitir asignar una habitación a una reserva si cumple las condiciones del dominio.

RF-04. El sistema debe permitir registrar el check-in de una reserva.

RF-05. El sistema debe permitir registrar consumos asociados a una estadía o a una venta directa.

RF-06. El sistema debe permitir registrar pagos asociados a una operación del dominio.

RF-07. El sistema debe permitir calcular o consultar el total pendiente de una estadía.

RF-08. El sistema debe permitir registrar el check-out y cambiar el estado de la habitación.

RF-09. El sistema debe permitir registrar movimientos de inventario cuando se consumen productos.

RF-10. El sistema debe permitir consultar información cruzada de huéspedes, reservas, habitaciones, consumos y pagos.

## 5. Requerimientos no funcionales de base de datos

RNF-01. La base de datos debe proteger la integridad referencial con llaves foráneas.

RNF-02. La base de datos debe impedir estados o cantidades inválidas mediante restricciones o reglas SQL.

RNF-03. Las migraciones deben estar versionadas con Liquibase.

RNF-04. El entorno debe levantarse con Docker.

RNF-05. Debe existir rollback funcional para cambios relevantes.

RNF-06. DDL y DML deben estar separados.

RNF-07. La entrega debe incluir evidencias reproducibles para el profesor.

## 6. Reglas de negocio sugeridas

Estas reglas son pistas. El estudiante debe decidir cuáles implementa y cómo las justifica.

- Una reserva debe tener fecha de entrada menor que fecha de salida.
- Una habitación no debería asignarse si se encuentra ocupada o en mantenimiento.
- Un check-in solo debería ocurrir sobre una reserva válida.
- Un check-out debería consolidar hospedaje, consumos y pagos.
- Un producto consumido puede afectar inventario.
- Una caja o cierre operativo debe conservar evidencia.
- Los cambios críticos deben registrar usuario, fecha y motivo cuando aplique.

## 7. Entidades candidatas

Posibles entidades para analizar:

- usuario;
- rol;
- huésped;
- reserva;
- habitación;
- tipo de habitación;
- estadía o folio;
- consumo;
- producto;
- inventario;
- pago;
- caja;
- movimiento;
- auditoría.

No todas son obligatorias. El equipo debe seleccionar y justificar las entidades finales.

## 8. Datos canónicos posibles

- roles;
- estados de habitación;
- estados de reserva;
- métodos de pago;
- tipos de habitación;
- tipos de movimiento;
- categorías de productos.

## 9. Datos volumétricos posibles

- reservas históricas;
- habitaciones;
- huéspedes;
- consumos;
- pagos;
- movimientos de inventario;
- cambios de estado;
- cierres de caja.

## 10. Preguntas SQL de validación

- Qué habitaciones estuvieron ocupadas en un periodo?
- Qué huéspedes generaron mayor valor de consumo?
- Qué reservas finalizaron con pagos pendientes?
- Qué productos tuvieron más movimiento?
- Qué operación requiere unir huésped, reserva, habitación, estadía, consumo, producto y pago?
