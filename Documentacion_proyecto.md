#  BODEGA DE DATOS: CUSTOMER SHOPPING

**Proyecto Académico - Punto 2: Diseño e Implementación del Data Warehouse**

---

##  DESCRIPCIÓN

Implementación de un **Data Warehouse** bajo el modelo de **Estrella (Star Schema)** usando datos de compras de clientes. El notebook ejecuta automáticamente todo el proceso: desde la conexión a la base de datos, creación de tablas, carga de datos (ETL), validaciones e análisis completos.

**Dataset**: 100,000+ transacciones de compras (Kaggle: `customer_shopping_data.csv`)  
**Plataforma**: PostgreSQL Serverless en Neon  
**Lenguaje**: Python con Jupyter Notebook  

---

##  ESTRUCTURA DEL DATA WAREHOUSE

### Modelo Estrella
```
                     DIM_CUSTOMERS
                          |
    DIM_PRODUCT ——— INVOICE_SALE ——— DIM_SHOPPING_MALL
                          |
                    DIM_PAYMENT_METHODS
                          |
                       DIM_TIME
```

### Tablas Principales

| Tabla | Registros | Descripción |
|-------|-----------|-------------|
| **INVOICE_SALE** (Fact) | ~100k | Transacciones de ventas |
| DIM_CUSTOMERS | ~10k | Clientes únicos |
| DIM_PRODUCT | ~20 | Categorías de productos |
| DIM_SHOPPING_MALL | ~15 | Centros comerciales |
| DIM_PAYMENT_METHODS | ~4 | Métodos de pago |
| DIM_TIME | 365+ | Dimensión temporal |

---

##  ARCHIVOS INCLUIDOS

```
tu_carpeta/
├── PUNTO_2_DATA_WAREHOUSE_NOTEBOOK_TABLAS_EXISTENTES.ipynb  ← EJECUTAR ESTO
├── customer_shopping_data.csv                                ← Tu CSV
├── .env.example                                              ← Plantilla credenciales
├── .gitignore                                                ← Para Git
├── EJECUTAR_NOTEBOOK_PUNTO_2.md                             ← Guía detallada
├── README.md                                                 ← Este archivo
│
└── _referencia/ (opcional)
    ├── CELDAS_12_A_19_CORREGIDAS.py
    └── CELDA_8_Y_9_CORRECTAS.py
```

---

##  INICIO RÁPIDO

### 1. Preparación (2 minutos)

```bash
# Crear .env con credenciales Neon
cp .env.example .env
# Edita .env y reemplaza:
# DATABASE_URL=postgresql://user:pass@ep-xxxxx.us-east-2.aws.neon.tech/neondb?sslmode=require
```

### 2. Instalar Dependencias

```bash
pip install pandas sqlalchemy psycopg2-binary matplotlib seaborn python-dotenv jupyter
```

### 3. Ejecutar Notebook

```bash
jupyter lab
# O en VS Code: Ctrl+Shift+P → "Jupyter: Open file in Jupyter"
```

Abre `PUNTO_2_DATA_WAREHOUSE_NOTEBOOK_TABLAS_EXISTENTES.ipynb` y ejecuta:
- **Menu → Run → Run All Cells** (todo automático)
- **O** Celda por celda con `Shift+Enter`

**Tiempo total**: ~5-10 minutos

---

##  QUÉ HACE EL NOTEBOOK

| Paso | Celdas | Acción |
|------|--------|--------|
| 1 | 1-4 | Instalación, importaciones, conexión a Neon |
| 2 | 5 | Verificar tablas existentes en la BD |
| 3 | 6-7 | Cargar y validar CSV |
| 4 | 8-9 | ETL: Mapear claves y cargar datos |
| 5 | 10-11 | Validaciones de integridad |
| 6 | 12-17 | Análisis SQL (clientes, categorías, pagos, KPIs) |
| 7 | 18-19 | Resumen y limpieza |

---

##  ANÁLISIS GENERADOS

El notebook ejecuta automáticamente:

 **Top 10 clientes** por gasto total  
 **Ventas por categoría** (ranking)  
 **Distribución de métodos de pago** (% de uso)  
 **KPIs generales** (ingresos, clientes, promedio)  
 **2 gráficos** (categorías y métodos de pago)  

---

##  VALIDACIONES INCLUIDAS

El notebook ejecuta **23 validaciones automáticas**:

- Conteo de registros por tabla
- Integridad referencial (FK válidas)
- Detección de duplicados
- Valores inválidos (negativos, nulos)
- Consistencia de datos (total_amount = quantity × price)
- Rango de fechas válido

**Si todo pasa**: Verás "✓ INTEGRIDAD REFERENCIAL VALIDADA"

---

##  ESTRUCTURA DEL NOTEBOOK (CELDAS)

```
CELDA 1:    Instalar dependencias
CELDA 2:    Importar librerías
CELDA 3:    Cargar DATABASE_URL desde .env
CELDA 4:    Conectar a Neon y verificar conexión
CELDA 5:    Verificar tablas existentes
CELDA 6:    Cargar CSV con pandas
CELDA 7:    Validar y limpiar datos
CELDA 8:    Obtener mapeos de dimensiones
CELDA 9:    Preparar y cargar INVOICE_SALE
CELDA 10:   Validar conteos de registros
CELDA 11:   Verificar integridad referencial
CELDA 12:   Top 10 clientes por gasto
CELDA 13:   Ventas por categoría
CELDA 14:   Métodos de pago
CELDA 15:   KPIs generales
CELDA 16:   Gráfico de categorías
CELDA 17:   Gráfico de métodos de pago
CELDA 18:   Resumen final
CELDA 19:   Limpiar conexiones
```

---

##  SEGURIDAD

-  Credenciales en `.env` (NO embebidas en código)
-  `.env` está en `.gitignore` (NO se versiona)
-  SSL obligatorio (`sslmode=require`)
-  Connection pooling seguro

---

##  PROBLEMAS COMUNES

| Problema | Solución |
|----------|----------|
| `ModuleNotFoundError: pandas` | `pip install pandas sqlalchemy psycopg2-binary` |
| `connection refused` | Verifica DATABASE_URL en `.env` |
| `File not found: customer_shopping_data.csv` | Coloca CSV en la misma carpeta que el notebook |
| `authentication failed` | Copia nuevamente URL de Neon Console |
| Celda 8 demora 6+ min | Es Neon lento, espera o reinicia kernel |

---

##  RESULTADOS ESPERADOS

Después de ejecutar el notebook completo:

```
✓ Base de datos creada en Neon
✓ 6 tablas con ~115k registros cargados
✓ Todas las validaciones pasadas
✓ Análisis SQL ejecutados
✓ 2 gráficos generados
✓ KPIs calculados
✓ Resumen final con conclusiones
```

---


**Este punto demuestra**:
-  Diseño de Data Warehouse (Modelo Estrella)
-  Conexión a base de datos desde Python
-  ETL (Extracción, Transformación, Carga)
-  Validaciones de integridad de datos
-  Análisis SQL y visualización
-  Buenas prácticas (índices, constraints, auditoría)
-  Documentación clara y reproducible


---


- **Neon**: https://neon.tech
- **PostgreSQL Docs**: https://www.postgresql.org/docs/
- **Star Schema**: https://en.wikipedia.org/wiki/Star_schema
- **Pandas ETL**: https://pandas.pydata.org/

---
