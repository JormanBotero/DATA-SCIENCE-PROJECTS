#  CÓMO EJECUTAR EL NOTEBOOK - PUNTO 2

##  REQUISITOS PREVIOS

### 1. Tener el CSV en el mismo directorio
✓ El archivo `customer_shopping_data.csv` debe estar en la **misma carpeta** que el notebook

```
tu_carpeta_proyecto/
├── PUNTO_2_DATA_WAREHOUSE_NOTEBOOK.ipynb
└── customer_shopping_data.csv          ← ¡AQUÍ!
```

### 2. Tener una cuenta Neon (PostgreSQL Serverless)
- Ve a https://neon.tech
- Crea una cuenta
- Crea un proyecto nuevo (ej: "customer_dw")

### 3. Obtener la Connection String de Neon
1. Abre tu proyecto en https://console.neon.tech
2. Ve a **"Connection details"**
3. Selecciona **"Direct Connection"** (importante para ETL)
4. Copia la URL completa:
   ```
   postgresql://user:password@ep-xxxxx.us-east-2.aws.neon.tech/database?sslmode=require
   ```

---

## 🔧 INSTALACIÓN

### Paso 1: Abrir Terminal/CMD en tu carpeta

```bash
cd tu_carpeta_proyecto
```

### Paso 2: Instalar Jupyter (si no lo tienes)
```bash
pip install jupyterlab
```

### Paso 3: Instalar dependencias
```bash
pip install pandas sqlalchemy psycopg2-binary matplotlib seaborn python-dotenv
```

### Paso 4: Iniciar Jupyter
```bash
jupyter lab
```

O en VS Code:
- Abre VS Code
- Extensions → "Jupyter" (instalar)
- Abre el archivo .ipynb
- Selecciona Python Kernel

---

## ▶️ EJECUTAR EL NOTEBOOK

### Opción A: Jupyter Lab / VS Code

1. **Abre el notebook**: `PUNTO_2_DATA_WAREHOUSE_NOTEBOOK.ipynb`

2. **Ejecuta la Celda 1**: Instalación de dependencias
   - Haz clic en la celda
   - Presiona `Shift + Enter` (o botón ▶️)
   - Espera a que termine

3. **Sigue celdas secuencialmente**:
   - Celda 2: Importaciones
   - Celda 3: Configurar credenciales
   - Celda 4: Conectar a Neon
   - ... y así sucesivamente

### Opción B: Ejecutar TODO de una vez

En Jupyter Lab:
```
Menu → Run → Run All Cells
```

**Tiempo estimado**: 5-10 minutos (depende de velocidad de Neon)

---

## ⚙️ CONFIGURACIÓN DE CREDENCIALES

### Método 1: Crear archivo `.env` (RECOMENDADO)

1. En la carpeta del proyecto, crea un archivo llamado `.env`
2. Añade tu connection string:

```
DATABASE_URL=postgresql://user:password@ep-xxxxx.us-east-2.aws.neon.tech/database?sslmode=require
```

3. El notebook lo cargará automáticamente

**IMPORTANTE**: Añade `.env` a `.gitignore`:
```bash
echo ".env" >> .gitignore
```

### Método 2: Ingresar manualmente en Celda 3

Si ejecutas la Celda 3 sin `.env`, el notebook te pedirá que ingreses la URL:
```
DATABASE_URL = postgresql://...
```

Simplemente cópiala y pégala cuando te lo solicite.

---

## ✅ VERIFICAR QUE TODO FUNCIONA

Después de ejecutar las primeras 4 celdas, deberías ver:

**Celda 4 - Resultado esperado:**
```
✓ ¡CONECTADO A NEON!

📊 PostgreSQL: PostgreSQL 15.2 on x86_64...
```

Si ves esto ✓ → **¡Todo bien! Continúa con las siguientes celdas**

Si ves un error ✗ → **Verifica tu DATABASE_URL**

---

## 📊 ESTRUCTURA DEL NOTEBOOK

| Celda | Descripción | Tiempo |
|-------|------------|--------|
| 1 | Instalar dependencias | 30s |
| 2 | Importar librerías | 5s |
| 3 | Configurar credenciales | Manual |
| 4 | Conectar a Neon | 5s |
| 5 | Crear esquema (DDL) | 10s |
| 6 | Cargar CSV | 5s |
| 7 | Validar y limpiar datos | 10s |
| 8-11 | ETL: Preparar y cargar datos | 2-3 min |
| 12-14 | Validaciones de integridad | 30s |
| 15-18 | Análisis básicos | 30s |
| 19-24 | Visualizaciones y gráficos | 1-2 min |
| 25 | Resumen final | 5s |

**Total: 5-10 minutos**

---

## 🔍 SOLUCIÓN DE PROBLEMAS

### ❌ "Module not found: pandas"
```bash
pip install pandas
```

### ❌ "psycopg2 error"
```bash
pip install psycopg2-binary
```

### ❌ "connection refused / timeout"
- Verifica que tu DATABASE_URL sea correcta
- Verifica tu conexión a internet
- Intenta clonar el proyecto en Neon (a veces hay reinicia)

### ❌ "File not found: customer_shopping_data.csv"
- Asegúrate de que el CSV está en la **misma carpeta** que el notebook
- Verifica el nombre exacto (case-sensitive en Linux/Mac)

### ❌ "authentication failed"
- La URL tiene usuario/password incorrecto
- Copia nuevamente desde Neon Console

### ❌ "permission denied"
- En Linux/Mac, quizás necesites:
```bash
chmod +x PUNTO_2_DATA_WAREHOUSE_NOTEBOOK.ipynb
```

---

## 💡 TIPS

### Ejecutar Solo Celdas Específicas
- Selecciona una celda
- Presiona `Ctrl+Shift+Enter` para ejecutar sin mover al siguiente

### Ver Tiempo de Ejecución
En Jupyter Lab:
- Settings → Show Line Numbers
- Verás el tiempo en la esquina inferior de cada celda

### Reiniciar el Kernel
Si algo se queda pegado:
```
Menu → Kernel → Restart Kernel
```

### Limpiar Salidas
```
Menu → Edit → Clear All Outputs
```

---

## 🎯 QUÉ HACE EXACTAMENTE EL NOTEBOOK

1. ✅ **Instala** todas las dependencias necesarias
2. ✅ **Conecta** a tu base de datos Neon
3. ✅ **Crea** la estructura completa (schema, tablas, índices)
4. ✅ **Carga** el CSV desde el directorio local
5. ✅ **Transforma** los datos (ETL)
6. ✅ **Inserta** en dimensiones y tabla de hechos
7. ✅ **Valida** integridad referencial (23 checks)
8. ✅ **Ejecuta** análisis y cálculos
9. ✅ **Genera** visualizaciones (gráficos)
10. ✅ **Resume** los resultados finales

---

## 📈 OUTPUTS ESPERADOS

Después de ejecutar TODO el notebook, tendrás:

✓ **Base de datos en Neon** con esquema `dw_retail`  
✓ **6 tablas** (1 fact + 5 dimensiones)  
✓ **100,000+ registros** cargados  
✓ **Validaciones** confirmadas (integridad ✓)  
✓ **6 gráficos** generados automáticamente  
✓ **KPIs** calculados  
✓ **Análisis** completado  

---

## 🚀 PRÓXIMOS PASOS

### Después de ejecutar el Notebook:

**Opción 1: Reutilizar para datos nuevos**
- Reemplaza `customer_shopping_data.csv` con datos nuevos
- Ejecuta el notebook nuevamente (detectará tabla existente)

**Opción 2: Modificar análisis**
- Añade nuevas celdas después de la Celda 25
- Escribe tus propias queries SQL
- Crea nuevos gráficos

**Opción 3: Automatizar recarga**
- Crea un script que ejecute el notebook periódicamente
- Usa `papermill` para automatización

---

## ❓ PREGUNTAS FRECUENTES

**P: ¿Puedo ejecutar solo algunas celdas?**  
R: Sí, pero las Celdas 1-11 deben ejecutarse en orden (carga de datos).
Las Celdas 12-25 son independientes.

**P: ¿Qué pasa si ejecuto dos veces?**  
R: Aparecerá error de tabla duplicada. Usa la Celda 4 modificada para limpiar:
```python
with engine.begin() as conn:
    conn.execute(text("DROP SCHEMA IF EXISTS dw_retail CASCADE"))
```

**P: ¿Puedo cambiar la connection string a mitad?**  
R: Sí, ejecuta nuevamente la Celda 3, luego 4 con la nueva URL.

**P: ¿Funciona offline?**  
R: No, necesita conexión a Neon (PostgreSQL en la nube).

**P: ¿Hay límite de registros?**  
R: Neon free tier: ~1 GB almacenamiento. Este dataset es ~50 MB, no hay problema.

---

## 📞 SOPORTE

Si tienes problemas:

1. **Lee el error** en el output de la celda
2. **Verifica** tu DATABASE_URL
3. **Instala dependencias** nuevamente
4. **Reinicia** el kernel
5. **Abre una celda nueva** y ejecuta:

```python
import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine, text

print(f"Pandas: {pd.__version__}")
print(f"SQLAlchemy: {sqlalchemy.__version__}")

# Prueba conexión
engine = create_engine(DATABASE_URL)
with engine.connect() as conn:
    result = conn.execute(text("SELECT 1"))
    print("✓ Conexión OK")
```

---

## ✨ ¡ÉXITO!

Una vez ejecutado, tendrás:
- ✓ Data Warehouse operativo
- ✓ ETL automatizado
- ✓ Análisis completo
- ✓ Visualizaciones listas

**¡A disfrutar del proyecto!** 🎉

---

**Versión**: 1.0  
**Última actualización**: 2025  
**Para**: Proyecto Universitario - Ingeniería en Datos
