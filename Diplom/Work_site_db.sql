-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: work_site_db
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (13,'Автоуслуги'),(10,'Бухгалтерия'),(2,'Дизайн'),(5,'Доставка'),(12,'Красота и здоровье'),(15,'Маркетинг'),(7,'Перевод текстов'),(1,'Программирование'),(3,'Ремонт и отделка'),(8,'Репетиторство'),(14,'Спорт и фитнес'),(11,'Строительство'),(4,'Уборка'),(6,'Фотография'),(9,'Юридические услуги');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executor_profiles`
--

DROP TABLE IF EXISTS `executor_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executor_profiles` (
  `user_id` int NOT NULL,
  `bio` text,
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `response_time_avg_minutes` int DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  `location_lat` decimal(10,8) DEFAULT NULL,
  `location_lng` decimal(11,8) DEFAULT NULL,
  `completed_tasks` int DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `idx_available` (`is_available`),
  KEY `idx_response_time` (`response_time_avg_minutes`),
  CONSTRAINT `executor_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executor_profiles`
--

LOCK TABLES `executor_profiles` WRITE;
/*!40000 ALTER TABLE `executor_profiles` DISABLE KEYS */;
INSERT INTO `executor_profiles` VALUES (8,NULL,NULL,NULL,1,NULL,NULL,0),(10,'Опытный веб-разработчик. Специализация: PHP, Python, JavaScript, React. Работаю быстро и качественно.',2500.00,5,1,55.75124400,37.61842300,47),(11,'Креативный дизайнер с 5-летним опытом. Создаю логотипы, фирменный стиль, дизайн сайтов.',2000.00,10,1,55.75234500,37.61956700,35),(12,'Мастер на все руки! Сантехника, электрика, мелкий ремонт. Выезд по городу.',1500.00,15,1,55.74912300,37.61578900,72),(13,'Профессиональная уборка квартир, домов и офисов. Работаем со своей техникой.',1000.00,8,1,55.75345600,37.62123400,95),(14,'Свадебный, репортажный и портретный фотограф. Студия в центре города.',3500.00,20,1,55.74876500,37.61432100,28),(15,'Перевод с английского, немецкого, французского. Технический и художественный перевод.',1200.00,12,1,55.75456700,37.62234500,44),(16,'Репетитор математики и физики. Подготовка к ЕГЭ, ОГЭ, помощь со школьной программой.',1800.00,7,1,55.74789000,37.61345600,61),(17,'Юридические консультации, составление договоров, представление в суде.',3500.00,30,1,55.75567800,37.62345600,38),(18,'Бухгалтерское сопровождение ИП и ООО. Отчётность, налоги, консультации.',2000.00,25,1,55.74654300,37.61234500,31),(19,'Быстрая доставка по городу. Заберу и доставлю в любое место.',800.00,4,1,55.75678900,37.62456700,125),(20,'Персональные тренировки. Фитнес, кроссфит, подготовка к соревнованиям.',2500.00,15,1,55.75000000,37.62000000,22);
/*!40000 ALTER TABLE `executor_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `recipient_id` int NOT NULL,
  `sent_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`notification_id`),
  KEY `task_id` (`task_id`),
  KEY `idx_unread` (`recipient_id`,`is_read`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,10,'2026-04-04 12:16:51',0),(2,1,11,'2026-04-04 12:16:51',0),(3,2,12,'2026-04-04 09:16:51',1),(4,2,13,'2026-04-04 09:16:51',1),(5,3,19,'2026-04-04 13:16:51',0),(6,3,15,'2026-04-04 13:16:51',0),(7,4,11,'2026-04-03 14:16:51',1),(8,4,14,'2026-04-03 14:16:51',0),(9,5,13,'2026-04-02 14:16:51',0),(10,5,15,'2026-04-02 14:16:51',0),(11,6,10,'2026-04-01 14:16:51',0),(12,6,11,'2026-04-01 14:16:51',0),(13,7,14,'2026-03-31 14:16:51',0),(14,7,15,'2026-03-31 14:16:51',0),(15,8,15,'2026-03-30 14:16:51',1),(16,9,16,'2026-03-29 14:16:51',0),(17,9,20,'2026-03-29 14:16:51',0),(18,10,17,'2026-04-03 14:16:51',0),(19,11,18,'2026-03-28 14:16:51',0),(20,12,20,'2026-04-01 14:16:51',0);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `reviewer_id` int NOT NULL,
  `reviewed_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `comment` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `reviewer_id` (`reviewer_id`),
  KEY `idx_reviewed` (`reviewed_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`reviewed_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reviews_chk_1` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,5,12,5,'Отличный сантехник! Приехал быстро, всё починил качественно','2026-04-03 14:16:51'),(2,7,6,14,5,'Замечательный фотограф! Сделал отличные снимки','2026-04-02 14:16:51'),(3,8,4,15,4,'Хороший перевод, но немного задержался','2026-04-01 14:16:51'),(4,3,6,19,5,'Быстрая доставка, всё вовремя','2026-03-31 14:16:51'),(5,4,7,11,5,'Отличный дизайн! Логотип превзошёл ожидания','2026-03-30 14:16:51');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_responses`
--

DROP TABLE IF EXISTS `task_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_responses` (
  `response_id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `executor_id` int NOT NULL,
  `proposed_price` decimal(10,2) DEFAULT NULL,
  `message` text,
  `responded_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('ожидает','принят','отклонён') DEFAULT 'ожидает',
  PRIMARY KEY (`response_id`),
  UNIQUE KEY `uk_task_executor` (`task_id`,`executor_id`),
  KEY `idx_task_status` (`task_id`,`status`),
  KEY `idx_executor` (`executor_id`),
  CONSTRAINT `task_responses_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE,
  CONSTRAINT `task_responses_ibfk_2` FOREIGN KEY (`executor_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_responses`
--

LOCK TABLES `task_responses` WRITE;
/*!40000 ALTER TABLE `task_responses` DISABLE KEYS */;
INSERT INTO `task_responses` VALUES (1,1,10,9000.00,'Возьмусь за ваш сайт. Есть опыт восстановления магазинов.','2026-04-04 13:16:51','ожидает'),(2,1,11,9500.00,'Могу помочь с сайтом. Работаю быстро.','2026-04-04 13:46:51','ожидает'),(3,2,12,2800.00,'Профессиональный сантехник. Выезд через час.','2026-04-04 10:16:51','принят'),(4,2,13,3000.00,'Сделаю быстро и качественно.','2026-04-04 11:16:51','отклонён'),(5,3,19,800.00,'Заберу через 30 минут и доставлю куда нужно.','2026-04-04 13:46:51','ожидает'),(6,3,15,900.00,'Могу выполнить доставку.','2026-04-04 14:01:51','ожидает'),(7,4,11,4500.00,'Сделаю крутой логотип за 2 дня. Портфолио пришлю.','2026-04-03 15:16:51','ожидает'),(8,4,14,4800.00,'Дизайн логотипа, большой опыт.','2026-04-03 16:16:51','ожидает'),(9,5,13,7500.00,'Профессиональная уборка со своей техникой.','2026-04-02 14:16:51','ожидает'),(10,5,15,8000.00,'Качественно уберу офис.','2026-04-03 14:16:51','ожидает'),(11,6,10,14000.00,'Разработаю лендинг под ключ. Адаптив, формы, анимация.','2026-04-01 14:16:51','ожидает'),(12,6,11,14500.00,'Сделаю красивый лендинг с дизайном.','2026-04-02 14:16:51','ожидает'),(13,7,14,11000.00,'Профессиональная фотосессия. Своё оборудование.','2026-03-31 14:16:51','ожидает'),(14,7,15,11500.00,'Сделаю качественные фото.','2026-04-01 14:16:51','ожидает'),(15,8,15,19000.00,'Переведу качественно, технический перевод мой профиль.','2026-03-30 14:16:51','принят'),(16,9,16,18000.00,'Репетитор с опытом 7 лет, гарантия результата.','2026-03-29 14:16:51','ожидает'),(17,9,20,19000.00,'Подготовлю к ЕГЭ на высокий балл.','2026-03-30 14:16:51','ожидает'),(18,10,17,4500.00,'Проверю договор и дам рекомендации.','2026-04-03 14:16:51','ожидает'),(19,11,18,14000.00,'Возьму на бухгалтерское сопровождение.','2026-03-28 14:16:51','ожидает'),(20,12,20,28000.00,'Персональные тренировки. Индивидуальный подход.','2026-04-01 14:16:51','ожидает'),(21,6,8,15000.00,'zzz','2026-04-10 22:47:09','ожидает');
/*!40000 ALTER TABLE `task_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `category_id` int DEFAULT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `urgency_level` enum('обычная','срочная','очень срочно') NOT NULL DEFAULT 'обычная',
  `deadline` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `location_lat` decimal(10,8) DEFAULT NULL,
  `location_lng` decimal(11,8) DEFAULT NULL,
  `address_text` text,
  `status` enum('открыта','в работе','завершена','отменена') DEFAULT 'открыта',
  PRIMARY KEY (`task_id`),
  KEY `customer_id` (`customer_id`),
  KEY `idx_status_urgency` (`status`,`urgency_level`),
  KEY `idx_created` (`created_at`),
  KEY `idx_deadline` (`deadline`),
  KEY `idx_category` (`category_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,4,'Срочно починить сайт','Сайт интернет-магазина упал. Нужно срочно восстановить работу.',1,10000.00,'очень срочно','2026-04-05 14:16:51','2026-04-04 12:16:51',55.75124400,37.61842300,'Москва, ул. Тверская 1','открыта'),(2,5,'Протекла труба на кухне','Срочно вызвать сантехника. Течёт вода, нужен выезд сегодня.',3,3000.00,'очень срочно','2026-04-05 14:16:51','2026-04-04 09:16:51',55.74912300,37.61578900,'Москва, ул. Новый Арбат 15','в работе'),(3,6,'Срочная доставка документов','Нужно срочно забрать документы из офиса и отвезти в банк.',5,1000.00,'очень срочно','2026-04-05 14:16:51','2026-04-04 13:16:51',55.75678900,37.62456700,'Москва, ул. Кузнецкий мост 8','открыта'),(4,7,'Логотип для кафе','Нужен современный логотип для нового кафе.',2,5000.00,'срочная','2026-04-07 14:16:51','2026-04-03 14:16:51',55.75234500,37.61956700,'Москва, ул. Арбат 10','открыта'),(5,8,'Генеральная уборка офиса','Убрать офис 100 кв.м после ремонта.',4,8000.00,'срочная','2026-04-06 14:16:51','2026-04-02 14:16:51',55.75345600,37.62123400,'Москва, ул. Тверская 5','открыта'),(6,5,'Разработать лендинг','Нужна одностраничная landing page для рекламной кампании.',1,15000.00,'обычная','2026-04-18 14:16:51','2026-04-01 14:16:51',55.75124400,37.61842300,'Москва, ул. Тверская 1','открыта'),(7,6,'Фотосессия для каталога','Сфотографировать 50 товаров для интернет-магазина.',6,12000.00,'обычная','2026-04-14 14:16:51','2026-03-31 14:16:51',55.74876500,37.61432100,'Москва, ул. Покровка 20','в работе'),(8,4,'Перевести техническую документацию','Английский -> Русский. 100 страниц тех. документации.',7,20000.00,'обычная','2026-04-25 14:16:51','2026-03-30 14:16:51',55.75456700,37.62234500,'Москва, ул. Мясницкая 3','завершена'),(9,7,'Подготовка к ЕГЭ по математике','Репетитор для 11-классника. Занятия 2 раза в неделю.',8,20000.00,'обычная','2026-06-03 14:16:51','2026-03-29 14:16:51',55.74789000,37.61345600,'Москва, ул. Сретенка 7','открыта'),(10,8,'Проверить договор аренды','Юридическая проверка договора аренды коммерческой недвижимости.',9,5000.00,'срочная','2026-04-06 14:16:51','2026-04-03 14:16:51',55.75567800,37.62345600,'Москва, ул. Неглинная 12','открыта'),(11,9,'Бухгалтерское сопровождение','Отчётность за квартал для ИП на УСН.',10,15000.00,'обычная','2026-04-24 14:16:51','2026-03-28 14:16:51',55.74654300,37.61234500,'Москва, ул. Петровка 25','открыта'),(12,5,'Персональные тренировки','Нужен тренер для подготовки к марафону.',14,30000.00,'обычная','2026-05-04 14:16:51','2026-04-01 14:16:51',55.75000000,37.62000000,'Москва, ул. Тверская 10','открыта');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(25) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `role` enum('заказчик','исполнитель','модератор','администратор') NOT NULL,
  `rating` decimal(3,2) DEFAULT '0.00',
  `is_blocked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_role` (`role`),
  KEY `idx_rating` (`rating`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@work.ru','+79001234567','password123','Алексей Админов','администратор',5.00,0,'2024-01-01 10:00:00'),(2,'moder@work.ru','+79011234567','password123','Мария Модератор','модератор',4.90,0,'2024-01-02 11:00:00'),(3,'moder2@work.ru','+79021234567','password123','Сергей Модератор','модератор',4.85,0,'2024-01-03 12:00:00'),(4,'ivan.petrov@mail.ru','+79031234567','password123','Иван Петров','заказчик',4.80,0,'2024-01-10 09:00:00'),(5,'elena.sidorova@mail.ru','+79041234567','password123','Елена Сидорова','заказчик',4.70,0,'2024-01-11 10:30:00'),(6,'sergey.ivanov@mail.ru','+79051234567','password123','Сергей Иванов','заказчик',4.90,0,'2024-01-12 14:15:00'),(7,'anna.kozlov@mail.ru','+79061234567','password123','Анна Козлова','заказчик',4.95,0,'2024-01-13 16:20:00'),(8,'dmitry.sokolov@mail.ru','+79071234567','password123','Дмитрий Соколов','исполнитель',4.60,0,'2024-01-14 08:45:00'),(9,'olga.volkova@mail.ru','+79081234567','password123','Ольга Волкова','заказчик',4.75,0,'2024-01-15 13:10:00'),(10,'mikhail.dev@mail.ru','+79091234567','password123','Михаил Программист','исполнитель',4.95,0,'2024-01-20 09:00:00'),(11,'anna.design@mail.ru','+79101234567','password123','Анна Дизайнер','исполнитель',4.90,0,'2024-01-21 10:00:00'),(12,'petr.master@mail.ru','+79111234567','password123','Пётр Ремонтник','исполнитель',4.85,0,'2024-01-22 11:00:00'),(13,'olga.clean@mail.ru','+79121234567','password123','Ольга Уборщица','исполнитель',4.98,0,'2024-01-23 12:00:00'),(14,'igor.photo@mail.ru','+79131234567','password123','Игорь Фотограф','исполнитель',4.88,0,'2024-01-24 13:00:00'),(15,'natalia.trans@mail.ru','+79141234567','password123','Наталья Перевод','исполнитель',4.92,0,'2024-01-25 14:00:00'),(16,'alex.tutor@mail.ru','+79151234567','password123','Александр Репетитор','исполнитель',4.87,0,'2024-01-26 15:00:00'),(17,'ekaterina.law@mail.ru','+79161234567','password123','Екатерина Юрист','исполнитель',4.94,0,'2024-01-27 16:00:00'),(18,'vladimir.acc@mail.ru','+79171234567','password123','Владимир Бухгалтер','исполнитель',4.91,0,'2024-01-28 17:00:00'),(19,'svetlana.delivery@mail.ru','+79181234567','password123','Светлана Доставка','исполнитель',4.83,0,'2024-01-29 18:00:00'),(20,'dmitry.fit@mail.ru','+79191234567','password123','Дмитрий Тренер','исполнитель',4.89,0,'2024-01-30 19:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-11 12:05:40
