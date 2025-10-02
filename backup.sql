-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: saip_proyect
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` int NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,2,50000),(2,1,2,1,50000),(3,2,3,3,70000),(4,2,1,1,50000),(5,3,4,2,49000),(6,4,2,2,50000),(7,4,5,1,25000),(8,5,3,4,70000),(9,5,1,1,50000),(10,6,5,1,45000),(11,7,2,2,100000),(12,8,4,1,70000),(13,8,3,1,105000),(14,9,1,2,60000),(15,10,5,4,70000);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos` (
  `id_insumo` int NOT NULL AUTO_INCREMENT,
  `nombre_insumo` varchar(80) NOT NULL,
  `categoria_insumo` varchar(100) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `cantidad_disponible` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `id_medida` bigint NOT NULL,
  PRIMARY KEY (`id_insumo`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `insumos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos`
--

LOCK TABLES `insumos` WRITE;
/*!40000 ALTER TABLE `insumos` DISABLE KEYS */;
INSERT INTO `insumos` VALUES (1,'Harina','Materia Prima','2026-12-31','Arina de trigo refinada',20,2,8),(2,'Mantequilla','Materia Prima','2026-06-30','Mantequilla fresca',80,3,1),(3,'Levadura','Materia Prima','2025-03-15','Levadura seca instantanea',40,1,2),(4,'Azucar','Materia Prima','2026-11-20','Azucar blanca refinada',5,4,1),(5,'Sal','Materia Prima','2025-09-10','Sal fina de mesa',60,5,1),(6,'Esencia','Materia Prima','2026-08-05','Esencia de vainilla liquida',30,1,4),(7,'Harina de maiz','Materia Prima','2026-07-22','Harina fina de maiz amarillo',100,2,1),(8,'Bocadillo','Insumo Dulce','2026-05-14','Bocadillo de guayaba en barra',25,1,6),(9,'Huevos','Materia Prima','2025-04-28','Huevos frescos de gallina',20,6,7);
/*!40000 ALTER TABLE `insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medidas`
--

DROP TABLE IF EXISTS `medidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medidas` (
  `id_medida` int NOT NULL AUTO_INCREMENT,
  `nombre_medida` varchar(50) NOT NULL,
  `abreviatura` varchar(10) NOT NULL,
  PRIMARY KEY (`id_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medidas`
--

LOCK TABLES `medidas` WRITE;
/*!40000 ALTER TABLE `medidas` DISABLE KEYS */;
INSERT INTO `medidas` VALUES (1,'Kilogramo','KG'),(2,'Gramo','G'),(3,'Litro','L'),(4,'Mililitro','ML'),(5,'Onza','OZ'),(6,'Unidad','U'),(7,'Cubeta','CUBETA'),(8,'Bulto','BL');
/*!40000 ALTER TABLE `medidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha_pedido` date NOT NULL,
  `valor_pedido` int NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `id_insumo` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_insumo` (`id_insumo`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `insumos` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(80) NOT NULL,
  `categoria_producto` varchar(100) NOT NULL,
  `cantidad_disponible` int NOT NULL,
  `id_proveedor` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Pan de trigo','Panadería',100,1),(2,'Pan integral','Panadería',80,1),(3,'Mantequilla','Lácteos',50,3),(4,'Queso mozzarella','Lácteos',60,2),(5,'Harina','Ingredientes',200,1),(6,'Azúcar','Ingredientes',150,4),(7,'Leche','Lácteos',120,2),(8,'Chocolate','Ingredientes',90,3),(9,'Croissant','Panadería',70,1),(10,'Pan relleno','Panadería',50,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `empresa` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `nit` varchar(50) NOT NULL,
  `tipo_pago` enum('fisico','digital') DEFAULT 'fisico',
  `estado` varchar(50) NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Levapan','Levapan S.A.','contacto@levapan.com','800123456-7','digital','Activo','Proveedor principal de levadura y mejorantes'),(2,'Extrapan','Extrapan Ltda.','ventas@extrapan.com','900456789-3','digital','Activo','Suministra harina de alta proteína'),(3,'Sigra','Sigra S.A.','info@sigra.com','890123987-2','fisico','Activo','Proveedor de mantequilla sin sal y grasas vegetales'),(4,'Riopaila','Riopaila Castilla','servicio@riopaila.com','890456321-5','digital','Activo','Proveedor de azúcar refinada de alta pureza'),(5,'Refisal','Refisal S.A.','atencion@refisal.com','800654321-9','fisico','Activo','Suministra sal de mesa para procesos de panificación'),(6,'Kikes','Huevos Kikes','contacto@kikes.com','900789654-1','fisico','Activo','Proveedor de huevos frescos de gallina');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','2025-10-02 01:21:23'),(2,'Panadero','2025-10-02 01:21:23'),(3,'Pastelero','2025-10-02 01:21:23');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_maximo`
--

DROP TABLE IF EXISTS `stock_maximo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_maximo` (
  `id_stock_maximo` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `cantidad_maxima` decimal(10,2) NOT NULL,
  `id_insumo` int DEFAULT NULL,
  PRIMARY KEY (`id_stock_maximo`),
  KEY `id_insumo` (`id_insumo`),
  CONSTRAINT `stock_maximo_ibfk_1` FOREIGN KEY (`id_insumo`) REFERENCES `insumos` (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_maximo`
--

LOCK TABLES `stock_maximo` WRITE;
/*!40000 ALTER TABLE `stock_maximo` DISABLE KEYS */;
INSERT INTO `stock_maximo` VALUES (1,'Harina',19.00,1),(2,'Mantequilla',300.00,2),(3,'Levadura',100.00,3),(4,'Azucar',400.00,4),(5,'Sal',150.00,5),(6,'Esencia',25.00,6),(7,'Harina de maiz',250.00,7),(8,'Bocadillo',120.00,8),(9,'Huevos',15.00,9);
/*!40000 ALTER TABLE `stock_maximo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_minimo`
--

DROP TABLE IF EXISTS `stock_minimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_minimo` (
  `id_stock_minimo` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `cantidad_minima` decimal(10,2) NOT NULL,
  `id_insumo` int DEFAULT NULL,
  PRIMARY KEY (`id_stock_minimo`),
  KEY `id_insumo` (`id_insumo`),
  CONSTRAINT `stock_minimo_ibfk_1` FOREIGN KEY (`id_insumo`) REFERENCES `insumos` (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_minimo`
--

LOCK TABLES `stock_minimo` WRITE;
/*!40000 ALTER TABLE `stock_minimo` DISABLE KEYS */;
INSERT INTO `stock_minimo` VALUES (1,'Harina',50.00,1),(2,'Mantequilla',30.00,2),(3,'Levadura',10.00,3),(4,'Azucar',40.00,4),(5,'Sal',15.00,5),(6,'Esencia',5.00,6),(7,'Harina de maiz',25.00,7),(8,'Bocadillo',12.00,8),(9,'Huevos',60.00,9);
/*!40000 ALTER TABLE `stock_minimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(250) NOT NULL,
  `estado` enum('activo','inactivo','suspendido') DEFAULT 'activo',
  `id_rol` int NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Camilo Amaya','camilo.amaya@example.com','hash1','activo',1,'2025-10-02 06:28:35'),(2,'Laura Pérez','laura.perez@example.com','hash2','activo',2,'2025-10-02 06:28:35'),(3,'Jorge Gómez','jorge.gomez@example.com','hash3','inactivo',3,'2025-10-02 06:28:35'),(4,'Ana Martínez','ana.martinez@example.com','hash4','activo',1,'2025-10-02 06:28:35'),(5,'Luis Fernández','luis.fernandez@example.com','hash5','suspendido',2,'2025-10-02 06:28:35'),(6,'María Rodríguez','maria.rodriguez@example.com','hash6','activo',3,'2025-10-02 06:28:35'),(7,'Pedro Sánchez','pedro.sanchez@example.com','hash7','activo',1,'2025-10-02 06:28:35'),(8,'Sofía López','sofia.lopez@example.com','hash8','inactivo',2,'2025-10-02 06:28:35'),(9,'Andrés Torres','andres.torres@example.com','hash9','activo',3,'2025-10-02 06:28:35'),(10,'Valentina Rojas','valentina.rojas@example.com','hash10','activo',1,'2025-10-02 06:28:35');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `valor` int NOT NULL,
  PRIMARY KEY (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'2025-09-25',150000),(2,'2025-09-26',230000),(3,'2025-09-27',98000),(4,'2025-09-28',125000),(5,'2025-09-29',310000),(6,'2025-09-30',45000),(7,'2025-10-01',200000),(8,'2025-10-01',175000),(9,'2025-10-02',120000),(10,'2025-10-02',280000);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-02  1:43:03
