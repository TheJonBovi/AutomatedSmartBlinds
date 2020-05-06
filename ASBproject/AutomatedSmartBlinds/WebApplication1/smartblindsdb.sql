CREATE TABLE [dbo].[sbBlindSettings] (
    [sysID]        INT            IDENTITY (1, 1) NOT NULL,
    [name]         NVARCHAR (50)  NOT NULL,
    [sbHorizontal] NVARCHAR (50)  NULL,
    [sbVertical]   NVARCHAR (50)  NULL,
    [notes]        NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_sbBlindSettings] PRIMARY KEY CLUSTERED ([sysID] ASC)
);


SET IDENTITY_INSERT [dbo].[sbBlindSettings] ON
INSERT INTO [dbo].[sbBlindSettings] ([sysID], [name], [sbHorizontal], [sbVertical], [notes]) VALUES (1, N'No Name Supplied', N'100', N'100', NULL)
INSERT INTO [dbo].[sbBlindSettings] ([sysID], [name], [sbHorizontal], [sbVertical], [notes]) VALUES (2, N'Full Close', N'0', N'0', NULL)
SET IDENTITY_INSERT [dbo].[sbBlindSettings] OFF

CREATE TABLE [dbo].[sbCameraSettings] (
    [sysID]          INT            IDENTITY (1, 1) NOT NULL,
    [reportInterval] INT            NULL,
    [settingsName]   NVARCHAR (100) NOT NULL,
    [status]         INT            NULL,
    CONSTRAINT [PK_sbCameraSettings] PRIMARY KEY CLUSTERED ([sysID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'table of prestors settings for camera', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sbCameraSettings';

SET IDENTITY_INSERT [dbo].[sbCameraSettings] ON
INSERT INTO [dbo].[sbCameraSettings] ([sysID], [reportInterval], [settingsName], [status]) VALUES (1, 1, N'Administrator', 3)
INSERT INTO [dbo].[sbCameraSettings] ([sysID], [reportInterval], [settingsName], [status]) VALUES (2, 2, N'Test', 1)
SET IDENTITY_INSERT [dbo].[sbCameraSettings] OFF

CREATE TABLE [dbo].[sbGasSensor] (
    [sysID]          INT            IDENTITY (1, 1) NOT NULL,
    [settingsName]   NVARCHAR (100) NOT NULL,
    [reportInterval] INT            NULL,
    [reportGas]      INT            NULL,
    CONSTRAINT [PK_sbGasSensor] PRIMARY KEY CLUSTERED ([sysID] ASC)
);

SET IDENTITY_INSERT [dbo].[sbGasSensor] ON
INSERT INTO [dbo].[sbGasSensor] ([sysID], [settingsName], [reportInterval], [reportGas]) VALUES (1, N'Administrator', 1, 1)
INSERT INTO [dbo].[sbGasSensor] ([sysID], [settingsName], [reportInterval], [reportGas]) VALUES (2, N'Gas Test 1', 2, 3)
SET IDENTITY_INSERT [dbo].[sbGasSensor] OFF

CREATE TABLE [dbo].[sbledSettings] (
    [sysID]          INT            IDENTITY (1, 1) NOT NULL,
    [settingsName]   NVARCHAR (100) NOT NULL,
    [reportInterval] INT            NULL,
    [ledStyle]       INT            NULL,
    CONSTRAINT [PK_sbledSettings] PRIMARY KEY CLUSTERED ([sysID] ASC)
);

SET IDENTITY_INSERT [dbo].[sbledSettings] ON
INSERT INTO [dbo].[sbledSettings] ([sysID], [settingsName], [reportInterval], [ledStyle]) VALUES (1, N'Administrator', 1, 1)
INSERT INTO [dbo].[sbledSettings] ([sysID], [settingsName], [reportInterval], [ledStyle]) VALUES (2, N'LED Test', 2, 2)
SET IDENTITY_INSERT [dbo].[sbledSettings] OFF



CREATE TABLE [dbo].[sbLogs] (
    [sysID]     INT            IDENTITY (1, 1) NOT NULL,
    [userSysID] INT            NULL,
    [logTime]   DATETIME2 (7)  NULL,
    [tempLog]   NVARCHAR (100) NULL,
    [proxLog]   NVARCHAR (100) NULL,
    [ledLog]    NVARCHAR (100) NULL,
    [pizoLog]   NVARCHAR (100) NULL,
    [gasLog]    NVARCHAR (100) NULL,
    [cameraLog] NVARCHAR (100) NULL,
    [sbHorzLog] NVARCHAR (100) NULL,
    [sbVertLog] NVARCHAR (100) NULL,
    CONSTRAINT [PK_sbLogs] PRIMARY KEY CLUSTERED ([sysID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table for logs of all sensors', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sbLogs';

SET IDENTITY_INSERT [dbo].[sbLogs] ON
INSERT INTO [dbo].[sbLogs] ([sysID], [userSysID], [logTime], [tempLog], [proxLog], [ledLog], [pizoLog], [gasLog], [cameraLog], [sbHorzLog], [sbVertLog]) VALUES (1, 1, N'2019-12-20 00:00:00', N'72', N'6', N'1', N'3', N'Oxygen', N'3', N'Closed', N'Open')
SET IDENTITY_INSERT [dbo].[sbLogs] OFF

CREATE TABLE [dbo].[sbPizoSettings] (
    [sysID]          INT            IDENTITY (1, 1) NOT NULL,
    [settingsName]   NVARCHAR (100) NOT NULL,
    [reportInterval] INT            NULL,
    [soundstyle]     INT            NULL,
    CONSTRAINT [PK_sbPizoSettings] PRIMARY KEY CLUSTERED ([sysID] ASC)
);

SET IDENTITY_INSERT [dbo].[sbPizoSettings] ON
INSERT INTO [dbo].[sbPizoSettings] ([sysID], [settingsName], [reportInterval], [soundstyle]) VALUES (1, N'Administrator', 1, 1)
INSERT INTO [dbo].[sbPizoSettings] ([sysID], [settingsName], [reportInterval], [soundstyle]) VALUES (2, N'Pizo Test', 2, 2)
SET IDENTITY_INSERT [dbo].[sbPizoSettings] OFF

CREATE TABLE [dbo].[sbProfiles] (
    [sysID]                INT           IDENTITY (1, 1) NOT NULL,
    [profileName]          NVARCHAR (50) NOT NULL,
    [tempSettingsSysID]    INT           NOT NULL,
    [proxSettingsSysID]    INT           NOT NULL,
    [ledSettingsSysID]     INT           NOT NULL,
    [pizoSettingsSysID]    INT           NOT NULL,
    [gasSettingsSysID]     INT           NOT NULL,
    [cameraSettingsSysID]  INT           NOT NULL,
    [sbBlindSettingsSysID] INT           NOT NULL,
    CONSTRAINT [PK_sbProfiles] PRIMARY KEY CLUSTERED ([sysID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table of all smartblinds pariphral devices', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sbProfiles';

SET IDENTITY_INSERT [dbo].[sbProfiles] ON
INSERT INTO [dbo].[sbProfiles] ([sysID], [profileName], [tempSettingsSysID], [proxSettingsSysID], [ledSettingsSysID], [pizoSettingsSysID], [gasSettingsSysID], [cameraSettingsSysID], [sbBlindSettingsSysID]) VALUES (4, N'Administrator', 1, 1, 1, 1, 1, 1, 1)
INSERT INTO [dbo].[sbProfiles] ([sysID], [profileName], [tempSettingsSysID], [proxSettingsSysID], [ledSettingsSysID], [pizoSettingsSysID], [gasSettingsSysID], [cameraSettingsSysID], [sbBlindSettingsSysID]) VALUES (5, N'Test', 2, 2, 2, 2, 2, 2, 2)
SET IDENTITY_INSERT [dbo].[sbProfiles] OFF

CREATE TABLE [dbo].[sbProxSensor] (
    [sysID]           INT            IDENTITY (1, 1) NOT NULL,
    [settingsName]    NVARCHAR (100) NOT NULL,
    [reportInterval]  INT            NULL,
    [reportProximity] INT            NULL,
    CONSTRAINT [PK_sbProxSensor] PRIMARY KEY CLUSTERED ([sysID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Proximity sensor settings table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sbProxSensor';


SET IDENTITY_INSERT [dbo].[sbProxSensor] ON
INSERT INTO [dbo].[sbProxSensor] ([sysID], [settingsName], [reportInterval], [reportProximity]) VALUES (1, N'Administrator', 1, 1)
INSERT INTO [dbo].[sbProxSensor] ([sysID], [settingsName], [reportInterval], [reportProximity]) VALUES (2, N'Prox 2 Test', 2, 2)
SET IDENTITY_INSERT [dbo].[sbProxSensor] OFF



CREATE TABLE [dbo].[sbTempSensor] (
    [sysID]          INT            IDENTITY (1, 1) NOT NULL,
    [settingsName]   NVARCHAR (100) NOT NULL,
    [reportInterval] INT            NULL,
    [reportTemp]     INT            NULL,
    CONSTRAINT [PK_sbTempSensor] PRIMARY KEY CLUSTERED ([sysID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Temperature sensor settings table', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sbTempSensor';


SET IDENTITY_INSERT [dbo].[sbTempSensor] ON
INSERT INTO [dbo].[sbTempSensor] ([sysID], [settingsName], [reportInterval], [reportTemp]) VALUES (1, N'Administrator', 1, 1)
INSERT INTO [dbo].[sbTempSensor] ([sysID], [settingsName], [reportInterval], [reportTemp]) VALUES (2, N'Temp Test', 2, 2)
SET IDENTITY_INSERT [dbo].[sbTempSensor] OFF


CREATE TABLE [dbo].[sbUsers] (
    [sysID]        INT           IDENTITY (1, 1) NOT NULL,
    [profileSysID] INT           NOT NULL,
    [fname]        NVARCHAR (50) NOT NULL,
    [lname]        NVARCHAR (50) NOT NULL,
    [phone]        NVARCHAR (50) NULL,
    [email]        NVARCHAR (50) NULL,
    [active]       BIT           NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table for all users. Users should belong to a Profile group', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sbUsers';

SET IDENTITY_INSERT [dbo].[sbUsers] ON
INSERT INTO [dbo].[sbUsers] ([sysID], [profileSysID], [fname], [lname], [phone], [email], [active]) VALUES (1, 4, N'test', N'Administrator', N'0', NULL, 1)
INSERT INTO [dbo].[sbUsers] ([sysID], [profileSysID], [fname], [lname], [phone], [email], [active]) VALUES (2, 5, N'Test', N'User', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[sbUsers] OFF


CREATE PROCEDURE [dbo].[add_remove_constraints] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    --Drop constraints


--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sbProfiles_sbCameraSettings]') AND parent_object_id = OBJECT_ID(N'[dbo].[sbProfiles]'))
--ALTER TABLE [dbo].[sbProfiles] DROP CONSTRAINT [FK_sbProfiles_sbCameraSettings]
--GO

--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sbProfiles_sbGasSensor]') AND parent_object_id = OBJECT_ID(N'[dbo].[sbProfiles]'))
--ALTER TABLE [dbo].[sbProfiles] DROP CONSTRAINT [FK_sbProfiles_sbGasSensor]
--GO

--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sbProfiles_sbledSettings]') AND parent_object_id = OBJECT_ID(N'[dbo].[sbProfiles]'))
--ALTER TABLE [dbo].[sbProfiles] DROP CONSTRAINT [FK_sbProfiles_sbledSettings]
--GO

--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sbProfiles_sbPizoSettings]') AND parent_object_id = OBJECT_ID(N'[dbo].[sbProfiles]'))
--ALTER TABLE [dbo].[sbProfiles] DROP CONSTRAINT [FK_sbProfiles_sbPizoSettings]
--GO

--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sbProfiles_sbProxSensor]') AND parent_object_id = OBJECT_ID(N'[dbo].[sbProfiles]'))
--ALTER TABLE [dbo].[sbProfiles] DROP CONSTRAINT [FK_sbProfiles_sbProxSensor]
--GO

--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sbProfiles_sbTempSensor]') AND parent_object_id = OBJECT_ID(N'[dbo].[sbProfiles]'))
--ALTER TABLE [dbo].[sbProfiles] DROP CONSTRAINT [FK_sbProfiles_sbTempSensor]
--GO

--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sbProfiles_sbPizoSettings]') AND parent_object_id = OBJECT_ID(N'[dbo].[sbProfiles]'))
--ALTER TABLE [dbo].[sbProfiles] DROP CONSTRAINT [FK_sbProfiles_sbPizoSettings]
--GO

--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sbProfiles_sbProxSensor]') AND parent_object_id = OBJECT_ID(N'[dbo].[sbProfiles]'))
--ALTER TABLE [dbo].[sbProfiles] DROP CONSTRAINT [FK_sbProfiles_sbProxSensor]
--GO

--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sbProfiles_sbTempSensor]') AND parent_object_id = OBJECT_ID(N'[dbo].[sbProfiles]'))
--ALTER TABLE [dbo].[sbProfiles] DROP CONSTRAINT [FK_sbProfiles_sbTempSensor]
--GO
--USE [smartblindsdb]
--GO

--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sbUsers_sbProfiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[sbUsers]'))
--ALTER TABLE [dbo].[sbUsers] DROP CONSTRAINT [FK_sbUsers_sbProfiles]
--GO

--USE [smartblindsdb]
--GO

--/****** Object:  Table [dbo].[sbUsers]    Script Date: 11/07/2019 00:05:10 ******/
--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sbUsers]') AND type in (N'U'))
--DROP TABLE [dbo].[sbUsers]
--GO


----add constraints


--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table of all smartblinds pariphral devices' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sbProfiles'
--GO

--ALTER TABLE [dbo].[sbProfiles]  WITH CHECK ADD  CONSTRAINT [FK_sbProfiles_sbCameraSettings] FOREIGN KEY([cameraSettingsSysID])
--REFERENCES [dbo].[sbCameraSettings] ([sysID])
--ON UPDATE CASCADE
--GO

--ALTER TABLE [dbo].[sbProfiles] CHECK CONSTRAINT [FK_sbProfiles_sbCameraSettings]
--GO

--ALTER TABLE [dbo].[sbProfiles]  WITH CHECK ADD  CONSTRAINT [FK_sbProfiles_sbGasSensor] FOREIGN KEY([gasSettingsSysID])
--REFERENCES [dbo].[sbGasSensor] ([sysID])
--ON UPDATE CASCADE
--GO

--ALTER TABLE [dbo].[sbProfiles] CHECK CONSTRAINT [FK_sbProfiles_sbGasSensor]
--GO

--ALTER TABLE [dbo].[sbProfiles]  WITH CHECK ADD  CONSTRAINT [FK_sbProfiles_sbledSettings] FOREIGN KEY([ledSettingsSysID])
--REFERENCES [dbo].[sbledSettings] ([sysID])
--GO

--ALTER TABLE [dbo].[sbProfiles] CHECK CONSTRAINT [FK_sbProfiles_sbledSettings]
--GO

--ALTER TABLE [dbo].[sbProfiles]  WITH CHECK ADD  CONSTRAINT [FK_sbProfiles_sbPizoSettings] FOREIGN KEY([pizoSettingsSysID])
--REFERENCES [dbo].[sbPizoSettings] ([sysID])
--ON UPDATE CASCADE
--GO

--ALTER TABLE [dbo].[sbProfiles] CHECK CONSTRAINT [FK_sbProfiles_sbPizoSettings]
--GO

--ALTER TABLE [dbo].[sbProfiles]  WITH CHECK ADD  CONSTRAINT [FK_sbProfiles_sbProxSensor] FOREIGN KEY([proxSettingsSysID])
--REFERENCES [dbo].[sbProxSensor] ([sysID])
--ON UPDATE CASCADE
--GO

--ALTER TABLE [dbo].[sbProfiles] CHECK CONSTRAINT [FK_sbProfiles_sbProxSensor]
--GO

--ALTER TABLE [dbo].[sbProfiles]  WITH CHECK ADD  CONSTRAINT [FK_sbProfiles_sbTempSensor] FOREIGN KEY([tempSettingsSysID])
--REFERENCES [dbo].[sbTempSensor] ([sysID])
--ON UPDATE CASCADE
--GO

--ALTER TABLE [dbo].[sbProfiles] CHECK CONSTRAINT [FK_sbProfiles_sbTempSensor]
--GO

end





CREATE PROCEDURE [dbo].[ledssettings_admin] 
	-- Add the parameters for the stored procedure here
	@function int = NULL, --function number
	@sysID int = NULL, --for delete operations
	@sysIDUser int = NULL, --user ID
	@settingsName nvarchar(100) = 'No Name Supplied', -- name of settings
	@reportInterval int = NULL, --Extention of blinds
	@ledStyle int = NULL
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- Function list:
	-- 0. Get All BlindSettings Record based off user
	-- 1. Set Horizontal BlindSettings Record for user
	-- 2. Set Vertical BlindSettings Record for user
	-- 3. Set Name of BlindSettings Record for user
	-- 4. Set Notes BlindSettings Record for user
	-- 5. Set All BlindSettings Record for user
	-- 6. Insert BlindSettings Record
	-- 7. Delete BlindsSettings Record
	
	SET NOCOUNT ON;

  	-- Get LED settings Record based off user
	IF (@function = 0)
		begin		
			SELECT *
			FROM dbo.sbledSettings
			inner join
			dbo.sbProfiles
			on
			dbo.sbProfiles.ledSettingsSysID = sbledSettings.sysID
			inner join
			dbo.sbUsers
			on
			sbUsers.sysID = @sysIDUser
		
		end
	end	
  		-- Set report Intervals Record for user
		
		IF (@function = 1)
		begin		
			UPDATE sbledSettings
SET       reportInterval = @reportInterval
FROM  sbBlindSettings INNER JOIN
               sbProfiles ON sbProfiles.sbBlindSettingsSysID = sbBlindSettings.sysID INNER JOIN
               sbUsers ON sbUsers.sysID = @sysIDUser
			
		end
	
		 -- Set led style Record for user	
		
		IF (@function = 2)
		begin		
			UPDATE dbo.sbledSettings
SET       ledStyle = @ledStyle
FROM  sbledSettings INNER JOIN
               sbProfiles ON sbProfiles.ledSettingsSysID = sbledSettings.sysID INNER JOIN
               sbUsers ON sbUsers.sysID = @sysIDUser
			
		end

	-- Set Name of BlindSettings Record for user	
		
		IF (@function = 3)
		begin		
			UPDATE dbo.sbledSettings
SET      settingsName  = @settingsName
FROM   dbo.sbledSettings INNER JOIN
               sbProfiles ON sbProfiles.ledSettingsSysID = sbledSettings.sysID INNER JOIN
               sbUsers ON sbUsers.sysID = @sysIDUser
			
		end
		
		
		-- Set All LED Settings Record for user	
		
		IF (@function = 5)
		begin		
			UPDATE dbo.sbledSettings
SET      settingsName  = @settingsName, reportInterval = @reportInterval, ledStyle = @ledStyle
FROM  sbBlindSettings INNER JOIN
               sbProfiles ON sbProfiles.sbBlindSettingsSysID = sbBlindSettings.sysID INNER JOIN
               sbUsers ON sbUsers.sysID = @sysIDUser
			
		end
		
		-- insert BlindSettings Record
		
		IF (@function = 6)
		begin		
			INSERT 
INTO    dbo.sbledSettings (settingsName, reportInterval, ledStyle)
VALUES (@settingsName,@reportInterval,@ledStyle)
			
		end
		
		
		-- Delete BlindSettings Record 
		
		IF (@function = 7)
		begin		
			DELETE FROM dbo.sbledSettings
			WHERE (sysID = @sysID)
		end

END





CREATE PROCEDURE [dbo].[logsettings_admin] 
	-- Add the parameters for the stored procedure here
	@function int = NULL, --function number
	@userSysID int = NULL, --for delete operations
	@logTime  DATETIME2 =  NULL,
    @tempLog   NVARCHAR(100) = NULL,
    @proxLog   NVARCHAR(100) = NULL,
    @ledLog    NVARCHAR(100) = NULL,
    @pizoLog   NVARCHAR(100) = NULL,
    @gasLog    NVARCHAR(100) = NULL,
    @cameraLog NVARCHAR(100) = NULL,
    @sbHorzLog NVARCHAR(100) = NULL,
    @sbVertLog NVARCHAR(100) = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- Function list:
	-- 0. Get All BlindSettings Record based off user
	-- 1. Set Horizontal BlindSettings Record for user
	-- 2. Set Vertical BlindSettings Record for user
	-- 3. Set Name of BlindSettings Record for user
	-- 4. Set Notes BlindSettings Record for user
	-- 5. Set All BlindSettings Record for user
	-- 6. Insert BlindSettings Record
	-- 7. Delete BlindsSettings Record
	
	SET NOCOUNT ON;

  	-- Get Active User info
	IF (@function = 0)
		begin		
			SELECT *
			FROM dbo.sbUsers
			WHERE active = 1
		
		end
end		
  		-- Set First Name
		
		IF (@function = 1)
		begin		
			UPDATE dbo.sbUsers
			SET       fname = @fname
			WHERE
			sbUsers.sysID = @sysID
			
		end
	
		 -- Set Last Name	
		
		IF (@function = 2)
		begin		
			UPDATE dbo.sbUsers
			SET       lname = @lname
			WHERE
			sbUsers.sysID = @sysID
			
		end

	-- Set Name of BlindSettings Record for user	
		
		IF (@function = 3)
		begin		
			UPDATE dbo.sbUsers
			SET       fname = @fname
			WHERE
			sbUsers.sysID = @sysID
			
		end
		
		-- Set Notes BlindSettings Record for user	
		
		IF (@function = 4)
		begin		
			UPDATE dbo.sbUsers
			SET       fname = @fname
			WHERE
			sbUsers.sysID = @sysID
			
		end
		
		-- Set All BlindSettings Record for user	
		
		IF (@function = 5)
		begin		
			UPDATE dbo.sbUsers
			SET       fname = @fname
			WHERE
			sbUsers.sysID = @sysID
			
		end
		
		-- insert BlindSettings Record
		
		IF (@function = 6)
		begin		
			UPDATE dbo.sbUsers
			SET       fname = @fname
			WHERE
			sbUsers.sysID = @sysID
		end
		
		
		-- Delete BlindSettings Record 
		
		IF (@function = 7)
		begin		
			DELETE FROM sbBlindSettings
			WHERE (sysID = @sysID)
		end
		
		-- Set Current Active User 
		
		IF (@function = 7)
		begin		
			DELETE FROM sbBlindSettings
			WHERE (sysID = @sysID)
		end

END

CREATE TABLE [dbo].[sbLogs] (
    [sysID]     INT            IDENTITY (1, 1) NOT NULL,
    [userSysID] INT            NULL,
    [logTime]   DATETIME2 (7)  NULL,
    [tempLog]   NVARCHAR (100) NULL,
    [proxLog]   NVARCHAR (100) NULL,
    [ledLog]    NVARCHAR (100) NULL,
    [pizoLog]   NVARCHAR (100) NULL,
    [gasLog]    NVARCHAR (100) NULL,
    [cameraLog] NVARCHAR (100) NULL,
    [sbHorzLog] NVARCHAR (100) NULL,
    [sbVertLog] NVARCHAR (100) NULL,
    CONSTRAINT [PK_sbLogs] PRIMARY KEY CLUSTERED ([sysID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table for logs of all sensors', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'sbLogs';


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


ALTER PROCEDURE [dbo].[logsettings_admin] 
	-- Add the parameters for the stored procedure here
	@function int = NULL, --function number
	@userSysID int = NULL, --for delete operations
	@logTime  DATETIME2 =  NULL,
    @tempLog   NVARCHAR(100) = NULL,
    @proxLog   NVARCHAR(100) = NULL,
    @ledLog    NVARCHAR(100) = NULL,
    @pizoLog   NVARCHAR(100) = NULL,
    @gasLog    NVARCHAR(100) = NULL,
    @cameraLog NVARCHAR(100) = NULL,
    @sbHorzLog NVARCHAR(100) = NULL,
    @sbVertLog NVARCHAR(100) = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- Function list:
	-- 0. Get All BlindSettings Record based off user
	-- 1. Set Horizontal BlindSettings Record for user
	-- 2. Set Vertical BlindSettings Record for user
	-- 3. Set Name of BlindSettings Record for user
	-- 4. Set Notes BlindSettings Record for user
	-- 5. Set All BlindSettings Record for user
	-- 6. Insert BlindSettings Record
	-- 7. Delete BlindsSettings Record
	
	SET NOCOUNT ON;

  	-- Log Temperature Event
	IF (@function = 0)
		begin		
			insert into sblogs 
			(logTime, tempLog)
			values
			(GETDATE(), @tempLog)
		
		end
end