-- MySQL dump 10.13  Distrib 5.1.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gofiguredatabase
-- ------------------------------------------------------
-- Server version	5.1.58-1ubuntu1

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `AuthorID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `MiddleName` varchar(45) NOT NULL DEFAULT '<none>',
  PRIMARY KEY (`AuthorID`),
  UNIQUE KEY `UniqueAuthor` (`LastName`,`FirstName`,`MiddleName`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Rannou','Nicolas','PM');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmark` (
  `BookmarkID` int(11) NOT NULL AUTO_INCREMENT,
  `ImagingSessionID` int(11) NOT NULL,
  `CoordID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `CreationDate` datetime NOT NULL,
  PRIMARY KEY (`BookmarkID`),
  KEY `FK_Bookmark_ImagingSessionID` (`ImagingSessionID`),
  KEY `FK_Bookmark_CoordID` (`CoordID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmark`
--

LOCK TABLES `bookmark` WRITE;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculatedvalue`
--

DROP TABLE IF EXISTS `calculatedvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calculatedvalue` (
  `CalculatedValueID` int(11) NOT NULL AUTO_INCREMENT,
  `ValueTypeID` int(11) NOT NULL,
  PRIMARY KEY (`CalculatedValueID`),
  KEY `FK_CalculatedValue_ValueTypeID` (`ValueTypeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculatedvalue`
--

LOCK TABLES `calculatedvalue` WRITE;
/*!40000 ALTER TABLE `calculatedvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `calculatedvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celltype`
--

DROP TABLE IF EXISTS `celltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celltype` (
  `CellTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`CellTypeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celltype`
--

LOCK TABLES `celltype` WRITE;
/*!40000 ALTER TABLE `celltype` DISABLE KEYS */;
/*!40000 ALTER TABLE `celltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `ChannelID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `ImagingSessionID` int(11) NOT NULL,
  `ColorID` int(11) NOT NULL,
  `ChannelNumber` int(11) NOT NULL,
  `NumberOfBits` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ChannelID`),
  UNIQUE KEY `UniqueChannel` (`ImagingSessionID`,`ChannelNumber`),
  KEY `FK_Channel_ColorID` (`ColorID`),
  KEY `FK_Channel_ImagingSessionID` (`ImagingSessionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `ColorID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Red` tinyint(3) unsigned NOT NULL,
  `Green` tinyint(3) unsigned NOT NULL,
  `Blue` tinyint(3) unsigned NOT NULL,
  `Alpha` tinyint(3) unsigned NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ColorID`),
  UNIQUE KEY `UniqueColor` (`Red`,`Green`,`Blue`,`Alpha`,`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contour`
--

DROP TABLE IF EXISTS `contour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contour` (
  `ContourID` int(11) NOT NULL AUTO_INCREMENT,
  `MeshID` int(11) DEFAULT NULL,
  `ImagingSessionID` int(11) DEFAULT NULL,
  `ColorID` int(11) DEFAULT NULL,
  `CoordIDMax` int(11) NOT NULL,
  `CoordIDMin` int(11) NOT NULL,
  `Points` longtext NOT NULL,
  PRIMARY KEY (`ContourID`),
  KEY `FK_Contour_MeshID` (`MeshID`),
  KEY `FK_Contour_CoordIDMax` (`CoordIDMax`),
  KEY `FK_Contour_CoordIDMin` (`CoordIDMin`),
  KEY `FK_Contour_ImagingSessionID` (`ImagingSessionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contour`
--

LOCK TABLES `contour` WRITE;
/*!40000 ALTER TABLE `contour` DISABLE KEYS */;
/*!40000 ALTER TABLE `contour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contourvalue`
--

DROP TABLE IF EXISTS `contourvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contourvalue` (
  `ContourID` int(11) NOT NULL,
  `CalculatedValueID` int(11) NOT NULL,
  PRIMARY KEY (`ContourID`,`CalculatedValueID`),
  KEY `FK_ContourValue_ContourID` (`ContourID`),
  KEY `FK_ContourValue_CalculatedValueID` (`CalculatedValueID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contourvalue`
--

LOCK TABLES `contourvalue` WRITE;
/*!40000 ALTER TABLE `contourvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `contourvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinate`
--

DROP TABLE IF EXISTS `coordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinate` (
  `CoordID` int(11) NOT NULL AUTO_INCREMENT,
  `PCoord` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RCoord` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CCoord` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `XTileCoord` smallint(5) unsigned NOT NULL DEFAULT '0',
  `YTileCoord` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ZTileCoord` smallint(5) unsigned NOT NULL DEFAULT '0',
  `XCoord` float unsigned NOT NULL DEFAULT '0',
  `YCoord` float unsigned NOT NULL DEFAULT '0',
  `ZCoord` float unsigned NOT NULL DEFAULT '0',
  `TCoord` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CoordID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinate`
--

LOCK TABLES `coordinate` WRITE;
/*!40000 ALTER TABLE `coordinate` DISABLE KEYS */;
/*!40000 ALTER TABLE `coordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `ImageID` int(11) NOT NULL AUTO_INCREMENT,
  `ImagingSessionID` int(11) NOT NULL,
  `CoordIDMin` int(11) NOT NULL,
  `Filename` text NOT NULL,
  `ChannelID` int(11) NOT NULL,
  PRIMARY KEY (`ImageID`),
  KEY `FK_Image_ImagingSessionID` (`ImagingSessionID`),
  KEY `FK_Image_CoordIDMin` (`CoordIDMin`),
  KEY `FK_Image_ChannelID` (`ChannelID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagevalue`
--

DROP TABLE IF EXISTS `imagevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagevalue` (
  `ImageID` int(11) NOT NULL,
  `CalculatedValueID` int(11) NOT NULL,
  PRIMARY KEY (`ImageID`,`CalculatedValueID`),
  KEY `FK_ImageValue_ImageID` (`ImageID`),
  KEY `FK_ImageValue_CalculatedValueID` (`CalculatedValueID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagevalue`
--

LOCK TABLES `imagevalue` WRITE;
/*!40000 ALTER TABLE `imagevalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagingsession`
--

DROP TABLE IF EXISTS `imagingsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagingsession` (
  `ImagingSessionID` int(11) NOT NULL AUTO_INCREMENT,
  `CoordIDMax` int(11) NOT NULL DEFAULT '0',
  `CoordIDMin` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(255) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `ImagesTimeInterval` float unsigned DEFAULT NULL,
  `RealPixelDepth` float unsigned DEFAULT NULL,
  `RealPixelHeight` float unsigned DEFAULT NULL,
  `RealPixelWidth` float unsigned DEFAULT NULL,
  `ProjectName` varchar(255) NOT NULL,
  `MicroscopeName` varchar(255) NOT NULL,
  `CreationDate` datetime NOT NULL,
  `XImageSize` int(11) NOT NULL,
  `YImageSize` int(11) NOT NULL,
  `XTileOverlap` float unsigned DEFAULT '0',
  `YTileOverlap` float unsigned DEFAULT '0',
  `ZTileOverlap` float unsigned DEFAULT '0',
  PRIMARY KEY (`ImagingSessionID`),
  UNIQUE KEY `UniqueImagingSession` (`MicroscopeName`,`CreationDate`),
  KEY `FK_ImagingSession_CoordIDMax` (`CoordIDMax`),
  KEY `FK_ImagingSession_CoordIDMin` (`CoordIDMin`),
  KEY `FK_ImagingSession_ProjectName` (`ProjectName`),
  KEY `FK_ImagingSession_MicroscopeName` (`MicroscopeName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagingsession`
--

LOCK TABLES `imagingsession` WRITE;
/*!40000 ALTER TABLE `imagingsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagingsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagingsessionvalue`
--

DROP TABLE IF EXISTS `imagingsessionvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagingsessionvalue` (
  `ImagingSessionID` int(11) NOT NULL,
  `CalculatedValueID` int(11) NOT NULL,
  PRIMARY KEY (`ImagingSessionID`,`CalculatedValueID`),
  KEY `ImagingSessionID` (`ImagingSessionID`),
  KEY `CalculatedValueID` (`CalculatedValueID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagingsessionvalue`
--

LOCK TABLES `imagingsessionvalue` WRITE;
/*!40000 ALTER TABLE `imagingsessionvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagingsessionvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intensity`
--

DROP TABLE IF EXISTS `intensity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intensity` (
  `IntensityID` int(11) NOT NULL AUTO_INCREMENT,
  `Value` int(11) NOT NULL,
  `MeshID` int(11) NOT NULL,
  `ChannelID` int(11) NOT NULL,
  PRIMARY KEY (`IntensityID`),
  KEY `FK_Intensity_MeshID` (`MeshID`),
  KEY `FK_Intensity_ChannelID` (`ChannelID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intensity`
--

LOCK TABLES `intensity` WRITE;
/*!40000 ALTER TABLE `intensity` DISABLE KEYS */;
/*!40000 ALTER TABLE `intensity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineage`
--

DROP TABLE IF EXISTS `lineage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineage` (
  `LineageID` int(11) NOT NULL AUTO_INCREMENT,
  `CoordIDMax` int(11) NOT NULL,
  `CoordIDMin` int(11) NOT NULL,
  `ColorID` int(11) NOT NULL DEFAULT '3',
  `Points` longtext NOT NULL,
  `TrackIDRoot` int(11) NOT NULL,
  `ImagingSessionID` int(11) NOT NULL,
  PRIMARY KEY (`LineageID`),
  KEY `FK_Lineage_CoordIDMax` (`CoordIDMax`),
  KEY `FK_Lineage_CoordIDMin` (`CoordIDMin`),
  KEY `FK_Lineage_ColorID` (`ColorID`),
  KEY `FK_Lineage_TrackIDRoot` (`TrackIDRoot`),
  KEY `FK_Lineage_ImagingSessionID` (`ImagingSessionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineage`
--

LOCK TABLES `lineage` WRITE;
/*!40000 ALTER TABLE `lineage` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineagevalue`
--

DROP TABLE IF EXISTS `lineagevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineagevalue` (
  `LineageID` int(11) NOT NULL,
  `CalculatedValueID` int(11) NOT NULL,
  PRIMARY KEY (`LineageID`,`CalculatedValueID`),
  KEY `FK_LineageValue_LineageID` (`LineageID`),
  KEY `FK_LineageValue_CalculatedValueID` (`CalculatedValueID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineagevalue`
--

LOCK TABLES `lineagevalue` WRITE;
/*!40000 ALTER TABLE `lineagevalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineagevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesh`
--

DROP TABLE IF EXISTS `mesh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesh` (
  `MeshID` int(11) NOT NULL AUTO_INCREMENT,
  `CellTypeID` int(11) NOT NULL DEFAULT '1',
  `SubCellularID` int(11) NOT NULL DEFAULT '1',
  `CoordIDMax` int(11) NOT NULL,
  `CoordIDMin` int(11) NOT NULL,
  `ColorID` int(11) NOT NULL DEFAULT '1',
  `TrackID` int(11) DEFAULT NULL,
  `ImagingSessionID` int(11) NOT NULL,
  `Points` longtext,
  PRIMARY KEY (`MeshID`),
  KEY `FK_Mesh_CellTypeID` (`CellTypeID`),
  KEY `FK_Mesh_CoordIDMax` (`CoordIDMax`),
  KEY `FK_Mesh_CoordIDMin` (`CoordIDMin`),
  KEY `FK_Mesh_ColorID` (`ColorID`),
  KEY `FK_Mesh_TrackID` (`TrackID`),
  KEY `FK_Mesh_ImagingSessionID` (`ImagingSessionID`),
  KEY `FK_Mesh_SubCellularID` (`SubCellularID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesh`
--

LOCK TABLES `mesh` WRITE;
/*!40000 ALTER TABLE `mesh` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meshvalue`
--

DROP TABLE IF EXISTS `meshvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meshvalue` (
  `CalculatedValueID` int(11) NOT NULL,
  `MeshID` int(11) NOT NULL,
  PRIMARY KEY (`CalculatedValueID`,`MeshID`),
  KEY `FK_MeshValue_MeshID` (`MeshID`),
  KEY `FK_MeshValue_CalculatedValueID` (`CalculatedValueID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meshvalue`
--

LOCK TABLES `meshvalue` WRITE;
/*!40000 ALTER TABLE `meshvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `meshvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microscope`
--

DROP TABLE IF EXISTS `microscope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microscope` (
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microscope`
--

LOCK TABLES `microscope` WRITE;
/*!40000 ALTER TABLE `microscope` DISABLE KEYS */;
INSERT INTO `microscope` VALUES ('Bubble');
/*!40000 ALTER TABLE `microscope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `Name` varchar(255) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `AuthorID` int(11) NOT NULL,
  `CreationDate` date NOT NULL,
  `DatabaseVersion` varchar(45) NOT NULL,
  PRIMARY KEY (`Name`),
  KEY `FK_Project_AuthorID` (`AuthorID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcellulartype`
--

DROP TABLE IF EXISTS `subcellulartype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcellulartype` (
  `SubCellularID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`SubCellularID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcellulartype`
--

LOCK TABLES `subcellulartype` WRITE;
/*!40000 ALTER TABLE `subcellulartype` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcellulartype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track` (
  `TrackID` int(11) NOT NULL AUTO_INCREMENT,
  `LineageID` int(11) DEFAULT NULL,
  `ColorID` int(11) NOT NULL DEFAULT '2',
  `CoordIDMax` int(11) NOT NULL,
  `CoordIDMin` int(11) NOT NULL,
  `TrackFamilyID` int(11) DEFAULT NULL,
  `Points` longtext,
  `ImagingSessionID` int(11) NOT NULL,
  PRIMARY KEY (`TrackID`),
  KEY `FK_Track_ColorID` (`ColorID`),
  KEY `FK_Track_LineageID` (`LineageID`),
  KEY `FK_Track_CoordIDMax` (`CoordIDMax`),
  KEY `FK_Track_CoordIDMin` (`CoordIDMin`),
  KEY `FK_Track_TrackFamilyID` (`TrackFamilyID`),
  KEY `FK_Track_ImagingSessionID` (`ImagingSessionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackfamily`
--

DROP TABLE IF EXISTS `trackfamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackfamily` (
  `TrackFamilyID` int(11) NOT NULL AUTO_INCREMENT,
  `TrackIDMother` int(11) NOT NULL,
  `TrackIDDaughter1` int(11) NOT NULL,
  `TrackIDDaughter2` int(11) NOT NULL,
  PRIMARY KEY (`TrackFamilyID`),
  KEY `FK_TrackFamily_TrackIDMother` (`TrackIDMother`),
  KEY `FK_TrackFamily_TrackIDDaughter1` (`TrackIDDaughter1`),
  KEY `FK_TrackFamily_TrackIDDaughter2` (`TrackIDDaughter2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackfamily`
--

LOCK TABLES `trackfamily` WRITE;
/*!40000 ALTER TABLE `trackfamily` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackfamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackvalue`
--

DROP TABLE IF EXISTS `trackvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackvalue` (
  `TrackID` int(11) NOT NULL,
  `CalculatedValueID` int(11) NOT NULL,
  PRIMARY KEY (`TrackID`,`CalculatedValueID`),
  KEY `FK_TrackValue_TrackID` (`TrackID`),
  KEY `CalculatedValueID` (`CalculatedValueID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackvalue`
--

LOCK TABLES `trackvalue` WRITE;
/*!40000 ALTER TABLE `trackvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuepervectorcoord`
--

DROP TABLE IF EXISTS `valuepervectorcoord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuepervectorcoord` (
  `ValuePerVectorCoordID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `VectorCoordNumber` int(11) NOT NULL,
  `Value` decimal(3,0) NOT NULL,
  `CalculatedValueID` int(11) NOT NULL,
  PRIMARY KEY (`ValuePerVectorCoordID`),
  KEY `FK_ValuePerVectorCoord_CalculatedValueID` (`CalculatedValueID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuepervectorcoord`
--

LOCK TABLES `valuepervectorcoord` WRITE;
/*!40000 ALTER TABLE `valuepervectorcoord` DISABLE KEYS */;
/*!40000 ALTER TABLE `valuepervectorcoord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuetype`
--

DROP TABLE IF EXISTS `valuetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuetype` (
  `ValueTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ValueTypeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuetype`
--

LOCK TABLES `valuetype` WRITE;
/*!40000 ALTER TABLE `valuetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `valuetype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-11-07 16:40:08
