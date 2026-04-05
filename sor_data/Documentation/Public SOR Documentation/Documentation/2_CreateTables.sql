USE TX_SOR
GO

CREATE TABLE [dbo].[AGENCY](
	[ORI_TXT] [varchar](9) NULL,
	[ATR_TXT] [varchar](47) NULL
)

--CREATE TABLE [dbo].[APP_COL](
--	[APC_IDN] [int] NOT NULL,
--	[APP_IDN] [int] NOT NULL,
--	[COL_IDN] [int] NULL,
--	[CDO_IDN] [int] NULL,
--	[DAT_COD] [varchar](10) NULL,
--	[LEN_NBR] [int] NULL,
--	[SCA_NBR] [int] NULL,
--	[LBL_COD] [varchar](18) NULL,
--	[SRT_NBR] [int] NULL,
--	[DES_TXT] [varchar](2000) NULL,
--	[SDE_TXT] [varchar](200) NULL,
--	[TYP_COD] [varchar](1) NULL,
--	[LOC_TXT] [varchar](18) NULL,
--	[NAM_COD] [varchar](18) NULL,
--	[BATCH_ID] [int] NOT NULL
--)

CREATE TABLE [dbo].[BRTHDATE](
	[DOB_IDN] [int] NOT NULL,
	[PER_IDN] [int] NOT NULL,
	[TYP_COD] [varchar](1) NULL,
	[DOB_DTE] [datetime] NOT NULL
) 

CREATE TABLE [dbo].[COL](
	[COL_IDN] [int] NOT NULL,
	[TBL_IDN] [int] NOT NULL,
	[COL_COD] [varchar](8) NULL,
	[COL_TXT] [varchar](40) NULL,
	[BATCH_ID] [int] NOT NULL
) 

CREATE TABLE [dbo].[Counties](
	[COU_COD] [varchar](3) NOT NULL,
	[COU_TXT] [varchar](255) NULL
)

CREATE TABLE [dbo].[INDV](
	[IND_IDN] [int] NOT NULL,
	[DPS_NBR] [varchar](8) NULL,
	[ICO_TXT] [varchar](500) NULL
)

CREATE TABLE [dbo].[INDV_SOR](
	[IND_IDN] [int] NOT NULL,
	[DPS_NBR] [char](8) NULL,
	[RSK_COD] [char](1) NOT NULL,
	[SSZ_COD] [char](3) NOT NULL,
	[SWD_COD] [varchar](3) NOT NULL,
	[ERT_COD] [char](3) NULL,
	[ERD_DTE] [datetime] NULL,
	[VRP_COD] [char](1) NULL
) 

CREATE TABLE [dbo].[Institute](
	[InstituteId] [int] NOT NULL,
	[INS_COD] [char](3) NULL,
	[INS_TXT] [varchar](255) NULL
)

CREATE TABLE [dbo].[InstituteCampus](
	[CampusId] [int] NOT NULL,
	[InstituteId] [int] NOT NULL,
	[CAM_TXT] [varchar](30) NOT NULL	
)

CREATE TABLE [dbo].[OccupationalLicenseIssuers](
	OccupationalLicenseIssuersId [int] NOT NULL,
	[OLI_TXT] [varchar](100) not NULL
)



--CREATE TABLE [dbo].[OccupationalLicenseCategories](
--	OccupationalLicenseCategoriesId [int] NOT NULL,
--	[OLC_TXT] [varchar](100) not NULL,
--	OccupationalLicenseIssuersId int not null,
--)

--CREATE TABLE [dbo].[OccupationalLicenseContacts](
--	OccupationalLicenseContactsId [int] NOT NULL,
--	[LastName] [varchar](30) not NULL,
--	[FirstName] [varchar](30) not NULL,
--	StreetNumber [varchar](7) not NULL,
--	StreetName [varchar](25) not NULL,
--	City [varchar](20) not NULL,
--	SateAbbr [char](2) not NULL,
--	ZipCode [char](5) not NULL,
--	TelephoneNumber [char](12) not NULL,
--	EmailAddress [varchar](100)  NULL,

--)

--CREATE TABLE [dbo].[OccupationalLicenseLicenses](
--	OccupationalLicenseLicensesId [int] NOT NULL,
--	[OLL_TXT] [varchar](100) not NULL,
--	OccupationalLicenseCategoriesId int not null,
--	OccupationalLicenseContactsId int not null
--)

CREATE TABLE [dbo].[NAME](
	[NAM_IDN] [int] NOT NULL,
	[PER_IDN] [int] NOT NULL,
	[TYP_COD] [varchar](1) NULL,
	[NAM_TXT] [varchar](30) NULL,
	[LNA_TXT] [varchar](30) NULL,
	[FNA_TXT] [varchar](30) NULL
) 

CREATE TABLE [dbo].[OFF_CODE_SOR](
	COO_COD char(3) NOT NULL,
	[COJ_COD] [char](3) NOT NULL,
	[JOO_COD] [char](2) NOT NULL,
	[OFF_COD] [varchar](8) NOT NULL,
	[VER_NBR] [int] NOT NULL,
	[LEN_TXT] [varchar](255) NULL,
	--[TXC_COD] [char](8) NOT NULL,
	[STS_COD] [char](1) NOT NULL,	
	[CIT_TXT] [nvarchar](max) NULL,
	Begindate datetime null,
	Enddate datetime null
	
)

CREATE TABLE [dbo].[Offense](
	[IND_IDN] [int] NOT NULL,
	[OffenseId] [int] NOT NULL,
	COO_COD [char](3) NOT NULL,
	COJ_COD [char](3) NULL,
	JOO_COD [char](3) not NULL,

	OFF_COD char(8) null,
	[VER_NBR] [int] NOT NULL,
	[GOC_COD] [char](1) NULL,
	[DIS_FLG] [char](1) NOT NULL,
	[OST_COD] [varchar](8) NULL,
	[CPR_COD] [varchar](3) NULL,
	[CDD_DTE] [datetime] NULL,
	[AOV_NBR] [int] NULL,
	[SOV_COD] [char](1) NULL,
	--[ROV_COD] [char](1) NULL,
	DOO_DTE date null,
	--DIS_COD char(3) null,
	--JUV_FLG char(1) not null,
	--WPN_COD char(1) null,
	--COU_COD char(3) null,
	--PUB_COD char(1) not null,
	CPR_VAL varchar(12)
) 

CREATE TABLE [dbo].[PERSON](
	[IND_IDN] [int] NULL,
	[PER_IDN] [int] NOT NULL,
	[SEX_COD] [varchar](1) NULL,
	[RAC_COD] [varchar](1) NULL,
	[HGT_QTY] [smallint] NULL,
	[WGT_QTY] [smallint] NULL,
	[HAI_COD] [varchar](3) NULL,
	[EYE_COD] [varchar](3) NULL,
	[ETH_COD] [varchar](1) NULL	
)

CREATE TABLE [dbo].[PlaceCodes](
	[PLT_COD] [char](3) NOT NULL,
	[PLC_COD] [char](2) NOT NULL,
	[PLC_TXT] [varchar](255) NULL
)

CREATE TABLE [dbo].[PlaceCodeTypes](
	[PLT_COD] [varchar](3) NOT NULL,
	[PLT_TXT] [varchar](50) NULL
)

CREATE TABLE [dbo].[TableCodes](
	SchemaName varchar(30) not null,
	[TBL_COD] [varchar](50) NOT NULL,
	[COL_COD] [varchar](50) NOT NULL,
	[VAL_COD] [varchar](25) NOT NULL,
	[VAL_TXT] [nvarchar](75) NULL,
	language [char](2) NOT NULL
) 

--CREATE TABLE [dbo].[TableFields](
--	[TABLE_NAME] [sysname] NOT NULL,
--	[COLUMN_NAME] [sysname] NULL,
--	[DATA_TYPE] [nvarchar](128) NULL,
--	[COLUMN_LENGTH] [nvarchar](50) NULL,
--	[COLUMN_DESC] [sql_variant] NULL,
--	[ORDINAL_POSITION] [int] NULL
--) ON [PRIMARY]

CREATE TABLE [dbo].[TBL](
	[TBL_IDN] [int] NOT NULL,
	[TBL_COD] [varchar](8) NULL,
	[TBL_TXT] [varchar](30) NULL,
	[INQ_TXT] [varchar](8) NULL,
	[UPD_TXT] [varchar](8) NULL,
	[BATCH_ID] [int] NOT NULL
)

CREATE TABLE [dbo].[VAL](
	[VAL_IDN] [int] NOT NULL,
	[COL_IDN] [int] NOT NULL,
	[VAL_COD] [varchar](10) NULL,
	[VAL_TXT] [varchar](80) NULL,
	[ACT_COD] [varchar](1) NULL,
	[LNG_TXT] [varchar](300) NULL,
	[APP_COD] [varchar](4) NULL,
	[BATCH_ID] [int] NOT NULL
)

CREATE TABLE [dbo].[VAL_RELN](
	[VLR_IDN] [int] NOT NULL,
	[VAL_IDN] [int] NOT NULL,
	[VAR_IDN] [int] NOT NULL,
	[CMB_COD] [varchar](1) NULL,
	[BATCH_ID] [int] NOT NULL
)

CREATE TABLE [dbo].[Address](
	[AddressId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	[SNU_NBR] [varchar](7) NULL,
	[SNA_TXT] [varchar](25) NULL,
	SUD_COD [varchar](4) NULL,
	SUD_NBR [varchar](10) NULL,
	[CTY_TXT] [varchar](20) NULL,
	[PLT_COD] [char](3) NOT NULL,
	[PLC_COD] [char](2) NOT NULL,
	[ZIP_TXT] [char](5) NULL,
	[COU_COD] [varchar](3) NULL,
	[LAT_NBR] [float] NULL,
	[LON_NBR] [float] NULL,
	MIS_TXT varchar(512)
)

CREATE TABLE [dbo].[AddressEvent](
	[AddressEventId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	[PDV_COD] [char](3) NOT NULL,
	WRK_FLG char(1) not null,
	[AddressId] [int] NOT NULL
)


CREATE TABLE [dbo].[Education](
	[EducationId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	[CampusId] [int] NULL,
	[EMP_FLG] [char](1) not null ,
	[STU_FLG] [char](1) not null,
	UIN_TXT varchar(50) null,
	UCM_TXT varchar(50) null,
	UCT_TXT varchar(20) null
)  

CREATE TABLE [dbo].[EducationEvent](
	[EducationEventId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	[PDV_COD] [char](3) NOT NULL,
	[EducationId] [int] NULL
)
CREATE TABLE [dbo].[OccupationalLicense](
	[LicenseId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	[OCL_TXT] varchar(20) NOT NULL,
	OccupationalLicenseLicensesId int not null
) 

CREATE TABLE [dbo].[OccupationalLicenseEvent](
	[LicenseEventId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	[PDV_COD] [char](3) NOT NULL,
	[LicenseId] [int] NULL
) 

create table dbo.Occupations(
OCC_COD char(7) not null,
OCC_TXT varchar(100) not null,
OCC_COD_NBR int null
)

CREATE TABLE [dbo].[Occupation](
	[OccupationId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	[EMP_TXT] [varchar](30) NULL,
	[SNU_NBR] [varchar](7) NULL,
	[SNA_TXT] [varchar](25) NULL,
	[CTY_TXT] [varchar](20) NULL,
	[STA_COD] [char](2) NULL,
	[ZIP_TXT] [char](5) NULL,
	OCC_TXT varchar(30) null,
	OCC_COD char(7) not null
) 

CREATE TABLE [dbo].[OccupationEvent](
	[OccupationEventId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	[PDV_COD] [char](3) NULL,
	[OccupationId] [int] NULL
)
CREATE TABLE [dbo].[Photo](
	[IND_IDN] [int] NOT NULL,
	[PhotoId] [int] NOT NULL,
	[POS_DTE] [datetime] NOT NULL
)

CREATE TABLE [dbo].[RegistrationEvent](
	[IND_IDN] [int] NOT NULL,
	[EVENTId] [int] NOT NULL,
	[EVM_COD] [char](3) not NULL,
	[EVT_DTE] [datetime] NULL,
	EVO_NBR int not null,
	[ORI_TXT] [char](9) NULL
)

CREATE TABLE [dbo].[TableFields]
(
	[TBL_COD] [varchar](50) NOT NULL,
	[COL_COD] [varchar](50) NOT NULL,
	[TYP_COD] [varchar](50) NOT NULL,
	[LEN_NBR] [varchar](25)  NULL ,
	[DES_TXT] [nvarchar](2048) NULL
)

CREATE TABLE [dbo].Email(
	[EmailId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	EML_TXT varchar(320) not null,
	DLU_TMS datetime not null

)  

CREATE TABLE [dbo].EmailEvent(
	[EmailEventId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	[PDV_COD] [char](3) NOT NULL,
	[EmailId] [int] NULL
)

CREATE TABLE [dbo].InternetIdentifier(
	[InternetIdentifierId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	IID_TXT varchar(320) not null,
	IID_URL varchar(254) null

)  

CREATE TABLE [dbo].InternetIdentifierEvent(
	[InternetIdentifierEventId] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[IND_IDN] [int] NOT NULL,
	[PDV_COD] [char](3) NOT NULL,
	[InternetIdentifierId] [int] NULL
)