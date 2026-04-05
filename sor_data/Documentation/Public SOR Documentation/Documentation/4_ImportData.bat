set dataFolder=.\TX_SOR
set formatFolder=.\SqlBcpFormatFiles

@ECHO OFF
cls

set /p s=SQL Server: 
set /p u=SQL Usr: 
set /p p=SQL Pwd: 

echo Importing Data...

bcp TX_SOR.dbo.TableFields		  in %dataFolder%\TableFields.txt		 -f %formatFolder%\TableFields.xml		 -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.INDV               in %dataFolder%\INDV.txt               -f %formatFolder%\INDV.xml                -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.PERSON             in %dataFolder%\PERSON.txt             -f %formatFolder%\PERSON.xml              -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.NAME               in %dataFolder%\NAME.txt               -f %formatFolder%\NAME.xml                -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.BRTHDATE           in %dataFolder%\BRTHDATE.txt           -f %formatFolder%\BRTHDATE.xml            -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.INDV_SOR           in %dataFolder%\INDV_SOR.txt           -f %formatFolder%\INDV_SOR.xml            -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.Offense            in %dataFolder%\Offense.txt            -f %formatFolder%\Offense.xml             -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.TBL                in %dataFolder%\TBL.txt                -f %formatFolder%\TBL.xml                 -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.VAL                in %dataFolder%\VAL.txt                -f %formatFolder%\VAL.xml                 -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.VAL_RELN           in %dataFolder%\VAL_RELN.txt           -f %formatFolder%\VAL_RELN.xml            -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.AGENCY             in %dataFolder%\AGENCY.txt             -f %formatFolder%\AGENCY.xml              -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.COL                in %dataFolder%\COL.txt                -f %formatFolder%\COL.xml                 -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.Counties           in %dataFolder%\Counties.txt           -f %formatFolder%\Counties.xml            -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.Institute          in %dataFolder%\Institute.txt          -f %formatFolder%\Institute.xml           -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.InstituteCampus    in %dataFolder%\InstituteCampus.txt    -f %formatFolder%\InstituteCampus.xml     -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.OccupationalLicenseIssuers     in %dataFolder%\OccupationalLicenseIssuers.txt     -f %formatFolder%\OccupationalLicenseIssuers.xml      -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.OFF_CODE_SOR       in %dataFolder%\OFF_CODE_SOR.txt       -f %formatFolder%\OFF_CODE_SOR.xml        -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.PlaceCodeTypes     in %dataFolder%\PlaceCodeTypes.txt     -f %formatFolder%\PlaceCodeTypes.xml      -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.PlaceCodes         in %dataFolder%\PlaceCodes.txt         -f %formatFolder%\PlaceCodes.xml          -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.TableCodes         in %dataFolder%\TableCodes.txt         -f %formatFolder%\TableCodes.xml          -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.RegistrationEvent  in %dataFolder%\RegistrationEvent.txt  -f %formatFolder%\RegistrationEvent.xml   -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.Address            in %dataFolder%\Address.txt            -f %formatFolder%\Address.xml             -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.AddressEvent       in %dataFolder%\AddressEvent.txt       -f %formatFolder%\AddressEvent.xml        -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.Education          in %dataFolder%\Education.txt          -f %formatFolder%\Education.xml           -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.EducationEvent     in %dataFolder%\EducationEvent.txt     -f %formatFolder%\EducationEvent.xml      -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.OccupationalLicense            in %dataFolder%\OccupationalLicense.txt            -f %formatFolder%\OccupationalLicense.xml             -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.OccupationalLicenseEvent       in %dataFolder%\OccupationalLicenseEvent.txt       -f %formatFolder%\OccupationalLicenseEvent.xml        -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.Occupation         in %dataFolder%\Occupation.txt         -f %formatFolder%\Occupation.xml          -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.OccupationEvent    in %dataFolder%\OccupationEvent.txt    -f %formatFolder%\OccupationEvent.xml     -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.Email            in %dataFolder%\Email.txt            -f %formatFolder%\Email.xml             -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.EmailEvent       in %dataFolder%\EmailEvent.txt       -f %formatFolder%\EmailEvent.xml        -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.InternetIdentifier            in %dataFolder%\InternetIdentifier.txt            -f %formatFolder%\InternetIdentifier.xml             -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.InternetIdentifierEvent       in %dataFolder%\InternetIdentifierEvent.txt       -f %formatFolder%\InternetIdentifierEvent.xml        -S%s% -U%u% -P%p%
bcp TX_SOR.dbo.Photo              in %dataFolder%\Photo.txt              -f %formatFolder%\Photo.xml               -S%s% -U%u% -P%p%

echo Done!
pause >nul
