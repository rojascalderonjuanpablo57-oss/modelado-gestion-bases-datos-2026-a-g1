# Step by step — Versión 2 (Modelo académico simplificado)

A continuación se explica, de forma pausada y fácil, el paso a paso de lo que se construyó.

---

## 1) Primero definimos **Estudiantes**

Se creó una lista de 10 estudiantes con estos atributos:

- **Código** (EST-0001…EST-0010) ✅
- Nombre
- Documento
- Correo institucional
- Programa

**¿Por qué iniciamos aquí?**  
Porque el estudiante es un dato “base”. En este punto el estudiante solo existe en el sistema, todavía no está matriculado en nada.

**Regla clave (unicidad):**  
Cada estudiante debe identificarse de forma única.  
Por eso se usó **Estudiante_Código** como identificador principal (y además los documentos no se repiten).

---

## 2) Luego definimos **Asignaturas**

Se creó una lista de 15 asignaturas (materias), cada una con:

- **Código** (ASI-101, ASI-102, …) ✅
- Nombre
- Créditos
- Semestre
- Área

**¿Qué representa esta tabla?**  
Es el **catálogo de materias**.  
Aquí todavía **no** existen horarios ni docentes ni estudiantes inscritos: solo existen las materias disponibles.

**Regla importante:**  
Una asignatura puede ser tomada por muchos estudiantes, pero esa relación se registra después con **Matrícula**.

---

## 3) Después creamos **Grupos** (a partir de las asignaturas)

Un **grupo** es la “oferta” real de una asignatura en un periodo (por ejemplo, una materia en horario nocturno con un docente específico).

Cada grupo quedó con:

- **Grupo_Código** (GRP-xxx-G1 / GRP-xxx-G2) ✅
- **Grupo_Nombre** siguiendo el formato:
  - **NombreMateria + 2026 + (g1 / g2)** ✅
- Periodo (2026A)
- Horario
- Docente responsable

**¿Por qué algunas asignaturas tienen 2 grupos?**  
Para permitir que una misma asignatura tenga varios grupos en el mismo periodo (más cupos o distintos horarios).

---

## 4) Por último generamos **Matrícula**

Aquí se crea la relación real entre:

✅ **Estudiante** + ✅ **Grupo** + (Fecha, Estado)

La tabla de matrícula quedó con:

- Matrícula_ID
- Estudiante_Código (tomado de la tabla **Estudiantes**)
- Grupo_Código (tomado de la tabla **Grupos**)
- Fecha
- Estado (Activa / Cancelada)

**Regla clave de dependencias (integridad):**  
En matrícula no se inventan códigos:
- cada `Estudiante_Código` usado existe en **Estudiantes**
- cada `Grupo_Código` usado existe en **Grupos**

Esto evita matrículas “huérfanas” y garantiza consistencia en los datos.

---

## Resumen de conexiones (en simple)

- **Estudiante**: “quién es la persona”
- **Asignatura**: “qué materia existe”
- **Grupo**: “cómo se ofrece esa materia en un periodo (docente/horario)”
- **Matrícula**: “qué estudiante quedó inscrito en qué grupo”
