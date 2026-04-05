DECLARE @SID char(8)
SET @SET='00000000'

DECLARE @IND_IDN int
SET @IND_IDN = (SELECT IND_IDN FROM INDV  WHERE DPS_NBR = @SID )

SELECT  *
FROM  INDV    
WHERE IND_IDN = @IND_IDN

SELECT  * 
FROM    PERSON  
WHERE   IND_IDN = @IND_IDN

SELECT  n.* FROM NAME n 
          INNER JOIN PERSON p ON n.PER_IDN = p.PER_IDN 
WHERE   p.IND_IDN = @IND_IDN

SELECT  n.* FROM BRTHDATE  n 
          INNER JOIN PERSON p ON n.PER_IDN = p.PER_IDN 
WHERE   p.IND_IDN = @IND_IDN

SELECT  * FROM INDV_SOR           WHERE IND_IDN = @IND_IDN

SELECT  * FROM Offense            WHERE IND_IDN = @IND_IDN

SELECT  * FROM MedicalCondition            WHERE IND_IDN = @IND_IDN

SELECT  * FROM RegistrationEvent  WHERE IND_IDN = @IND_IDN

SELECT  * 
FROM    AddressEvent ae 
    LEFT OUTER JOIN Address a 
          ON ae.AddressID = a.AddressID  
WHERE   ae.IND_IDN = @IND_IDN

SELECT  * 
FROM    EducationEvent  ae 
          LEFT OUTER JOIN Education a ON ae.EducationID = a.EducationID  
WHERE   ae.IND_IDN = @IND_IDN

SELECT  * 
FROM    OccupationalLicenseEvent ae 
          LEFT OUTER JOIN OccupationalLicense a ON ae.LicenseID = a.LicenseID  
WHERE   ae.IND_IDN = @IND_IDN

SELECT  * 
FROM  OccupationEvent  ae 
        LEFT OUTER JOIN Occupation a ON ae.OccupationID = a.OccupationID  
WHERE   ae.IND_IDN = @IND_IDN

SELECT  * 
FROM  RelativeEvent  ae 
        LEFT OUTER JOIN Relative a ON ae.RelativeID = a.RelativeID  
WHERE   ae.IND_IDN = @IND_IDN

SELECT  * 
FROM  DriversLicenseEvent  ae 
        LEFT OUTER JOIN DriversLicense a ON ae.DriversLicenseID = a.DriversLicenseID  
WHERE   ae.IND_IDN = @IND_IDN

SELECT  * 
FROM  EmailEvent  ae 
        LEFT OUTER JOIN Email a ON ae.EmailID = a.EmailID  
WHERE   ae.IND_IDN = @IND_IDN

SELECT  * 
FROM  TelephoneEvent  ae 
        LEFT OUTER JOIN Telephone a ON ae.TelephoneID = a.TelephoneID  
WHERE   ae.IND_IDN = @IND_IDN

SELECT  * 
FROM  InternetIdentifierEvent  ae 
        LEFT OUTER JOIN InternetIdentifier a ON ae.InternetIdentifierID = a.InternetIdentifierID  
WHERE   ae.IND_IDN = @IND_IDN

SELECT  * 
FROM    Photo 
WHERE   IND_IDN = @IND_IDN
