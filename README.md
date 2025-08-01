# Supply Chain Dashboard

##  Descripción del Proyecto

Este proyecto corresponde al desarrollo de un **Dashboard en tiempo real** para la empresa **Flex**, con el objetivo de mejorar la visibilidad del estado de los requerimientos de materiales dentro del área de **Supply Chain**.



---

##  Problema Identificado

Actualmente, el proceso de consulta de requerimientos de materiales desde el sistema ERP requiere:
- **Actualización manual** de información.
- **Datos poco específicos** y difíciles de interpretar.
- **Ausencia de alertas visuales** o indicadores de tiempo.

Esto genera ineficiencias en la toma de decisiones, demoras en los procesos y una limitada visibilidad operativa.

---

##  Solución Propuesta

Desarrollar un **dashboard interactivo y automatizado** que:
- Muestre el estado actual de cada requerimiento.
- Genere alertas visuales por tiempos críticos.
- Permita visualizar información relevante (requisitor, área, estatus, tiempo transcurrido).
- Se alimente directamente del sistema ERP vía consultas SQL controladas y procesadas.




##  Servidores involucrados:
- Consulta SQL: GDLNT914
- Reportes Web: GDLNT445
- Base de datos fuente: BPO Daily


## Instalación

¿Cómo instalar el ambiente de desarrollo?
- Crea conexión a servidores de réplica, no productivos, para evitar impactos.
- Asegura acceso al servidor GDLNT914 con permisos de lectura sobre la base BPO Daily.

## ¿Cómo ejecutar pruebas manualmente?

- Ejecuta la consulta SQL proporcionada en query.sql desde SQL Server Management Studio en servidor de pruebas.
- Abre el archivo .rdl en Report Builder.
- Conéctalo al servidor SQL GDLNT914 y valida visualización y lógica de alertas.
- Verifica semáforo de alertas (amarillo > 45 min, rojo > 60 min).

## ¿Cómo implementar en ambiente de producción?

- Despliega los archivos .rdl en el servidor de reportes GDLNT445.
- Conecta el reporte al origen de datos BPO Daily en el servidor SQL GDLNT914.
- Asigna permisos de visualización a los usuarios finales del área de Supply Chain.

## Configuración

Archivos de configuración

- El archivo .rdl incluye las métricas, campos y diseño del dashboard.
- Configuración de origen de datos
- Conectar Report Builder a GDLNT914.
- Configurar credenciales de acceso y origen de datos compartido.

## Requerimientos Futuros

- Generar reportes históricos y análisis por semana/mes.
- Soporte para múltiples áreas/planta.
- Visualización móvil.


