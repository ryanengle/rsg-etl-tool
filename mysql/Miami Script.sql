CREATE SCHEMA UMiami;
USE UMiami;

DROP TABLE Location;
DROP TABLE SensorData;

CREATE TABLE Location
             (LocationID          INTEGER     NOT NULL,
	          LocationName        VARCHAR(25)     NOT NULL,
UNIQUE KEY (LocationName),
CONSTRAINT Location_PK PRIMARY KEY (LocationID));

CREATE TABLE SensorData
			(LocationName		VARCHAR(25) NOT NULL,
            ODate Date NOT NULL,
            OTime VARCHAR(25) NOT NULL,
            60cmTair DEC(10,2),
            2mTair DEC(10,2),
            10mTair DEC(10,2),
            Neg10cmTsoil DEC(10,2),
            2mDewPt DEC(10,2),
            2mRelHum DEC(10,2),
            2mRain DEC(10,2),
            2mSolRad DEC(10,2),
            10mWind DEC(10,2),
            10mWindMin DEC(10,2),
            10mWindMax DEC(10,2),
            10mWDir DEC(10,2),
            BP DEC(10,2),
            2mWetBulb DEC(10,2),
	CONSTRAINT SensorData_PK primary key(LocationName, ODate, OTime),
    CONSTRAINT SensorData_FK1 foreign key(LocationName) references Location(LocationName));
       
INSERT INTO Location (LocationID, LocationName) VALUES (1, 'Fort Lauderdale');
INSERT INTO Location (LocationID, LocationName) VALUES (2, 'Homestead');
INSERT INTO Location (LocationID, LocationName) VALUES (3, 'Okeechobee');
INSERT INTO Location (LocationID, LocationName) VALUES (4, 'Avalon');

# Before this step, check what the "secure-file-priv" setting is.  Do this by
# clicking ont he Server tab, then on the "status and system variables" tab, 
# then on "system variables", then scroll down to see the secure-file-priv setting.
# Make sure the files to be loaded are all located in this directory.
# Also, make sure MySQL is not in strict mode otherwise there may be a problem
# with MySQL assignin a 0 instead of a NULL value for actual missing data.
# Use the next three lines of code to check and if neccessary change the from strict mode.

SHOW Variables like 'sql_mode';
SET @@global.sql_mode="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";
#SET @@global.sql_mode="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION”;

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2007/FAWN_report (1).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

# checks to make sure the daa loaded....note the time is probably there but doesnt increment like expected
SELECT * FROM Sensordata limit 100;


LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2007/FAWN_report (2).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2007/FAWN_report (3).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2007/FAWN_report (4).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');


LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2007/FAWN_report (5).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2007/FAWN_report.csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2007/FAWN_report.csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2007/FAWN_report (1).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2007/FAWN_report (2).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2007/FAWN_report (3).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2007/FAWN_report (4).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2007/FAWN_report (5).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2007/FAWN_report.csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2007/FAWN_report (1).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2007/FAWN_report (2).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2007/FAWN_report (3).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2007/FAWN_report (4).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2007/FAWN_report (5).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2007/FAWN_report (6).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2007/FAWN_report (7).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2007/FAWN_report (8).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2007/FAWN_report (9).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2007/FAWN_report (10).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2008/FAWN_report (1).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2008/FAWN_report (2).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2008/FAWN_report (4).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2008/FAWN_report (5).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');


LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2008/FAWN_report (6).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2008/FAWN_report.csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2008/FAWN_report.csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2008/FAWN_report (1).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2008/FAWN_report (2).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2008/FAWN_report (3).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2008/FAWN_report (4).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2008/FAWN_report (5).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report.csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report (1).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report (2).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report (3).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report (4).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report (5).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report (6).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report (7).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report (8).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report (9).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report (10).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2008/FAWN_report (11).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2009/FAWN_report (1).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2009/FAWN_report (2).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2009/FAWN_report (3).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2009/FAWN_report (4).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2009/FAWN_report (5).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Fort Lauderdale/2009/FAWN_report.csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2009/FAWN_report.csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2009/FAWN_report (1).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2009/FAWN_report (2).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2009/FAWN_report (3).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2009/FAWN_report (4).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Homestead/2009/FAWN_report (5).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report.csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report (1).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report (2).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report (3).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report (4).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report (5).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report (6).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report (7).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report (8).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report (9).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report (10).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

LOAD DATA INFILE  
'C:/Temp/MiamiWeather1/Okeechobee _ Avalon/2009/FAWN_report (11).csv'
IGNORE INTO TABLE sensordata
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(LocationName, @ODate, OTime, @60cmTair, @2mTair, @10mTair, @Neg10cmTsoil, @2mDewPt, @2mRelHum, @2mRain, @2mSolRad, @10mWind, @10mWindMin, @10mWindMax, @10mWDir, @BP, @2mWetBulb)
SET ODate = STR_TO_DATE(@ODate, '%b %e %Y'),
60cmTair = nullif(@60cmTair,' '),
2mTair = nullif(@2mTair,' '),
10mTair = nullif(@10mTair,' '),
Neg10cmTsoil = nullif(@Neg10cmTsoil,' '),
2mDewPt = nullif(@2mDewPt, ' '),
2mRelHum = nullif(@2mRelHum,' '),
2mRain = nullif(@2mRain,' '),
2mSolRad = nullif(@2mSolRad,' '),
10mWind = nullif(@10mWind,' '),
10mWindMin = nullif(@10mWindMin,' '),
10mWindMax = nullif(@10mWindMax,' '),
10mWDir = nullif(@10mWDir,' '),
BP = nullif(@BP,' '),
2mWetBulb = nullif(@2mWetBulb,' ');

Describe SensorData;

Select * FROM SensorData;

Select Count(*) from SensorData 
WHERE LocationName = "Okeechobee";

Select * from SensorData 
WHERE LocationName = "Fort Lauderdale"
AND 2mDewPt > 66;

# Query 1: Output a matrix for each station for all day(s) in the year that show the least 
# variance in solar radiation, 10m wind and 2m rel humidity.  Out: [356 * # years]

# Lists all Variance for each location every day
SELECT LocationName, Date_Format(ODate, '%d-%m-%Y') AS Dates, Variance(2mSolRad) AS SolarRadVar, Variance(10mWind) AS WindVar, Variance(2mRelHum) AS RelHumVar
FROM sensordata
GROUP BY LocationName, ODate
#INTO OUTFILE 'C:/Temp/LocationVariance.csv' 
#FIELDS ENCLOSED BY '"' 
#TERMINATED BY ';' 
#ESCAPED BY '"' 
#LINES TERMINATED BY '\r\n'
;

# Calculates the location with the minimun daily Variance for Solar Radiation, 10m Wind Variance, Relative Humidity Variance
SELECT LocationName, Date_Format(ODate, '%d-%m-%Y') AS Dates, Min(SolRadVar), Min(WindVar), Min(RelHumVar)
FROM 
	(SELECT LocationName, ODate, Variance(2mSolRad) AS SolRadVar, Variance(10mWind) AS WindVar, Variance(2mRelHum) AS RelHumVar
	FROM sensordata
	GROUP BY LocationName, ODate) MinVars
GROUP BY LocationName, MOnth(ODate), Year(ODate)
#INTO OUTFILE 'C:/Temp/MinSolRadVar.csv' 
#FIELDS ENCLOSED BY '"' 
#TERMINATED BY ';' 
#ESCAPED BY '"' 
#LINES TERMINATED BY '\r\n'
;

# Query 2: Using the matrix from 1.) Select the day (1/season) with the highest min variance (assuming not frequency) 
# in each year, then select the day with the highest min variance (assuming not frequency) for all years. Out: [4 * 1]

# Next sequence of code adds a column called seasons and conditionally populates it based on month
ALTER Table sensordata 
ADD COLUMN season VARCHAR (25) AFTER OTime;

DESC Sensordata;

UPDATE sensordata SET season = 'winter' WHERE date_format(ODate, '%m') = '01';
UPDATE sensordata SET season = 'winter' WHERE date_format(ODate, '%m') = '02';
UPDATE sensordata SET season = 'winter' WHERE date_format(ODate, '%m') = '12';
UPDATE sensordata SET season = 'spring' WHERE date_format(ODate, '%m') = '03';
UPDATE sensordata SET season = 'spring' WHERE date_format(ODate, '%m') = '04';
UPDATE sensordata SET season = 'spring' WHERE date_format(ODate, '%m') = '05';
UPDATE sensordata SET season = 'summer' WHERE date_format(ODate, '%m') = '06';
UPDATE sensordata SET season = 'summer' WHERE date_format(ODate, '%m') = '07';
UPDATE sensordata SET season = 'summer' WHERE date_format(ODate, '%m') = '08';
UPDATE sensordata SET season = 'fall' WHERE date_format(ODate, '%m') = '09';
UPDATE sensordata SET season = 'fall' WHERE date_format(ODate, '%m') = '10';
UPDATE sensordata SET season = 'fall' WHERE date_format(ODate, '%m') = '11';

SELECT * 
FROM sensordata
WHERE season = 'summer';

# Code selects the single Max of the min values by month and year
SELECT LocationName, Date_Format(ODate, '%d-%m-%Y') AS Dates, Max(MinSolRadVar), Max(MinWindVar), Max(MinRelHumVar)
FROM
(SELECT LocationName, ODate, Min(SolRadVar) AS MinSolRadVar, Min(WindVar) AS MinWindVar, Min(RelHumVar) AS MinRelHumVar
FROM 
	(SELECT LocationName, ODate, Variance(2mSolRad) AS SolRadVar, Variance(10mWind) AS WindVar, Variance(2mRelHum) AS RelHumVar
	FROM sensordata
	GROUP BY LocationName, ODate) Variances
GROUP BY LocationName, ODate) MinVars
GROUP BY LocationName, Month(ODate), Year(ODate)
;

# Code selects the single Max by season by location
SELECT LocationName, season, Max(MinSolRadVar), Max(MinWindVar), Max(MinRelHumVar)
FROM
(SELECT LocationName, ODate, season, Min(SolRadVar) AS MinSolRadVar, Min(WindVar) AS MinWindVar, Min(RelHumVar) AS MinRelHumVar
FROM 
	(SELECT LocationName, ODate, season, Variance(2mSolRad) AS SolRadVar, Variance(10mWind) AS WindVar, Variance(2mRelHum) AS RelHumVar
	FROM sensordata
	GROUP BY LocationName, ODate) Variances
GROUP BY LocationName, ODate) MinVars
GROUP BY LocationName, season
;

# Query 3: Which 2 hours/day have the highest change in solar, 10m wind and rel humidity for all days and years 
# at each station; where 2nd hour occurs after 1st. Out: ( station: 1st, 2nd)

DESC sensordata;
SELECT LocationName, ODate, OTime, 2mSolRad, 10mWind, 2mRelHum
FROM sensordata
 


# Query 4: What is the percent of ‘null’ values by each sensor for all days and years at each  
# station?  Out: [days*year], [years*station], (station, total null %)   

# Following code calculates # of Nulls per sensor over all years
SELECT 
	LocationName,
	COUNT(60cmTair) 60cmTair_not_null, 
    COUNT(*) - COUNT(60cmTair) 60cmTair_null, 
    (COUNT(*) - COUNT(60cmTair)) / COUNT(*) 60cmTair_Pernull, 
	COUNT(2mTair) 2mTair_not_null, 
    COUNT(*) - COUNT(2mTair) 2mTair_null, 
    (COUNT(*) - COUNT(2mTair)) / COUNT(*) 2mTair_Pernull, 
    COUNT(10mTair) 10mTair_not_null, 
    COUNT(*) - COUNT(10mTair) 10mTair_null, 
    (COUNT(*) - COUNT(10mTair)) / COUNT(*) 10mTair_Pernull, 
	COUNT(Neg10cmTsoil) Neg10cmTsoil_not_null, 
    COUNT(*) - COUNT(Neg10cmTsoil) Neg10cmTsoil_null, 
    (COUNT(*) - COUNT(Neg10cmTsoil)) / COUNT(*) Neg10cmTsoil_Pernull, 
    COUNT(2mDewPt) 2mDewPt_not_null, 
    COUNT(*) - COUNT(2mDewPt) 2mDewPt_null, 
    (COUNT(*) - COUNT(2mDewPt)) / COUNT(*) 2mDewPt_Pernull, 
    COUNT(2mRelHum) 2mRelHum_not_null, 
    COUNT(*) - COUNT(2mRelHum) 2mRelHum_null, 
    (COUNT(*) - COUNT(2mRelHum)) / COUNT(*) 2mRelHum_Pernull, 
    COUNT(2mRain) 2mRain_not_null, 
    COUNT(*) - COUNT(2mRain) 2mRain_null, 
    (COUNT(*) - COUNT(2mRain)) / COUNT(*) 2mRain_Pernull, 
    COUNT(2mSolRad) 2mSolRad_not_null, 
    COUNT(*) - COUNT(2mSolRad) 2mSolRad_null, 
    (COUNT(*) - COUNT(2mSolRad)) / COUNT(*) 2mSolRad_Pernull, 
    COUNT(10mWind) 10mWind_not_null, 
    COUNT(*) - COUNT(10mWind) 10mWind_null,
    (COUNT(*) - COUNT(10mWind)) / COUNT(*) 10mWind_Pernull, 
    COUNT(10mWindMin) 10mWindMin_not_null, 
    COUNT(*) - COUNT(10mWindMin) 10mWindMin_null, 
    (COUNT(*) - COUNT(10mWindMin)) / COUNT(*) 10mWindMin_Pernull, 
    COUNT(10mWindMax) 10mWindMax_not_null,
    COUNT(*) - COUNT(10mWindMax) 10mWindMax_null,
    (COUNT(*) - COUNT(10mWindMax)) / COUNT(*) 10mWindMax_Pernull,
    COUNT(10mWDir) 10mWDir_not_null, 
    COUNT(*) - COUNT(10mWDir) 10mWDir_null,
    (COUNT(*) - COUNT(10mWDir)) / COUNT(*) 10mWDir_Pernull,
    COUNT(BP) BP_not_null, 
    COUNT(*) - COUNT(BP) BP_null, 
    (COUNT(*) - COUNT(BP)) / COUNT(*) BP_Pernull,
    COUNT(2mWetBulb) 2mWetBulb_not_null, 
    COUNT(*) - COUNT(2mWetBulb) 2mWetBulb_null, 
    (COUNT(*) - COUNT(2mWetBulb)) / COUNT(*) 2mWetBulb_Pernull 
FROM sensordata
GROUP by LocationName;

# The following code will calculate the percentage of nulls for each station by day, month, year
# In order to calculate by day, change %d as Days
# In order to calculate by month, change %m as Months
# In order to calculate by year, change %Y as Years
SELECT 
	LocationName,
    Date_format(ODate, '%m-%Y') AS MonthsYears,
	COUNT(60cmTair) 60cmTair_not_null, 
    COUNT(*) - COUNT(60cmTair) 60cmTair_null, 
    (COUNT(*) - COUNT(60cmTair)) / COUNT(*) 60cmTair_Pernull, 
	COUNT(2mTair) 2mTair_not_null, 
    COUNT(*) - COUNT(2mTair) 2mTair_null, 
    (COUNT(*) - COUNT(2mTair)) / COUNT(*) 2mTair_Pernull, 
    COUNT(10mTair) 10mTair_not_null, 
    COUNT(*) - COUNT(10mTair) 10mTair_null, 
    (COUNT(*) - COUNT(10mTair)) / COUNT(*) 10mTair_Pernull, 
	COUNT(Neg10cmTsoil) Neg10cmTsoil_not_null, 
    COUNT(*) - COUNT(Neg10cmTsoil) Neg10cmTsoil_null, 
    (COUNT(*) - COUNT(Neg10cmTsoil)) / COUNT(*) Neg10cmTsoil_Pernull, 
    COUNT(2mDewPt) 2mDewPt_not_null, 
    COUNT(*) - COUNT(2mDewPt) 2mDewPt_null, 
    (COUNT(*) - COUNT(2mDewPt)) / COUNT(*) 2mDewPt_Pernull, 
    COUNT(2mRelHum) 2mRelHum_not_null, 
    COUNT(*) - COUNT(2mRelHum) 2mRelHum_null, 
    (COUNT(*) - COUNT(2mRelHum)) / COUNT(*) 2mRelHum_Pernull, 
    COUNT(2mRain) 2mRain_not_null, 
    COUNT(*) - COUNT(2mRain) 2mRain_null, 
    (COUNT(*) - COUNT(2mRain)) / COUNT(*) 2mRain_Pernull, 
    COUNT(2mSolRad) 2mSolRad_not_null, 
    COUNT(*) - COUNT(2mSolRad) 2mSolRad_null, 
    (COUNT(*) - COUNT(2mSolRad)) / COUNT(*) 2mSolRad_Pernull, 
    COUNT(10mWind) 10mWind_not_null, 
    COUNT(*) - COUNT(10mWind) 10mWind_null,
    (COUNT(*) - COUNT(10mWind)) / COUNT(*) 10mWind_Pernull, 
    COUNT(10mWindMin) 10mWindMin_not_null, 
    COUNT(*) - COUNT(10mWindMin) 10mWindMin_null, 
    (COUNT(*) - COUNT(10mWindMin)) / COUNT(*) 10mWindMin_Pernull, 
    COUNT(10mWindMax) 10mWindMax_not_null,
    COUNT(*) - COUNT(10mWindMax) 10mWindMax_null,
    (COUNT(*) - COUNT(10mWindMax)) / COUNT(*) 10mWindMax_Pernull,
    COUNT(10mWDir) 10mWDir_not_null, 
    COUNT(*) - COUNT(10mWDir) 10mWDir_null,
    (COUNT(*) - COUNT(10mWDir)) / COUNT(*) 10mWDir_Pernull,
    COUNT(BP) BP_not_null, 
    COUNT(*) - COUNT(BP) BP_null, 
    (COUNT(*) - COUNT(BP)) / COUNT(*) BP_Pernull,
    COUNT(2mWetBulb) 2mWetBulb_not_null, 
    COUNT(*) - COUNT(2mWetBulb) 2mWetBulb_null, 
    (COUNT(*) - COUNT(2mWetBulb)) / COUNT(*) 2mWetBulb_Pernull 
FROM sensordata
GROUP by LocationName, Year(ODate), Month(ODate);  # change Year/Month/Day to group by desired time period
