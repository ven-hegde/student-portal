-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: student_portal
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `idcourses` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(45) NOT NULL,
  `term` varchar(45) DEFAULT NULL,
  `credits` int(11) NOT NULL,
  `instructor` varchar(45) DEFAULT NULL,
  `mode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcourses`),
  KEY `term_idx` (`term`),
  CONSTRAINT `term` FOREIGN KEY (`term`) REFERENCES `term` (`term_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6029 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (6005,'Web Based Application Dvlpment ','First Summer 2018 ',3,'Lida Safarnejad (P)','class room'),(6006,'Big Data Anlytcs for Comp Avdt','First Summer 2018',3,'Joon Jung (P)','TBA'),(6007,'Intelligent Systems','First Summer 2018',3,'Atif Farid Mohammad (P)','class room'),(6008,'Network Based Appl Dvlpmnt','First Summer 2018',3,'Farah Tokmic (P)','Online'),(6009,'Survey of Programming Languages','Second Summer 2018',3,'Mohsen M Dorodchi (P)','TBA'),(6010,'Cloud Computing for Data Analysis','Second Summer 2018',3,'Angelina Asenova Tzacheva (P)','class room'),(6011,'Machine Learning ','Second Summer 2018',3,'Atif Farid Mohammad (P)','class room'),(6012,'Intro to Game Design & Dvlpmnt','First Summer 2018',3,'Julio Cesar Bahamon (P)','Class Room'),(6013,'Adv Game Design & Development','Second Summer 2018',3,'Daniel Joseph Jugan (P)','Class Room'),(6015,'Adv Top in Algo & Data Struct','Fall 2018',3,'Hsin-Hao Su (P)','Class Room'),(6017,'Info Tech Eth, Pol & Secur','First Summer 2018',3,'Fredric B Williams (P)','Classroom - WOODW 154'),(6018,'IT Project','First Summer 2018',3,'Heather Richter Lipford (P)','TBA'),(6019,'Network Based Appl Dvlpmnt','Second Summer 2018',3,'Farah Tokmic (P)','Class Room - WOODW 140'),(6020,'Visual Analytics','Second Summer 2018',3,'Atif Farid Mohammad (P)','Class Room - WOODW 130'),(6021,'Cloud Computing for Data Analysis','Second Summer 2018',3,'Angelina Asenova Tzacheva (P)','TBA'),(6022,'Computer Comm & Networks','Fall 2018',3,'Pu Wang (P)','Classroom ATKINS 126'),(6023,'Computer Comm & Networks','Fall 2018',3,'Dazhao Cheng (P)','Classroom - BIOIN 105'),(6024,'Cloud Computing for Data Analysis','Fall 2018',3,'Srinivas Akella (P)','Classroom - WOODW 130'),(6025,'Cloud Computing for Data Analysis','Fall 2018',3,'Angelina Asenova Tzacheva (P)','Classroom - KNNDY 236'),(6026,'Network Based Appl Dvlpmnt','Fall 2018',3,'Dale-Marie Cretia Anne Wilson (P)','Online - CHHS 376'),(6027,'Mobile Application Development','Fall 2018',3,'Mohamed Shehab (P)','Classroom - KNNDY 236'),(6028,'Test Course One','First Summer 2018',3,'Test Inst One','Classroom');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registered_courses`
--

DROP TABLE IF EXISTS `registered_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registered_courses` (
  `resgistration_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `term` varchar(45) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  PRIMARY KEY (`resgistration_id`),
  KEY `term_idx` (`term`),
  KEY `course_id` (`course_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`idcourses`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `user` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `termname` FOREIGN KEY (`term`) REFERENCES `term` (`term_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered_courses`
--

LOCK TABLES `registered_courses` WRITE;
/*!40000 ALTER TABLE `registered_courses` DISABLE KEYS */;
INSERT INTO `registered_courses` VALUES (7,6009,800016,'Second Summer 2018',3),(8,6010,800016,'Second Summer 2018',3),(9,6011,800016,'Second Summer 2018',3),(10,6013,800016,'Second Summer 2018',3),(11,6014,800016,'Fall 2018',3),(25,6005,800016,'First Summer 2018 ',3),(27,6007,800019,'First Summer 2018',3),(28,6012,800019,'First Summer 2018',3),(31,6008,800019,'First Summer 2018',3),(32,6006,800019,'First Summer 2018',3),(34,6006,800022,'First Summer 2018',3),(35,6012,800022,'First Summer 2018',3),(36,6005,800028,'First Summer 2018 ',3),(37,6008,800028,'First Summer 2018',3),(38,6018,800028,'First Summer 2018',3),(39,6012,800028,'First Summer 2018',3),(42,6017,800033,'First Summer 2018',3),(43,6018,800033,'First Summer 2018',3),(44,6006,800033,'First Summer 2018',3);
/*!40000 ALTER TABLE `registered_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term` (
  `idterm` int(11) NOT NULL AUTO_INCREMENT,
  `term_name` varchar(45) NOT NULL,
  `start_date` varchar(45) DEFAULT NULL,
  `end_date` varchar(45) DEFAULT NULL,
  `term_enabled` tinyint(4) DEFAULT NULL,
  `reg_open` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idterm`,`term_name`),
  UNIQUE KEY `term_name_UNIQUE` (`term_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` VALUES (2,'Second Summer 2018','2018-06-24','2018-08-01',1,0),(3,'Fall 2018','2018-08-01','2018-12-30',1,0),(4,'Spring 2018','2018-01-08','2018-05-14',1,1),(5,'First Summer 2018','2018-05-21','2018-06-21',1,1);
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `phonenumber` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `role` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `HashedAndSaltedPassword` varchar(100) DEFAULT NULL,
  `Salt` varchar(45) DEFAULT NULL,
  `profilePhoto` mediumblob,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=800035 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (800026,'Espoir','Tomenou','9874572152','9201 University City Blvd, Charlotte,  NC 82332','Admin','etomenou@uncc.edu','PDDlzUUlll','46ccfa5fabe19ed438194f74802c92dcf7dbdf4765f4044090191f59b51f9e20','jdQIJ5vrkes6LoNCng/rYslcyi/IOoVWoWD4IoyaHGQ=','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0,\0\0\0N�~G\0\0\0tEXtSoftware\0Adobe ImageReadyq\�e<\0\0$iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CS6 (Macintosh)\" xmpMM:InstanceID=\"xmp.iid:845A63C3B63311E28CEBE7A8DD8224E1\" xmpMM:DocumentID=\"xmp.did:845A63C4B63311E28CEBE7A8DD8224E1\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:58941AEAB63211E28CEBE7A8DD8224E1\" stRef:documentID=\"xmp.did:845A63C2B63311E28CEBE7A8DD8224E1\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>r\�q\0\0ePLTE������������\�\�采�������������������\�\�\�\�\�\�������\�\�퓓����������\�\�Ĵ����񘘘���������\�\�Ɋ�����������\�\�\�\�\�߈��\�\�\�\�\�\����\�\�\����\�\�\�\�\�ؒ�����\�\�㭭����������\�\�\�\�\�\�\�\�ϝ�����������������\�\�\�\�\�ǧ��\�\�\�\�\�ﷷ�\�\�\�������������\�\�癙�\�\�ۅ��������\�\�\����\�\�ڌ�����\�\�\�\�\�䵵�\�\��\�\�\�\�\�ח��\�\�֪�����\�\�˻�����������\�\�͹��������\�\�ܔ��\�\�Ր��\�\�\�\�\�ݽ�����������������\�\� �������􀀀���(�\�-\0\0�IDATx\�\�\�gS\�H�a%\�\r���\�9\�KZ\�\�\�㥞\�\�\�U]\�]cK�\�~\�SFH�Q�%�[g1c1c1c10c1c1c1c1c1c10c1c1c1c1c1c10c1c1c1c1c1c10c1c1c1c1c1c1\�r���\�\'m\�}}6\�}}\�mO\�/z�=���\�Q,�\��\�\�\�\�\�\�X\�w\�G\���\�w���c9#-p\�Z&Fs�z;# W��\�H�lq\�i��5\r+W:�z;,\�3	\�{lA#Y\�=S�2\�ƨ�\�*gL�Z����\�\�%ݱܧU�\�SWk,/~���Ŋ�\�o\�BLS�\\�/�\�\�\"A��\�\�)AP�Ͱ�R\\�)��V�!Ț\�j�u��`Kh�5dC\�\�C�`\rX|րXkNk\Z`\r@X\r�ǚ�Bòf�c��g��\�)i,/a�c�6C�5��\�rRv)�*\�\n�\�\nQ�P\�I�\\B	V\"G+5\�c��\n��9,/�+\�\�rS���K+\r*K�\�\�jQ�\�\�E	kԶE+c+Ʋ3t�ʠ�&2X��\�Z���\���V\�B�eݣ��\0Z ��M��Jf)`GE\nXy$XyX���^�X�h�:\�c94X;\�\�i;\�\"�1\�Xn\"�7\�}�\�8n�nTXݸ�\�Qaͣ\�\ZL�b\�\�\0\\=��5�k3\�2�	\�X\�Ȱ\�c962,\���\��<�X�\���bu�\�\����\�^�&tXMx���\�\�ŋՆ�\r/\�$:�I�X}\�\"x�\"�u�ltX6^,�����e�5���}\��S��\�\�gC~\�\�:,\�\��)\�\�w�Z��\�\�^7\�i�XedXe\�X��F\"ޟ%\�`�\���T&ޭ,\�8*�\r\�X���L��\��{G�\�_�\�`\�\�\�\re\�/Y%\�o�e\����� �UD�Eb�O��g\�Ht��I��\0kY�Z\�\�l�_Ƨ3�IJ�V1\�[A�\'\�ʤv�r� ��tjw�\�\�n��\�mj�\����b犬\�	�a���H5�+Г��D\'XN�G\�\�ɞƧ\�\�\�m�����zrf� �\�g�Jŧ�\�\�\�HK����r���\�l	M�\�AЏ���\r����\�\�]��h\r�\�\'\�*�\�N)0��#4\�\�\"�WbN��D.�?\�xNh�%b�W1���\�K\�\���\'��X\�}Z�o\�9\�\n���\��\�~޾\�\n�;���\����&`�qC�K�\\\�_�cF`yk?�\�Ϝ��\�\�5�a�\�5�\�Ӛb\r\�4�~Sz\��hP;,�t,���\�ة�\�fw�\�h�7u�����ek��X�ٰԴ\�\�hc\r�?��\��1=H�V<y�\�q�F+�>S�\�\�,Mq\�ߍ�OZ�7԰\�U\�\�N�S\�\��j��%�5W\�U\�h`\r_����c\�v��\�Đcy���}5V�l��\�W�\0[{�X�g���^�Xo,���\�\�:`m�V&x\�gPa��\0\�\"\�au؀;���\Z��\�E�\�<\n=v`\�v�F�5\�X\�s�\�y�b�J;Щ��k*�\�O)\�jZ��*\�ʾj�\�*\�Zz�z��\�$��(���\n4�::��T[w\�\�*\�J!c��\�	kh7\"\��(q�\�xhX�U�^�5$�\�}�\��t8Xc�Cc�`�A�\�!`����}��8\�\�$\�\�\�R\�XˠO\�c�A�ҁb\r\'�\�J�崁^�9�a=\�zֶ���V\�%\�\�K\'�б�@���ZbE�\0�\�8\�đ�\�\�]\���\�+R�k�m\�g��s|\�r۴\�js�\�zz�\�G�ڱ\�X\�5��\n�{߰~Kh�����U�+���5\0˾�\��P�/XW�Xv\�,3~X\0w|�ڴ\r��7\�ZSZi��4+Yi\��\�Q�X�>���j�au�Iu4�\�\Z�5\�6�\�f5\�֞aX{\r`]Y�aYW�c}\��^7�S5�\�ԋ�\�\�Q�X{b�Z\'֔e �5U\��\�L}X/�\�zX\�*�\�j=XG�bՃ�\�P�ou`m��m\�c=3\�H+o,V^\Z+斑\��d0\�\'Y�k���%��,���.9�!0�!9�N��:\��\�Z�\�\Z���\�0�Gk\�p�����\0\0�Jq �ǁ\0\0\0\0IEND�B`�'),(800027,'Kiran','Korey S','9806616157','University Terrace Drive ','Student','kkorey@uncc.edu','dsSs4S44U4','e45e1f0dd815e1095c933c425c4d5a1b6155052f0ee542b90cebcf1f67e37ed1','YQWu415s5SE3Di5JxVRfrSVBcfA0315kk9WKXbP10Ms=','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0,\0\0\0N�~G\0\0\0tEXtSoftware\0Adobe ImageReadyq\�e<\0\0$iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CS6 (Macintosh)\" xmpMM:InstanceID=\"xmp.iid:845A63C3B63311E28CEBE7A8DD8224E1\" xmpMM:DocumentID=\"xmp.did:845A63C4B63311E28CEBE7A8DD8224E1\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:58941AEAB63211E28CEBE7A8DD8224E1\" stRef:documentID=\"xmp.did:845A63C2B63311E28CEBE7A8DD8224E1\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>r\�q\0\0ePLTE������������\�\�采�������������������\�\�\�\�\�\�������\�\�퓓����������\�\�Ĵ����񘘘���������\�\�Ɋ�����������\�\�\�\�\�߈��\�\�\�\�\�\����\�\�\����\�\�\�\�\�ؒ�����\�\�㭭����������\�\�\�\�\�\�\�\�ϝ�����������������\�\�\�\�\�ǧ��\�\�\�\�\�ﷷ�\�\�\�������������\�\�癙�\�\�ۅ��������\�\�\����\�\�ڌ�����\�\�\�\�\�䵵�\�\��\�\�\�\�\�ח��\�\�֪�����\�\�˻�����������\�\�͹��������\�\�ܔ��\�\�Ր��\�\�\�\�\�ݽ�����������������\�\� �������􀀀���(�\�-\0\0�IDATx\�\�\�gS\�H�a%\�\r���\�9\�KZ\�\�\�㥞\�\�\�U]\�]cK�\�~\�SFH�Q�%�[g1c1c1c10c1c1c1c1c1c10c1c1c1c1c1c10c1c1c1c1c1c10c1c1c1c1c1c1\�r���\�\'m\�}}6\�}}\�mO\�/z�=���\�Q,�\��\�\�\�\�\�\�X\�w\�G\���\�w���c9#-p\�Z&Fs�z;# W��\�H�lq\�i��5\r+W:�z;,\�3	\�{lA#Y\�=S�2\�ƨ�\�*gL�Z����\�\�%ݱܧU�\�SWk,/~���Ŋ�\�o\�BLS�\\�/�\�\�\"A��\�\�)AP�Ͱ�R\\�)��V�!Ț\�j�u��`Kh�5dC\�\�C�`\rX|րXkNk\Z`\r@X\r�ǚ�Bòf�c��g��\�)i,/a�c�6C�5��\�rRv)�*\�\n�\�\nQ�P\�I�\\B	V\"G+5\�c��\n��9,/�+\�\�rS���K+\r*K�\�\�jQ�\�\�E	kԶE+c+Ʋ3t�ʠ�&2X��\�Z���\���V\�B�eݣ��\0Z ��M��Jf)`GE\nXy$XyX���^�X�h�:\�c94X;\�\�i;\�\"�1\�Xn\"�7\�}�\�8n�nTXݸ�\�Qaͣ\�\ZL�b\�\�\0\\=��5�k3\�2�	\�X\�Ȱ\�c962,\���\��<�X�\���bu�\�\����\�^�&tXMx���\�\�ŋՆ�\r/\�$:�I�X}\�\"x�\"�u�ltX6^,�����e�5���}\��S��\�\�gC~\�\�:,\�\��)\�\�w�Z��\�\�^7\�i�XedXe\�X��F\"ޟ%\�`�\���T&ޭ,\�8*�\r\�X���L��\��{G�\�_�\�`\�\�\�\re\�/Y%\�o�e\����� �UD�Eb�O��g\�Ht��I��\0kY�Z\�\�l�_Ƨ3�IJ�V1\�[A�\'\�ʤv�r� ��tjw�\�\�n��\�mj�\����b犬\�	�a���H5�+Г��D\'XN�G\�\�ɞƧ\�\�\�m�����zrf� �\�g�Jŧ�\�\�\�HK����r���\�l	M�\�AЏ���\r����\�\�]��h\r�\�\'\�*�\�N)0��#4\�\�\"�WbN��D.�?\�xNh�%b�W1���\�K\�\���\'��X\�}Z�o\�9\�\n���\��\�~޾\�\n�;���\����&`�qC�K�\\\�_�cF`yk?�\�Ϝ��\�\�5�a�\�5�\�Ӛb\r\�4�~Sz\��hP;,�t,���\�ة�\�fw�\�h�7u�����ek��X�ٰԴ\�\�hc\r�?��\��1=H�V<y�\�q�F+�>S�\�\�,Mq\�ߍ�OZ�7԰\�U\�\�N�S\�\��j��%�5W\�U\�h`\r_����c\�v��\�Đcy���}5V�l��\�W�\0[{�X�g���^�Xo,���\�\�:`m�V&x\�gPa��\0\�\"\�au؀;���\Z��\�E�\�<\n=v`\�v�F�5\�X\�s�\�y�b�J;Щ��k*�\�O)\�jZ��*\�ʾj�\�*\�Zz�z��\�$��(���\n4�::��T[w\�\�*\�J!c��\�	kh7\"\��(q�\�xhX�U�^�5$�\�}�\��t8Xc�Cc�`�A�\�!`����}��8\�\�$\�\�\�R\�XˠO\�c�A�ҁb\r\'�\�J�崁^�9�a=\�zֶ���V\�%\�\�K\'�б�@���ZbE�\0�\�8\�đ�\�\�]\���\�+R�k�m\�g��s|\�r۴\�js�\�zz�\�G�ڱ\�X\�5��\n�{߰~Kh�����U�+���5\0˾�\��P�/XW�Xv\�,3~X\0w|�ڴ\r��7\�ZSZi��4+Yi\��\�Q�X�>���j�au�Iu4�\�\Z�5\�6�\�f5\�֞aX{\r`]Y�aYW�c}\��^7�S5�\�ԋ�\�\�Q�X{b�Z\'֔e �5U\��\�L}X/�\�zX\�*�\�j=XG�bՃ�\�P�ou`m��m\�c=3\�H+o,V^\Z+斑\��d0\�\'Y�k���%��,���.9�!0�!9�N��:\��\�Z�\�\Z���\�0�Gk\�p�����\0\0�Jq �ǁ\0\0\0\0IEND�B`�'),(800028,'Sarvesh','Mahendale','7086543435','9548 M University Terrace Dr','Student','smehenda@uncc.edu','vWdpOOdIBW','f0583387c484ce6aa03083b0581702de011620c58151e2999e9a648f1d216b83','6KmVgvYjcXuE2GmZyoAVd6nc2jAJ4FhPbO13wgeie88=',NULL),(800032,'Keyur','Kumar','8937575765','UT Charlotte 28262','Student','keyurkumar@gmail.com','Ru!L^-*^-%','efed18f1b03a1e10d7e3c64f3518cbad0d2cd4b487f7676c026ceef3a0f4fed4','DrXarByuh5/dZtEsnUOfVnOdpKGMIlFeLO8mD49jO0M=',NULL);
INSERT INTO `user` VALUES (800034,'Venky','Hegde','9803180153','University','Student','venky.suh@gmail.com','1%-G%!G%*G','598fbc6a63f8a6994bdf8cfe031b7a9f9dd3f82f1733aaead910c74f0128fdc9','lJzN3cbnQDq0roLrFlQ3DAsm7fzDaCI5Kyheymqs7rk=',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-03 12:42:34