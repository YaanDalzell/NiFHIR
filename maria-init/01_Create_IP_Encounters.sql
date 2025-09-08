CREATE DATABASE IF NOT EXISTS `IP_PRELND`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `IP_PRELND`;

DROP TABLE IF EXISTS IP_LND_Encounters;

CREATE TABLE IF NOT EXISTS IP_LND_Encounters (
  EncounterID INT PRIMARY KEY,
  EffectiveFromDateTime nvarchar(255),
    EffectiveToDateTime nvarchar(255)
);