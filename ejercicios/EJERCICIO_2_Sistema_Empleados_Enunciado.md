# 💼 EJERCICIO 2: SISTEMA DE GESTIÓN DE EMPLEADOS CON NÓMINA

**Nivel:** Medio-Avanzado  
**Conceptos:** Herencia, Polimorfismo, Enums, Métodos Estáticos  
**Tiempo estimado:** 90 minutos

---

## 📋 Descripción

Crea un sistema de gestión de empleados que calcule salarios diferentes según el tipo de contrato.

---

## 🎯 Requisitos

### 1. Enum: TipoContrato
```dart
enum TipoContrato { tiempoCompleto, medioTiempo, temporal, practicante }
```

### 2. Clase: Departamento
- **Propiedades:**
  - `nombre` (String) - "Desarrollo", "Recursos Humanos", etc.
  - `presupuesto` (double, privada)

- **Métodos:**
  - Getter para presupuesto
  - `actualizarPresupuesto(double monto)` → void

### 3. Clase Base Abstracta: Empleado
- **Propiedades:**
  - `nombre` (String)
  - `id` (String) - ID único
  - `salarioBase` (double)
  - `tipoContrato` (TipoContrato)
  - `departamento` (Departamento)

- **Métodos:**
  - Constructor base
  - Método abstracto: `calcularSalario()` → double
  - Método concreto: `obtenerInfo()` → String
  - Método concreto: `cambiarDepartamento(Departamento d)` → void

### 4. Clases que Extienden Empleado

**EmpleadoTiempoCompleto:**
- Salario = salarioBase (sin cambios)
- Puede recibir bonificación anual (5% adicional)

**EmpleadoMedioTiempo:**
- Salario = salarioBase * 0.5

**EmpleadoTemporal:**
- **Propiedad adicional:** `diasTrabajados` (int)
- Salario = (salarioBase / 30) * diasTrabajados

**Practicante:**
- **Propiedad adicional:** `horasPorSemana` (int)
- Salario = (salarioBase / 160) * horasPorSemana

### 5. Clase: Empresa
- **Propiedades:**
  - `nombre` (String)
  - `empleados` (List<Empleado>)
  - `departamentos` (List<Departamento>)
  - Variable estática: `totalEmpresas` (int)

- **Métodos:**
  - `agregarEmpleado(Empleado e)` → void
  - `despedirEmpleado(String id)` → bool
  - `buscarEmpleado(String id)` → Empleado?
  - `obtenerEmpleadosPorDepartamento(String dept)` → List<Empleado>
  - `calcularNominaTotal()` → double
  - `obtenerEmpleadoMejorPagado()` → Empleado?
  - `obtenerEmpleadoMenorPagado()` → Empleado?
  - `obtenerPromediSalarial()` → double
  - `mostrarNomina()` → void (imprime todos los salarios)
  - `mostrarReporte()` → String (estadísticas completas)

---

## ✅ Requisitos Especiales

1. **Validaciones:**
   - El ID del empleado debe ser único
   - No se puede despedir un empleado que no existe
   - El salario base debe ser positivo

2. **Polimorfismo:**
   - `calcularSalario()` debe funcionar diferente para cada tipo
   - Usa listas polimórficas (List<Empleado>)

3. **Métodos Estáticos:**
   - Contador de empresas creadas
   - Método para obtener total de empresas

---

## 🧪 Pruebas Esperadas (Ejemplo main())

```dart
void main() {
  // Crear departamentos
  var desarrollo = Departamento('Desarrollo', 50000);
  var rrhh = Departamento('Recursos Humanos', 20000);
  
  // Crear empresa
  var empresa = Empresa('TechCorp');
  
  // Agregar empleados
  empresa.agregarEmpleado(
    EmpleadoTiempoCompleto('Juan', 'E001', 3000, desarrollo)
  );
  empresa.agregarEmpleado(
    EmpleadoMedioTiempo('María', 'E002', 2000, desarrollo)
  );
  empresa.agregarEmpleado(
    EmpleadoTemporal('Carlos', 'E003', 100, 20, rrhh)
  );
  empresa.agregarEmpleado(
    Practicante('Ana', 'E004', 15, 20, desarrollo)
  );
  
  // Mostrar nómina
  empresa.mostrarNomina();
  
  // Mostrar reporte
  print(empresa.obtenerReporte());
}
```

---

## 📊 Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| Enum y Departamento | 15 |
| Clase Empleado abstracta | 20 |
| Subclases implementadas | 25 |
| Cálculos polimórficos correctos | 20 |
| Métodos de Empresa | 15 |
| Validaciones y errores | 5 |
| **TOTAL** | **100** |

---

## 💡 Pistas

1. Define bien la clase abstracta `Empleado`
2. Usa `@override` en todos los métodos polimórficos
3. El ID debe ser único (usa `any()` para validar)
4. Calcula nómina con `fold()` en las listas
5. Usa `where()` para filtrar empleados

---

## 🚀 Desafío Extra (Bonus)

- Implementa aumentos de sueldo (5% anual)
- Agrega un sistema de bonificación por desempeño
- Crea reportes por departamento
- Implementa retención de impuestos (20%)

