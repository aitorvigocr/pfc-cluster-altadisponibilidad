# Clúster de Alta Disponibilidad para CMS Drupal

![Estado](https://img.shields.io/badge/Status-Finalizado-green)
![Tecnología](https://img.shields.io/badge/Stack-Nginx%20|%20Drupal%20|%20MariaDB-blue)
![Monitorización](https://img.shields.io/badge/Monitoring-Prometheus%20|%20Grafana-orange)

Proyecto de Fin de Ciclo para la titulación de **ASIR (Administración de Sistemas Informáticos en Red)**.

Este repositorio contiene los archivos de configuración, scripts y documentación técnica para el despliegue de un clúster de alta disponibilidad (HA) diseñado para servir un portal documental basado en Drupal.

## 🏗️ Arquitectura del Sistema
El proyecto se basa en una infraestructura segmentada en 5 nodos virtualizados sobre **VMware**, garantizando redundancia y resiliencia ante fallos.

| Nodo | IP Estática | Función Principal |
| :--- | :--- | :--- |
| **srv-balanceador** | 192.168.50.10 | Nginx (Balanceo de carga y Terminación SSL) |
| **srv-web-01** | 192.168.50.21 | Apache + PHP-FPM (Procesamiento Web 1) |
| **srv-web-02** | 192.168.50.22 | Apache + PHP-FPM (Procesamiento Web 2) |
| **srv-bbdd-nfs** | 192.168.50.30 | MariaDB Server & NFS (Persistencia de datos) |
| **srv-monitor** | 192.168.50.40 | Prometheus + Grafana (Observabilidad) |

## 📁 Estructura del Repositorio
- `/nginx`: Configuraciones del balanceador de carga y certificados SSL.
- `/drupal`: Archivos de configuración de la aplicación y `settings.php`.
- `/monitoring`: Dashboards de Grafana y configuración de Prometheus.
- `/scripts`: Scripts de automatización para backups y mantenimiento.
- `/backups`: Volcados de base de datos de prueba para restauración inmediata.

## 🚀 Despliegue Rápido
Para poner en marcha el sistema, siga estos pasos (detallados en el Capítulo 9 de la memoria):

1. **Descarga de MVs:** Descargue los archivos `.ova` .
2. **Configuración de Red:** Cree una red virtual en VMware (VMnet) con el rango `192.168.50.0/24`.
3. **Importación:** Importe las 5 máquinas virtuales en VMware Workstation.
4. **Arranque:** Encienda las máquinas en el orden indicado: BBDD/NFS > Nodos Web > Balanceador > Monitor.
5. **Acceso:** Abra su navegador y acceda a `https://192.168.50.10`.

## 🛠️ Tecnologías Utilizadas
- **S.O:** Ubuntu Server 22.04 LTS
- **CMS:** Drupal 11
- **Base de Datos:** MariaDB 10.11
- **Servidor Web:** Nginx (Proxy) & Apache (Backend)
- **Protocolo de Archivos:** NFSv4
- **Monitorización:** Prometheus & Grafana (con Node Exporter)

---
> **Nota:** Este proyecto ha sido desarrollado como Proyecto Fin de Ciclo  para el Ciclo Superior de Sistemas Informáticos en Red.
