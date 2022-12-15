CREATE DATABASE  IF NOT EXISTS `sdev265` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sdev265`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sdev265
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `authlevels`
--

DROP TABLE IF EXISTS `authlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authlevels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authlevels`
--

LOCK TABLES `authlevels` WRITE;
/*!40000 ALTER TABLE `authlevels` DISABLE KEYS */;
INSERT INTO `authlevels` VALUES (1,'Administration'),(2,'Account holder user');
/*!40000 ALTER TABLE `authlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoriterecipes`
--

DROP TABLE IF EXISTS `favoriterecipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoriterecipes` (
  `recipeId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`recipeId`,`userId`),
  UNIQUE KEY `favoriteRecipes_recipeId_userId_unique` (`recipeId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `favoriterecipes_ibfk_1` FOREIGN KEY (`recipeId`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favoriterecipes_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoriterecipes`
--

LOCK TABLES `favoriterecipes` WRITE;
/*!40000 ALTER TABLE `favoriterecipes` DISABLE KEYS */;
INSERT INTO `favoriterecipes` VALUES (259,4),(269,4),(280,4),(281,4);
/*!40000 ALTER TABLE `favoriterecipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `shelfStable` tinyint(1) NOT NULL,
  `staple` tinyint(1) NOT NULL,
  `vegetarian` tinyint(1) NOT NULL,
  `vegan` tinyint(1) NOT NULL,
  `ingredientTypeId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ingredientTypeId` (`ingredientTypeId`),
  CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`ingredientTypeId`) REFERENCES `ingredienttypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (982,'Onion',NULL,0,0,0,0,8),(983,'Green Onion',NULL,0,0,0,0,8),(984,'Mushrooms',NULL,0,0,0,0,8),(985,'Olive Oil',NULL,0,0,0,0,12),(986,'Sesame Oil',NULL,0,0,0,0,12),(987,'Vegetable Oil',NULL,0,0,0,0,12),(988,'Canola Oil',NULL,0,0,0,0,12),(989,'Coconut Oil',NULL,0,0,0,0,12),(990,'Spinach',NULL,0,0,0,0,8),(991,'Ham',NULL,0,0,0,0,6),(992,'Eggs',NULL,0,0,0,0,6),(993,'Pepper',NULL,0,0,0,0,12),(994,'Cinnamon',NULL,0,0,0,0,12),(995,'Nutmeg',NULL,0,0,0,0,12),(996,'Sugar',NULL,0,0,0,0,12),(997,'Butter',NULL,0,0,0,0,11),(998,'Milk',NULL,0,0,0,0,11),(999,'Vanilla Extract',NULL,0,0,0,0,12),(1000,'Bread',NULL,0,0,0,0,7),(1001,'Maple Syrup',NULL,0,0,0,0,4),(1002,'Potatoes',NULL,0,0,0,0,8),(1003,'Green Chiles',NULL,0,0,0,0,8),(1004,'Salt',NULL,0,0,0,0,12),(1005,'Sausage Links',NULL,0,0,0,0,6),(1006,'Tortillas',NULL,0,0,0,0,7),(1007,'Tomatoes',NULL,0,0,0,0,8),(1008,'Basil',NULL,0,0,0,0,12),(1009,'English Muffin',NULL,0,0,0,0,7),(1010,'Chives',NULL,0,0,0,0,8),(1011,'Flour',NULL,0,0,0,0,12),(1012,'Baking Powder',NULL,0,0,0,0,12),(1013,'Half & Half',NULL,0,0,0,0,11),(1014,'Raspberries',NULL,0,0,0,0,9),(1015,'Strawberries',NULL,0,0,0,0,9),(1016,'Banana',NULL,0,0,0,0,9),(1017,'Ice',NULL,0,0,0,0,5),(1018,'Honey',NULL,0,0,0,0,4),(1019,'Rolled Oats',NULL,0,0,0,0,7),(1020,'Water',NULL,0,0,0,0,5),(1021,'Peanut Butter',NULL,0,0,0,0,4),(1022,'Granola',NULL,0,0,0,0,7),(1023,'Yogurt',NULL,0,0,0,0,11),(1024,'Chicken Breasts',NULL,0,0,0,0,6),(1025,'Almonds',NULL,0,0,0,0,6),(1026,'Mayonnaise',NULL,0,0,0,0,4),(1027,'Mustard',NULL,0,0,0,0,4),(1028,'Grapes',NULL,0,0,0,0,9),(1029,'Celery',NULL,0,0,0,0,8),(1030,'Parsley',NULL,0,0,0,0,12),(1031,'Tarragon',NULL,0,0,0,0,12),(1032,'Lemon',NULL,0,0,0,0,9),(1033,'Garlic Powder',NULL,0,0,0,0,12),(1034,'Ginger',NULL,0,0,0,0,12),(1035,'Lime',NULL,0,0,0,0,9),(1036,'Rice',NULL,0,0,0,0,7),(1037,'Avocado',NULL,0,0,0,0,9),(1038,'Cilantro',NULL,0,0,0,0,12),(1039,'Sesame Seeds',NULL,0,0,0,0,12),(1040,'Stock',NULL,0,0,0,0,6),(1041,'Paprika',NULL,0,0,0,0,12),(1042,'Tuna',NULL,0,0,0,0,6),(1043,'Vinegar',NULL,0,0,0,0,12),(1044,'Sriracha',NULL,0,0,0,0,4),(1045,'Cucumber',NULL,0,0,0,0,8),(1046,'Carrots',NULL,0,0,0,0,8),(1047,'Edamame',NULL,0,0,0,0,8),(1048,'Pasta',NULL,0,0,0,0,7),(1049,'Bell Pepper',NULL,0,0,0,0,8),(1050,'Zucchini',NULL,0,0,0,0,8),(1051,'Olives',NULL,0,0,0,0,8),(1052,'Mozzarella Balls',NULL,0,0,0,0,11),(1053,'Peas',NULL,0,0,0,0,8),(1054,'Quinoa',NULL,0,0,0,0,7),(1055,'Apple',NULL,0,0,0,0,9),(1056,'Chickpeas',NULL,0,0,0,0,6),(1057,'Raisins',NULL,0,0,0,0,9),(1058,'Cumin',NULL,0,0,0,0,12),(1059,'Wraps',NULL,0,0,0,0,7),(1060,'Hummus',NULL,0,0,0,0,5),(1061,'Sprouts',NULL,0,0,0,0,8),(1062,'Oregano',NULL,0,0,0,0,12),(1063,'Thyme',NULL,0,0,0,0,12),(1064,'Wine',NULL,0,0,0,0,5),(1065,'Zest',NULL,0,0,0,0,12),(1066,'Cornstarch',NULL,0,0,0,0,12),(1067,'Noodles',NULL,0,0,0,0,7),(1068,'Celery Seed',NULL,0,0,0,0,12),(1069,'Pie Crusts',NULL,0,0,0,0,7),(1070,'Lettuce',NULL,0,0,0,0,8),(1071,'Chili Powder',NULL,0,0,0,0,12),(1072,'Red Pepper Flakes',NULL,0,0,0,0,12),(1073,'Sausage',NULL,0,0,0,0,6),(1074,'Ground Beef',NULL,0,0,0,0,6),(1075,'Steak',NULL,0,0,0,0,6),(1076,'Crushed Tomatoes',NULL,0,0,0,0,8),(1077,'Tomato Paste',NULL,0,0,0,0,8),(1078,'Basil Leaves',NULL,0,0,0,0,12),(1079,'Fennel Seeds',NULL,0,0,0,0,12),(1080,'Italian Seasoning',NULL,0,0,0,0,12),(1081,'Pork Chops',NULL,0,0,0,0,6),(1082,'Sage',NULL,0,0,0,0,12),(1083,'Rosemary',NULL,0,0,0,0,12),(1084,'Peas and Carrots',NULL,0,0,0,0,8),(1085,'Sour Cream',NULL,0,0,0,0,11),(1086,'Garlic Cloves',NULL,0,0,0,0,12),(1087,'Lentils',NULL,0,0,0,0,6),(1088,'Black Beans',NULL,0,0,0,0,6),(1089,'Tofu',NULL,0,0,0,0,6),(1090,'Cabbage',NULL,0,0,0,0,8),(1091,'Broccoli',NULL,0,0,0,0,8),(1092,'Soy Sauce',NULL,0,0,0,0,4),(1093,'Worcestershire Sauce',NULL,0,0,0,0,4),(1094,'Hoisin Sauce',NULL,0,0,0,0,4),(1095,'Oyster Sauce',NULL,0,0,0,0,4),(1096,'Tomato Sauce',NULL,0,0,0,0,4),(1097,'Chicken Broth',NULL,0,0,0,0,6),(1098,'Beef Broth',NULL,0,0,0,0,6),(1099,'Lime Juice',NULL,0,0,0,0,9),(1100,'Pineapple Juice',NULL,0,0,0,0,9),(1101,'Lemon Juice',NULL,0,0,0,0,9),(1102,'Parmesan Cheese',NULL,0,0,0,0,11),(1103,'Cheddar Cheese',NULL,0,0,0,0,11),(1104,'Ricotta Cheese',NULL,0,0,0,0,11),(1105,'Mozzarella Cheese',NULL,0,0,0,0,11),(1106,'Mexican Cheese',NULL,0,0,0,0,11),(1107,'Muenster Cheese',NULL,0,0,0,0,11),(1108,'Provolone Cheese',NULL,0,0,0,0,11),(1109,'Feta Cheese',NULL,0,0,0,0,11),(1110,'Vegetable Broth',NULL,0,0,0,0,6);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredienttypes`
--

DROP TABLE IF EXISTS `ingredienttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredienttypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredienttypes`
--

LOCK TABLES `ingredienttypes` WRITE;
/*!40000 ALTER TABLE `ingredienttypes` DISABLE KEYS */;
INSERT INTO `ingredienttypes` VALUES (1,'Main'),(2,'Side'),(3,'Integrated'),(4,'Dressing'),(5,'Other'),(6,'Protein'),(7,'Carb'),(8,'Vegetable'),(9,'Fruit'),(10,'Fat'),(11,'Dairy'),(12,'Seasoning');
/*!40000 ALTER TABLE `ingredienttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planrecipes`
--

DROP TABLE IF EXISTS `planrecipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planrecipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipeId` int DEFAULT NULL,
  `planId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipeId` (`recipeId`),
  KEY `planId` (`planId`),
  CONSTRAINT `planrecipes_ibfk_1` FOREIGN KEY (`recipeId`) REFERENCES `recipes` (`id`),
  CONSTRAINT `planrecipes_ibfk_2` FOREIGN KEY (`planId`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planrecipes`
--

LOCK TABLES `planrecipes` WRITE;
/*!40000 ALTER TABLE `planrecipes` DISABLE KEYS */;
INSERT INTO `planrecipes` VALUES (258,264,22),(259,272,22),(260,277,22),(261,264,22),(262,276,22),(263,272,22),(264,268,22),(265,277,22),(266,260,22),(267,262,22),(268,270,22),(269,272,22),(270,262,22),(271,274,22),(272,270,22),(273,263,23),(274,278,23),(275,282,23),(276,263,23),(277,271,23),(278,287,23),(279,261,23),(280,273,23),(281,288,23),(282,267,23),(283,275,23),(284,287,23),(285,262,23),(286,273,23),(287,285,23),(288,263,24),(289,276,24),(290,287,24),(291,262,24),(292,271,24),(293,284,24),(294,266,24),(295,269,24),(296,284,24),(297,262,24),(298,269,24),(299,281,24),(300,263,24),(301,270,24),(302,284,24),(309,274,26),(310,275,26),(311,288,26),(312,271,26),(313,285,26),(314,271,26),(315,275,26),(316,277,26),(317,270,26),(318,277,26);
/*!40000 ALTER TABLE `planrecipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numMeals` int NOT NULL,
  `numDays` int NOT NULL,
  `breakfast` tinyint(1) DEFAULT NULL,
  `lunch` tinyint(1) DEFAULT NULL,
  `dinner` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `plans_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (22,3,5,1,1,0,'2022-12-13 02:23:40','2022-12-13 02:23:40',4),(23,3,5,1,1,1,'2022-12-13 02:41:20','2022-12-13 02:41:20',4),(24,3,5,1,1,1,'2022-12-13 23:31:19','2022-12-13 23:31:19',4),(26,2,5,0,1,1,'2022-12-13 23:51:54','2022-12-13 23:51:54',4);
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeingredients`
--

DROP TABLE IF EXISTS `recipeingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeingredients` (
  `recipeId` int NOT NULL,
  `ingredientId` int NOT NULL,
  `quantity` float DEFAULT NULL,
  `qualifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`recipeId`,`ingredientId`),
  UNIQUE KEY `recipeIngredients_recipeId_ingredientId_unique` (`recipeId`,`ingredientId`),
  KEY `ingredientId` (`ingredientId`),
  CONSTRAINT `recipeingredients_ibfk_1` FOREIGN KEY (`recipeId`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recipeingredients_ibfk_2` FOREIGN KEY (`ingredientId`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeingredients`
--

LOCK TABLES `recipeingredients` WRITE;
/*!40000 ALTER TABLE `recipeingredients` DISABLE KEYS */;
INSERT INTO `recipeingredients` VALUES (259,982,1,'Cup Chopped'),(259,984,1,'Cup Sliced Fresh'),(259,988,1,'Tablespoon Canola'),(259,990,1,'Package (10 ounces) Frozen Chopped '),(259,991,0.66,'Cup Finely Chopped Fully Cooked'),(259,992,5,'Large'),(259,993,0.25,'Teaspoon'),(259,1107,3,'Cups Shredded Muenster or Monterey Jack'),(260,992,4,'Large'),(260,994,1,'Teaspoon Ground'),(260,995,0.25,'Teaspoon Ground'),(260,996,2,'Tablespoons'),(260,997,4,'Tablespoons'),(260,998,0.25,'Cup'),(260,999,0.5,'Teaspoon'),(260,1000,8,'Slices Challah, Brioche, or White'),(260,1001,0.5,'Cup Warmed'),(261,987,3,'Tablespoon Vegetable'),(261,992,8,'Large'),(261,993,0.5,'Teaspoon'),(261,1002,4,'Cups Frozen Shredded Hash Brown '),(261,1003,1,'Can (4.5 oz) Chopped'),(261,1004,0.5,'Teaspoon'),(261,1005,6,'Fully Cooked Breakfast'),(261,1006,8,'Flour'),(261,1106,2,'Cups Shredded Mexican'),(262,992,2,'Large'),(262,997,1,'Tablespoon Unsalted'),(262,1007,3,'Halved, Salted Cherry'),(262,1008,2,'Tablespoons Chopped'),(262,1103,2,'Tablespoons Grated'),(263,985,1,'Tablespoon Olive'),(263,991,2,'Slices of'),(263,992,2,'Large'),(263,993,0.5,'Teaspoon (to Taste)'),(263,1004,0.5,'Teaspoon (to Taste)'),(263,1009,1,'Halved'),(263,1010,1,'Teaspoon Finely Chopped'),(263,1105,0.33,'Cup Finely Shredded '),(264,992,1,'Large'),(264,996,1,'Tablespoon White'),(264,997,3,'Tablespoon Melted'),(264,998,1.25,'Cups'),(264,1004,0.25,'Teaspoons'),(264,1011,1.5,'Cups All-Purpose'),(264,1012,3.5,'Teaspoons'),(265,992,4,'Large'),(265,993,0.5,'Teaspoon (to Taste)'),(265,997,1,'Tablespoon Unsalted'),(265,1004,0.25,'Teaspoon Kosher'),(265,1013,0.25,'Cup'),(266,998,1,'Cup Almond'),(266,1014,1.5,'Cups'),(266,1015,1,'Cup'),(266,1016,0.5,'of a Whole Frozen'),(266,1017,1.5,'Cups'),(266,1018,1,'Tablespoon'),(267,989,1,'Tablespoon Coconut'),(267,994,1,'Teaspoon'),(267,998,1,'Cup Almond'),(267,1004,0.25,'Teaspoon Kosher'),(267,1019,2,'Cups Old Fashioned'),(267,1020,1,'Cup'),(267,1021,2,'Tablespoons'),(268,1014,0.25,'Cup Fresh'),(268,1022,0.33,'Cup'),(268,1023,1,'5.3-ounce Cup of Siggi’s Plant-Based Coconut Blend'),(269,982,3,'Sliced Green'),(269,1004,0.5,'Teaspoon (to Taste)'),(269,1024,2,'Pounds Boneless Skinless'),(269,1025,0.5,'Cup Sliced'),(269,1026,1,'Cup'),(269,1027,1,'Tablespoon Dijon'),(269,1028,1,'Cup Quartered Red'),(269,1029,2,'Diced Stalks'),(269,1030,2,'Tablespoons Chopped'),(269,1031,1,'Tablespoon Chopped'),(269,1032,1,'Juiced'),(270,982,1,'Large Diced Red'),(270,985,3,'Tablespoons Extra Virgin Olive'),(270,986,1,'Tablespoon Toasted Sesame'),(270,990,2,'Cups Baby'),(270,1002,1,'Large Cubed Sweet'),(270,1018,1,'Tablespoon'),(270,1021,2,'Tablespoons Creamy'),(270,1024,1,'Pound Boneless Skinless'),(270,1033,0.5,'Teaspoon'),(270,1034,0.5,'Teaspoon Ground'),(270,1036,4,'Cups Cooked Brown'),(270,1037,1,'Thinly Sliced'),(270,1038,1,'Tablespoon Freshly Chopped'),(270,1039,1,'Teaspoon Toasted'),(270,1086,1,'Small Minced'),(270,1092,1,'Tablespoon Low-Sodium Soy'),(270,1099,0.25,'Cup Lime'),(271,982,4,'Large Thinly Sliced'),(271,993,1,'Teaspoon Ground Black'),(271,997,1,'Ounce'),(271,1000,4,'Slices of Toasted Thick'),(271,1033,0.5,'Teaspoon'),(271,1093,3,'Tablespoons Worcestershire'),(271,1098,32,'Ounces Beef'),(271,1108,4,'Slices of Provolone'),(272,982,0.5,'Chopped Medium'),(272,993,0.5,'Teaspoon Black'),(272,997,4,'Tablespoons'),(272,1004,1,'Teaspoon Kosher'),(272,1011,4,'Tablespoons All-Purpose'),(272,1013,2,'Cups'),(272,1040,2,'Cups Low Sodium Chicken'),(272,1041,0.25,'Teaspoon'),(272,1046,1,'Grated Large'),(272,1086,3,'Minced'),(272,1091,1,'Large Head'),(272,1103,8,'Ounce Block Grated Cheddar'),(273,982,1,'Teaspoon Green'),(273,986,1,'Tablespoon Sesame'),(273,1018,1,'Teaspoon'),(273,1026,0.25,'Cup Light'),(273,1036,4,'Cups Cooked Brown'),(273,1037,2,'Large Sliced'),(273,1039,1,'Tablespoon Black'),(273,1042,1,'Pound Sushi-Grade Ahi'),(273,1043,1,'Tablespoon Rice'),(273,1044,1,'Teaspoon'),(273,1045,1,'Cup Diced'),(273,1046,0.5,'Cup Shredded'),(273,1047,0.5,'Cup Shelled'),(273,1092,2,'Tablespoons Soy'),(274,982,0.33,'Cup Thinly Sliced Green'),(274,985,0.5,'Cup Extra-Virgin Olive'),(274,993,0.5,'Teaspoon Fresh Ground Black'),(274,1004,0.5,'Teaspoon'),(274,1007,1,'Cup Halved Cherry'),(274,1043,0.33,'Cup Red Wine'),(274,1048,1,'Pound Dried Rotini'),(274,1049,1,'Cup Sliced'),(274,1050,1,'Cup Thinly Sliced'),(274,1051,1,'Cup Halved Mixed'),(274,1052,1,'Cup Chopped Fresh'),(274,1102,1,'Cup Grated Parmesan'),(275,982,1,'Small Diced White'),(275,985,2,'Tablespoons Olive Oil'),(275,986,0.5,'Teaspoon Toasted Sesame'),(275,992,3,'Large Beaten'),(275,1046,2,'Peeled Diced Medium'),(275,1053,0.5,'Cup Frozen'),(275,1054,4,'Cups Cooked'),(275,1086,4,'Minced'),(275,1092,4,'Tablespoons Soy'),(275,1095,2,'Teaspoons Oyster'),(276,982,1,'Sliced Red'),(276,997,1,'Tablespoon Softened'),(276,1000,4,'Slices Whole Wheat Cinnamon-Raisin'),(276,1055,1,'Small Thinly Sliced'),(276,1103,4,'Slices Sharp White Cheddar'),(277,985,3,'Tablespoons Olive'),(277,990,1,'Handful'),(277,1004,1,'Pinch'),(277,1018,3,'Teaspoon'),(277,1056,1,'Can Drained'),(277,1057,1,'Small Handful'),(277,1058,1,'Teaspoon Ground'),(277,1101,1,'Tablespoon Lemon'),(277,1109,3.5,'Ounces Low Fat Feta'),(278,982,1,'Sliced Red'),(278,1037,1,'Thinly Sliced'),(278,1046,1,'Cup Thinly Sliced'),(278,1049,2,'Whole Roasted Red'),(278,1059,4,'Large Whole Wheat'),(278,1060,2,'Cups'),(278,1061,1,'Cup Alfalfa'),(278,1070,3,'Cups Shredded'),(279,985,0.25,'Cup Olive'),(279,993,0.5,'Teaspoon Black'),(279,996,1,'Tablespoon Brown'),(279,1004,2,'Teaspoons'),(279,1024,4,'Boneless'),(279,1032,1,'Whole'),(279,1033,2,'Teaspoons'),(279,1062,2,'Teaspoons Dried'),(279,1063,2,'Teaspoons Dried'),(279,1064,0.5,'Cup Dry White'),(279,1065,1,'Tablespoon Lemon'),(279,1086,6,'Minced'),(279,1101,2,'Tablespoons Fresh Lemon'),(280,982,0.5,'Cup Sliced'),(280,983,1,'Tablespoon Chopped'),(280,984,0.5,'Cup Sliced Shiitake'),(280,986,2,'Teaspoons Sesame Oil'),(280,987,1,'Tablespoon Vegetable'),(280,993,1,'Teaspoon'),(280,1004,1,'Teaspoon'),(280,1024,1,'Pound Sliced'),(280,1034,1,'Tablespoon Minced Fresh'),(280,1046,0.5,'Cup Sliced'),(280,1053,0.5,'Cup Halved Sugar Snap'),(280,1066,1,'Teaspoon'),(280,1067,4,'Servings Cooked Egg'),(280,1086,2,'Minced'),(280,1092,1,'Tablespoon Soy'),(280,1094,1,'Tablespoon Hoisin'),(280,1097,0.25,'Cup Chicken'),(281,982,0.33,'Cup Chopped'),(281,993,0.25,'Teaspoon Black'),(281,997,0.33,'Cup'),(281,998,0.66,'Cup'),(281,1004,0.5,'Teaspoon'),(281,1011,0.33,'Cup All Purpose'),(281,1024,1,'Pound Halved Boneless Skinless'),(281,1029,0.5,'Cup Sliced'),(281,1046,1,'Cup Sliced'),(281,1053,1,'Cup Frozen Green'),(281,1068,0.25,'Teaspoon'),(281,1069,2,'9 Inch Unbaked'),(281,1097,1.75,'Cups Chicken'),(282,982,2,'Sliced Medium White'),(282,985,3,'Tablespoons Olive'),(282,987,1,'Tablespoon Vegetable'),(282,993,0.5,'Teaspoon'),(282,1004,1,'Teaspoon Kosher'),(282,1038,0.25,'Cup Chopped'),(282,1041,1,'Teaspoon Smoked'),(282,1049,3,'Thinly Sliced'),(282,1058,2,'Teaspoons Ground'),(282,1071,2,'Teaspoons'),(282,1072,0.5,'Teaspoon'),(282,1075,2,'Pounds Skirt'),(282,1086,1,'Tablespoon Minced'),(282,1093,2,'Tablespoons Worcestershire'),(282,1099,0.33,'Cup Lime'),(282,1100,0.25,'Cup Pineapple'),(283,982,0.5,'Cup Minced'),(283,992,1,'Large'),(283,993,0.25,'Teaspoon'),(283,996,2,'Tablespoons White'),(283,1004,1.5,'Teaspoons'),(283,1020,0.5,'Cup'),(283,1030,4,'Tablespoons Chopped Fresh'),(283,1067,12,'Lasagna'),(283,1073,1,'Pound Sweet Italian'),(283,1074,0.75,'Pound Lean Ground'),(283,1076,1,'Can (28 Ounces)'),(283,1077,2,'Cans (6 Ounces)'),(283,1078,1.5,'Teaspoons Dried'),(283,1079,0.5,'Teaspoon'),(283,1080,1,'Teaspoon'),(283,1086,2,'Crushed'),(283,1096,2,'Cans (6.5 Ounces) Tomato'),(283,1102,0.75,'Cup Grated Parmesan'),(283,1104,16,'Ounces Ricotta'),(283,1105,0.75,'Pound Sliced Mozzarella'),(284,982,1,'Small Thinly Sliced Red'),(284,985,2,'Tablespoons Olive'),(284,993,0.25,'Teaspoon Black'),(284,1004,1,'Teaspoon'),(284,1027,1,'Teaspoon Dijon'),(284,1040,0.75,'Cup Low Sodium Chicken'),(284,1055,2,'Medium Thinly Sliced'),(284,1063,0,'Teaspoon Fresh Chopped'),(284,1081,4,'Ounces Bone-In'),(284,1082,1,'Tablespoon Fresh Chopped'),(284,1083,1.5,'Teaspoon Fresh Chopped'),(285,982,0.5,'Medium Diced'),(285,985,2,'Tablespoons Olive'),(285,1036,1,'Cup Uncooked White'),(285,1080,1,'Tablespoon'),(285,1081,1,'Pound Cubed Boneless'),(285,1084,1,'Cup Frozen'),(285,1085,0.5,'Cup'),(285,1086,2,'Minced'),(285,1097,2,'Cups Chicken'),(285,1103,1.5,'Cups Shredded Cheddar'),(286,986,2,'Tablespoons Toasted Sesame'),(286,988,2,'Tablespoons Canola'),(286,1020,0.25,'Cup'),(286,1021,0.5,'Cup Natural'),(286,1034,1,'Tablespoon Minced Fresh'),(286,1043,3,'Tablespoons Apple Cider'),(286,1044,1,'Teaspoon'),(286,1086,1,'Large Minced'),(286,1089,1,'(14 Ounce) Pack Extra Firm'),(286,1090,2,'Cups Roughly Chopped'),(286,1091,1,'Small Head Chopped'),(286,1092,0.25,'Cup Low Sodium Soy'),(287,982,1,'Medium Finely Chopped'),(287,984,8,'Ounces Chopped Cremini'),(287,985,0.25,'Cup Olive'),(287,997,3,'Tablespoons Unsalted'),(287,1004,1,'Teaspoon Kosher'),(287,1030,0.5,'Cup Coarsely Chopped'),(287,1048,10,'Ounces Orecchiette'),(287,1072,0.5,'Teaspoon Crushed'),(287,1077,0.25,'Cup Double-Concentrated'),(287,1086,2,'Coarsley Chopped'),(287,1087,1,'Cup Rinsed Brown'),(287,1102,1.5,'Ounces Finely Grated Parmesan'),(288,982,2,'Chopped Medium Yellow'),(288,985,2,'Tablespoons Extra-Virgin Olive'),(288,1029,3,'Stalks Finely Chopped'),(288,1038,0.25,'Cup Fresh Chopped'),(288,1046,1,'Peeled Sliced'),(288,1058,4.5,'Teaspoons Ground'),(288,1072,0.5,'Teaspoon'),(288,1086,6,'Minced'),(288,1088,4,'Cans (15 Ounces) Rinsed Drained'),(288,1099,2,'Tablespoons Fresh Lime'),(288,1110,4,'Cups Low-Sodium Vegetable');
/*!40000 ALTER TABLE `recipeingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipeinstructions`
--

DROP TABLE IF EXISTS `recipeinstructions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipeinstructions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stepIndex` int NOT NULL,
  `stepBody` varchar(255) NOT NULL,
  `recipeId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipeId` (`recipeId`),
  CONSTRAINT `recipeinstructions_ibfk_1` FOREIGN KEY (`recipeId`) REFERENCES `recipes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipeinstructions`
--

LOCK TABLES `recipeinstructions` WRITE;
/*!40000 ALTER TABLE `recipeinstructions` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipeinstructions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `numSteps` int NOT NULL,
  `prepTime` int NOT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `official` tinyint(1) DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `recipeTypeId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipeTypeId` (`recipeTypeId`),
  CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`recipeTypeId`) REFERENCES `recipetypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (259,'Crustless Spinach Quiche','This crustless quiche made with eggs, spinach, and Muenster cheese is perfect to serve at any meal.',1,50,'',1,1,1),(260,'French Toast','A dish usually served for breakfast in which bread is dipped into eggs and seasonings and then fried to a golden brown.',2,15,'',1,1,1),(261,'Breakfast Burritos','These easy breakfast burritos are just what you need for busy mornings.',4,35,'',1,1,1),(262,'Omelette','An omelette is a dish you might order for breakfast or brunch — made of beaten eggs, sometimes with the addition of vegetables, cheese, or meat.',5,15,'',1,1,1),(263,'Breakfast Sandwich','Our favorite breakfast sandwich recipes, starring: eggs, ham, and cheese.',4,30,'',1,1,1),(264,'Pancakes','These pancakes are light and fluffy with a soft crust and spongy texture.',2,15,'',1,1,1),(265,'Scrambled Eggs','A simple, staple breakfast, perfect for any morning.',7,5,'',1,1,1),(266,'Strawberry Banana Smoothie','This classic strawberry banana smoothie recipe is easy to make with six simple ingredients in less than 5 minutes, and always tastes so sweet and refreshing!',2,5,'',1,1,1),(267,'Peanut Butter Oatmeal','Peanut butter oatmeal is a quick, easy, and healthy vegan breakfast!',2,15,'',1,1,1),(268,'Yogurt Parfait','Layers of yogurt and fresh or frozen fruit that has been topped with a scoop of granola.',2,10,'',1,1,1),(269,'Chicken Salad','Chicken salad is a classic salad recipe with diced chicken, creamy mayonnaise, crisp celery, green onion, sweet grapes, and fresh herbs',5,25,'',1,1,2),(270,'Buddha Bowl','A fresh, delicious, healthy lunch with chicken and veggies!',4,40,'',1,1,2),(271,'French Onion Soup','French onion soup is a classic French dish made with caramelized onions and beef stock or broth. ',4,80,'',1,1,2),(272,'Broccoli Cheddar Soup','This easy one-pot broccoli cheddar soup is so comforting during cold months.',3,15,'',1,1,2),(273,'Poke Bowl','“Poke” means “cut into pieces” and the name refers to the slices or cubes of raw fish that are served in a bowl along with rice, dressing, vegetables and seasonings.',3,30,'',1,1,2),(274,'Pasta Salad','Fresh and easy pasta salad packed with crisp vegetables, fresh mozzarella, and tossed with a simple dressing.',3,20,'',1,1,2),(275,'Quinoa Fried Rice','Try swapping out traditional rice for quinoa in this easy quinoa fried “rice” recipe! ',11,15,'',1,1,2),(276,'Apple-White Cheddar Grilled Cheese','The classic combination of tart apples and savory Cheddar transform a basic grilled cheese into a sophisticated sandwich.',2,15,'',1,1,2),(277,'Chickpea Spinach Salad','This chickpea salad is enough to turn salad-haters into fans and to open up a whole new world of flavourful, filling salad possibilities.',4,10,'',1,1,2),(278,'Roasted Red Pepper Wraps','Filled with fun, tasty veggies, and you can make some to save for another time!',2,10,'',1,1,2),(279,'Lemon Chicken','This easy lemon chicken recipe shines with a sunny, lemony zing.',4,30,'',1,1,3),(280,'Chicken Lo Mein','Ditch the takeout for this easy chicken lo mein recipe!',7,30,'',1,1,3),(281,'Chicken Pot Pie','A delicious chicken pie made from scratch with carrots, peas, and celery in a pre-made crust.',5,20,'',1,1,3),(282,'Steak Fajitas','Steak Fajitas are made with juicy strips of marinated skirt steak and tender veggies served with soft flour tortillas.',4,120,'',1,1,3),(283,'Lasagna','A filling and comforting lasagna recipe, perfect for cold nights.',5,30,'',1,1,3),(284,'Pork Chops and Apples','This pork chops with apples and onions dish is a deliciously light and flavorful meal that’s perfect for fall.',7,10,'',1,1,3),(285,'Cheesy Pork and Rice','This cheesy pork and rice skillet is a complete meal, all made in just one skillet for a quick and easy weeknight dinner.',3,5,'',1,1,3),(286,'Tofu Stir-Fry with Peanut Sauce','Creamy, garlicky, gingery homemade peanut sauce makes this super healthy tofu and vegetable stir-fry into a hearty, satisfying vegan dinner even omnivores will love.',3,15,'',1,1,3),(287,'Pasta with Lentils and Mushrooms','A delicious vegetarian pasta dish with red lentils and mushrooms.',5,15,'',1,1,3),(288,'Black Bean Soup','A fresh and easy black bean soup that uses canned black beans for a quick dinner.',4,10,'',1,1,3);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipetypes`
--

DROP TABLE IF EXISTS `recipetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipetypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipetypes`
--

LOCK TABLES `recipetypes` WRITE;
/*!40000 ALTER TABLE `recipetypes` DISABLE KEYS */;
INSERT INTO `recipetypes` VALUES (1,'Breakfast'),(2,'Lunch'),(3,'Dinner'),(4,'Snacks');
/*!40000 ALTER TABLE `recipetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fName` varchar(255) NOT NULL,
  `lName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `AuthLevelId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `AuthLevelId` (`AuthLevelId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`AuthLevelId`) REFERENCES `authlevels` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'IriUser','Zink','iriUser','$2a$10$xU/2OOFRqobjqCriWfXNuOmpKi51GX0T79rr5NihMRGlU./BZhuX6','azink11@ivytech.edu','',2),(6,'IriAdmin','Zink','iriAdmin','$2a$10$FLc1DePmHddZAKOMQPcjweHdcsl4lB5LhYNGv3Zhvx2ZQQveeRBIG','azink11@ivytech.edu','',1),(7,'test12313','test1','test','test','test@email.com','111-111-1111',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sdev265'
--

--
-- Dumping routines for database 'sdev265'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-15 17:56:12
