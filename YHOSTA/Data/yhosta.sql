/*
 Navicat Premium Data Transfer

 Source Server         : 172.16.200.199_鉴定
 Source Server Type    : SQL Server
 Source Server Version : 10501600
 Source Host           : 172.16.200.199:1433
 Source Catalog        : yhosta
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 10501600
 File Encoding         : 65001

 Date: 18/03/2019 15:50:53
*/


-- ----------------------------
-- Table structure for dtproperties
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dtproperties]') AND type IN ('U'))
	DROP TABLE [dbo].[dtproperties]
GO

CREATE TABLE [dbo].[dtproperties] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [objectid] int  NULL,
  [property] varchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [value] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [uvalue] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [lvalue] image  NULL,
  [version] int DEFAULT (0) NOT NULL
)
GO

ALTER TABLE [dbo].[dtproperties] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for T_admin
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[T_admin]') AND type IN ('U'))
	DROP TABLE [dbo].[T_admin]
GO

CREATE TABLE [dbo].[T_admin] (
  [id] int  NOT NULL,
  [username] nvarchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [password] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [schoolname] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [lname] nvarchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [ltel] nvarchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [lastlotime] datetime  NULL,
  [lastloip] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [flag] nvarchar(30) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[T_admin] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for T_yhks
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[T_yhks]') AND type IN ('U'))
	DROP TABLE [dbo].[T_yhks]
GO

CREATE TABLE [dbo].[T_yhks] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [kh] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [sfzh] varchar(18) COLLATE Chinese_PRC_CI_AS  NULL,
  [ksxm] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [zygz] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [jdjb] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [xb] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [csrq] datetime  NULL,
  [bmdw] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [gl] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [whcd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [ksly] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lrcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [sccj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lxdh] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [bz] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [addtime] datetime  NULL,
  [uid] int  NULL,
  [sh] int  NULL,
  [p] int  NULL
)
GO

ALTER TABLE [dbo].[T_yhks] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for T_yhks_tmp
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[T_yhks_tmp]') AND type IN ('U'))
	DROP TABLE [dbo].[T_yhks_tmp]
GO

CREATE TABLE [dbo].[T_yhks_tmp] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [kh] varchar(18) COLLATE Chinese_PRC_CI_AS  NULL,
  [sfzh] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ksxm] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [zygz] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [jdjb] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [xb] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [csrq] datetime  NULL,
  [bmdw] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [gl] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [whcd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [ksly] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lrcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [sccj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lxdh] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [bz] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [addtime] datetime  NULL,
  [uid] int  NULL,
  [sh] int  NULL,
  [p] int  NULL
)
GO

ALTER TABLE [dbo].[T_yhks_tmp] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for T_yhks_zxnl
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[T_yhks_zxnl]') AND type IN ('U'))
	DROP TABLE [dbo].[T_yhks_zxnl]
GO

CREATE TABLE [dbo].[T_yhks_zxnl] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [kh] varchar(18) COLLATE Chinese_PRC_CI_AS  NULL,
  [sfzh] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ksxm] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [zygz] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [jdjb] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [xb] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [csrq] datetime  NULL,
  [bmdw] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [gl] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [whcd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [ksly] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lrcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [sccj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lxdh] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [bz] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [zsh] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [bzrq] datetime  NULL,
  [addtime] datetime  NULL,
  [uid] int  NULL,
  [sh] int  NULL,
  [p] int  NULL
)
GO

ALTER TABLE [dbo].[T_yhks_zxnl] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for T_yhks_zxnl_tmp
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[T_yhks_zxnl_tmp]') AND type IN ('U'))
	DROP TABLE [dbo].[T_yhks_zxnl_tmp]
GO

CREATE TABLE [dbo].[T_yhks_zxnl_tmp] (
  [id] int  NULL,
  [kh] varchar(18) COLLATE Chinese_PRC_CI_AS  NULL,
  [sfzh] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ksxm] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [zygz] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [jdjb] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [xb] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [csrq] datetime  NULL,
  [bmdw] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [gl] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [whcd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [ksly] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lrcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [sccj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lxdh] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [bz] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [zsh] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [bzrq] datetime  NULL,
  [addtime] datetime  NULL,
  [uid] int  NULL,
  [sh] int  NULL,
  [p] int  NULL
)
GO

ALTER TABLE [dbo].[T_yhks_zxnl_tmp] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for T_yhlszs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[T_yhlszs]') AND type IN ('U'))
	DROP TABLE [dbo].[T_yhlszs]
GO

CREATE TABLE [dbo].[T_yhlszs] (
  [id] int  NOT NULL,
  [sfzh] varchar(18) COLLATE Chinese_PRC_CI_AS  NULL,
  [ksxm] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [zygz] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [jdjb] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [zsh] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [bmdw] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [csrq] datetime  NULL,
  [xb] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [whcd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lrcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [sccj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [pdcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [bzrq] datetime  NULL,
  [jdbm] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [dybj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [kspc] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [cdrq] datetime  NULL,
  [nd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lxdh] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [addtime] datetime  NULL,
  [uid] int  NULL
)
GO

ALTER TABLE [dbo].[T_yhlszs] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'序号',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'身份证号',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'sfzh'
GO

EXEC sp_addextendedproperty
'MS_Description', N'考生姓名',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'ksxm'
GO

EXEC sp_addextendedproperty
'MS_Description', N'职业',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'zygz'
GO

EXEC sp_addextendedproperty
'MS_Description', N'鉴定级别',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'jdjb'
GO

EXEC sp_addextendedproperty
'MS_Description', N'证书号',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'zsh'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所在单位',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'bmdw'
GO

EXEC sp_addextendedproperty
'MS_Description', N'出生日期',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'csrq'
GO

EXEC sp_addextendedproperty
'MS_Description', N'性别',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'xb'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文化程度',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'whcd'
GO

EXEC sp_addextendedproperty
'MS_Description', N'理论成绩',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'lrcj'
GO

EXEC sp_addextendedproperty
'MS_Description', N'实操成绩',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'sccj'
GO

EXEC sp_addextendedproperty
'MS_Description', N'评定成绩',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'pdcj'
GO

EXEC sp_addextendedproperty
'MS_Description', N'颁证日期',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'bzrq'
GO

EXEC sp_addextendedproperty
'MS_Description', N'鉴定部门',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'jdbm'
GO

EXEC sp_addextendedproperty
'MS_Description', N'打印标记',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'dybj'
GO

EXEC sp_addextendedproperty
'MS_Description', N'考试批次',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'kspc'
GO

EXEC sp_addextendedproperty
'MS_Description', N'存档日期',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'cdrq'
GO

EXEC sp_addextendedproperty
'MS_Description', N'年度',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'nd'
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系电话',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'lxdh'
GO

EXEC sp_addextendedproperty
'MS_Description', N'录入时间',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'addtime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'录入帐号',
'SCHEMA', N'dbo',
'TABLE', N'T_yhlszs',
'COLUMN', N'uid'
GO


-- ----------------------------
-- Table structure for T_yhlszs_tmp
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[T_yhlszs_tmp]') AND type IN ('U'))
	DROP TABLE [dbo].[T_yhlszs_tmp]
GO

CREATE TABLE [dbo].[T_yhlszs_tmp] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [sfzh] varchar(18) COLLATE Chinese_PRC_CI_AS  NULL,
  [ksxm] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [zygz] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [jdjb] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [zsh] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [bmdw] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [csrq] datetime  NULL,
  [xb] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [whcd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lrcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [sccj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [pdcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [bzrq] datetime  NULL,
  [jdbm] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [dybj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [kspc] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [cdrq] datetime  NULL,
  [nd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lxdh] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [addtime] datetime  NULL,
  [uid] int  NULL
)
GO

ALTER TABLE [dbo].[T_yhlszs_tmp] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for T_yhlszs_zxnl
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[T_yhlszs_zxnl]') AND type IN ('U'))
	DROP TABLE [dbo].[T_yhlszs_zxnl]
GO

CREATE TABLE [dbo].[T_yhlszs_zxnl] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [sfzh] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [ksxm] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [zygz] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [jdjb] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [zsh] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [bmdw] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [csrq] datetime  NULL,
  [xb] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [whcd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lrcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [sccj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [pdcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [bzrq] datetime  NULL,
  [jdbm] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [dybj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [kspc] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [cdrq] datetime  NULL,
  [nd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lxdh] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [uid] int  NULL,
  [addtime] datetime  NULL
)
GO

ALTER TABLE [dbo].[T_yhlszs_zxnl] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for T_yhlszs_zxnl_tmp
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[T_yhlszs_zxnl_tmp]') AND type IN ('U'))
	DROP TABLE [dbo].[T_yhlszs_zxnl_tmp]
GO

CREATE TABLE [dbo].[T_yhlszs_zxnl_tmp] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [sfzh] varchar(18) COLLATE Chinese_PRC_CI_AS  NULL,
  [ksxm] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [zygz] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [jdjb] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [zsh] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [bmdw] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [csrq] datetime  NULL,
  [xb] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [whcd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lrcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [sccj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [pdcj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [bzrq] datetime  NULL,
  [jdbm] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [dybj] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [kspc] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [cdrq] datetime  NULL,
  [nd] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [lxdh] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [uid] int  NULL,
  [addtime] datetime  NULL
)
GO

ALTER TABLE [dbo].[T_yhlszs_zxnl_tmp] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Procedure structure for dt_getobjwithprop_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getobjwithprop_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getobjwithprop_u]
GO

CREATE PROCEDURE [dbo].[dt_getobjwithprop_u]
	@property varchar(30),
	@uvalue nvarchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@uvalue is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and uvalue=@uvalue
GO


-- ----------------------------
-- Procedure structure for dt_getpropertiesbyid_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getpropertiesbyid_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getpropertiesbyid_u]
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid_u]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property
GO


-- ----------------------------
-- Procedure structure for dt_dropuserobjectbyid
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_dropuserobjectbyid]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_dropuserobjectbyid]
GO

CREATE PROCEDURE [dbo].[dt_dropuserobjectbyid]
	@id int
as
	set nocount on
	delete from dbo.dtproperties where objectid=@id
GO


-- ----------------------------
-- Procedure structure for dt_droppropertiesbyid
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_droppropertiesbyid]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_droppropertiesbyid]
GO

CREATE PROCEDURE [dbo].[dt_droppropertiesbyid]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		delete from dbo.dtproperties where objectid=@id
	else
		delete from dbo.dtproperties 
			where objectid=@id and property=@property
GO


-- ----------------------------
-- Procedure structure for dt_verstamp006
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_verstamp006]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_verstamp006]
GO

CREATE PROCEDURE [dbo].[dt_verstamp006]
as
	select 7000
GO


-- ----------------------------
-- Procedure structure for dt_verstamp007
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_verstamp007]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_verstamp007]
GO

CREATE PROCEDURE [dbo].[dt_verstamp007]
as
	select 7005
GO


-- ----------------------------
-- Procedure structure for dt_getpropertiesbyid_vcs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getpropertiesbyid_vcs]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getpropertiesbyid_vcs]
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid_vcs]
    @id       int,
    @property varchar(64),
    @value    varchar(255) = NULL OUT

as

    set nocount on

    select @value = (
        select value
                from dbo.dtproperties
                where @id=objectid and @property=property
                )
GO


-- ----------------------------
-- Procedure structure for dt_displayoaerror
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_displayoaerror]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_displayoaerror]
GO

CREATE PROCEDURE [dbo].[dt_displayoaerror]
    @iObject int,
    @iresult int
as

set nocount on

declare @vchOutput      varchar(255)
declare @hr             int
declare @vchSource      varchar(255)
declare @vchDescription varchar(255)

    exec @hr = master.dbo.sp_OAGetErrorInfo @iObject, @vchSource OUT, @vchDescription OUT

    select @vchOutput = @vchSource + ': ' + @vchDescription
    raiserror (@vchOutput,16,-1)

    return
GO


-- ----------------------------
-- Procedure structure for dt_adduserobject_vcs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_adduserobject_vcs]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_adduserobject_vcs]
GO

CREATE PROCEDURE [dbo].[dt_adduserobject_vcs]
    @vchProperty varchar(64)

as

set nocount on

declare @iReturn int
    /*
    ** Create the user object if it does not exist already
    */
    begin transaction
        select @iReturn = objectid from dbo.dtproperties where property = @vchProperty
        if @iReturn IS NULL
        begin
            insert dbo.dtproperties (property) VALUES (@vchProperty)
            update dbo.dtproperties set objectid=@@identity
                    where id=@@identity and property=@vchProperty
            select @iReturn = @@identity
        end
    commit
    return @iReturn
GO


-- ----------------------------
-- Procedure structure for dt_addtosourcecontrol
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_addtosourcecontrol]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_addtosourcecontrol]
GO

CREATE PROCEDURE [dbo].[dt_addtosourcecontrol]
    @vchSourceSafeINI varchar(255) = '',
    @vchProjectName   varchar(255) ='',
    @vchComment       varchar(255) ='',
    @vchLoginName     varchar(255) ='',
    @vchPassword      varchar(255) =''

as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId = 0

declare @iStreamObjectId int
select @iStreamObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

declare @vchDatabaseName varchar(255)
select @vchDatabaseName = db_name()

declare @iReturnValue int
select @iReturnValue = 0

declare @iPropertyObjectId int
declare @vchParentId varchar(255)

declare @iObjectCount int
select @iObjectCount = 0

    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError


    /* Create Project in SS */
    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'AddProjectToSourceSafe',
											NULL,
											@vchSourceSafeINI,
											@vchProjectName output,
											@@SERVERNAME,
											@vchDatabaseName,
											@vchLoginName,
											@vchPassword,
											@vchComment


    if @iReturn <> 0 GOTO E_OAError

    /* Set Database Properties */

    begin tran SetProperties

    /* add high level object */

    exec @iPropertyObjectId = dbo.dt_adduserobject_vcs 'VCSProjectID'

    select @vchParentId = CONVERT(varchar(255),@iPropertyObjectId)

    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProjectID', @vchParentId , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProject' , @vchProjectName , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSourceSafeINI' , @vchSourceSafeINI , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLServer', @@SERVERNAME, NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLDatabase', @vchDatabaseName, NULL

    if @@error <> 0 GOTO E_General_Error

    commit tran SetProperties
    
    select @iObjectCount = 0;

CleanUp:
    select @vchProjectName
    select @iObjectCount
    return

E_General_Error:
    /* this is an all or nothing.  No specific error messages */
    goto CleanUp

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_checkinobject
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_checkinobject]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_checkinobject]
GO

CREATE PROCEDURE [dbo].[dt_checkinobject]
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255)='',
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     Text = '', /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     Text = '', /* create stream */
    @txStream3     Text = ''  /* grant stream  */


as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0
	declare @iStreamObjectId int

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iPropertyObjectId int
	select @iPropertyObjectId  = 0

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    declare @iReturnValue	  int
    declare @pos			  int
    declare @vchProcLinePiece varchar(255)

    
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        if @iActionFlag = 1
        begin
            /* Procedure Can have up to three streams
            Drop Stream, Create Stream, GRANT stream */

            begin tran compile_all

            /* try to compile the streams */
            exec (@txStream1)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream2)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream3)
            if @@error <> 0 GOTO E_Compile_Fail
        end

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        
        if @iActionFlag = 1
        begin
            
            declare @iStreamLength int
			
			select @pos=1
			select @iStreamLength = datalength(@txStream2)
			
			if @iStreamLength > 0
			begin
			
				while @pos < @iStreamLength
				begin
						
					select @vchProcLinePiece = substring(@txStream2, @pos, 255)
					
					exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
            		if @iReturn <> 0 GOTO E_OAError
            		
					select @pos = @pos + 255
					
				end
            
				exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
														'CheckIn_StoredProcedure',
														NULL,
														@sProjectName = @vchProjectName,
														@sSourceSafeINI = @vchSourceSafeINI,
														@sServerName = @vchServerName,
														@sDatabaseName = @vchDatabaseName,
														@sObjectName = @vchObjectName,
														@sComment = @vchComment,
														@sLoginName = @vchLoginName,
														@sPassword = @vchPassword,
														@iVCSFlags = @iVCSFlags,
														@iActionFlag = @iActionFlag,
														@sStream = ''
                                        
			end
        end
        else
        begin
        
            select colid, text into #ProcLines
            from syscomments
            where id = object_id(@vchObjectName)
            order by colid

            declare @iCurProcLine int
            declare @iProcLines int
            select @iCurProcLine = 1
            select @iProcLines = (select count(*) from #ProcLines)
            while @iCurProcLine <= @iProcLines
            begin
                select @pos = 1
                declare @iCurLineSize int
                select @iCurLineSize = len((select text from #ProcLines where colid = @iCurProcLine))
                while @pos <= @iCurLineSize
                begin                
                    select @vchProcLinePiece = convert(varchar(255),
                        substring((select text from #ProcLines where colid = @iCurProcLine),
                                  @pos, 255 ))
                    exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
                    if @iReturn <> 0 GOTO E_OAError
                    select @pos = @pos + 255                  
                end
                select @iCurProcLine = @iCurProcLine + 1
            end
            drop table #ProcLines

            exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
													'CheckIn_StoredProcedure',
													NULL,
													@sProjectName = @vchProjectName,
													@sSourceSafeINI = @vchSourceSafeINI,
													@sServerName = @vchServerName,
													@sDatabaseName = @vchDatabaseName,
													@sObjectName = @vchObjectName,
													@sComment = @vchComment,
													@sLoginName = @vchLoginName,
													@sPassword = @vchPassword,
													@iVCSFlags = @iVCSFlags,
													@iActionFlag = @iActionFlag,
													@sStream = ''
        end

        if @iReturn <> 0 GOTO E_OAError

        if @iActionFlag = 1
        begin
            commit tran compile_all
            if @@error <> 0 GOTO E_Compile_Fail
        end

    end

CleanUp:
	return

E_Compile_Fail:
	declare @lerror int
	select @lerror = @@error
	rollback tran compile_all
	RAISERROR (@lerror,16,-1)
	goto CleanUp

E_OAError:
	if @iActionFlag = 1 rollback tran compile_all
	exec dbo.dt_displayoaerror @iObjectId, @iReturn
	goto CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_checkoutobject
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_checkoutobject]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_checkoutobject]
GO

CREATE PROCEDURE [dbo].[dt_checkoutobject]
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255),
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId =0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @vchTempText varchar(255)

	/* this is for our strings */
	declare @iStreamObjectId int
	select @iStreamObjectId = 0

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        /* Procedure Can have up to three streams
           Drop Stream, Create Stream, GRANT stream */

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'CheckOut_StoredProcedure',
												NULL,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sComment = @vchComment,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword,
												@iVCSFlags = @iVCSFlags,
												@iActionFlag = @iActionFlag

        if @iReturn <> 0 GOTO E_OAError


        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #commenttext (id int identity, sourcecode varchar(255))


        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #commenttext (sourcecode) select @vchTempText
        end

        select 'VCS'=sourcecode from #commenttext order by id
        select 'SQL'=text from syscomments where id = object_id(@vchObjectName) order by colid

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_isundersourcecontrol
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_isundersourcecontrol]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_isundersourcecontrol]
GO

CREATE PROCEDURE [dbo].[dt_isundersourcecontrol]
    @vchLoginName varchar(255) = '',
    @vchPassword  varchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @iStreamObjectId int
	select @iStreamObjectId   = 0

	declare @vchTempText varchar(255)

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if (@vchProjectName = '')	set @vchProjectName		= null
    if (@vchSourceSafeINI = '') set @vchSourceSafeINI	= null
    if (@vchServerName = '')	set @vchServerName		= null
    if (@vchDatabaseName = '')	set @vchDatabaseName	= null
    
    if (@vchProjectName is null) or (@vchSourceSafeINI is null) or (@vchServerName is null) or (@vchDatabaseName is null)
    begin
        RAISERROR('Not Under Source Control',16,-1)
        return
    end

    if @iWhoToo = 1
    begin

        /* Get List of Procs in the project */
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'GetListOfObjects',
												NULL,
												@vchProjectName,
												@vchSourceSafeINI,
												@vchServerName,
												@vchDatabaseName,
												@vchLoginName,
												@vchPassword

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #ObjectList (id int identity, vchObjectlist varchar(255))

        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #ObjectList (vchObjectlist ) select @vchTempText
        end

        select vchObjectlist from #ObjectList order by id
    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_removefromsourcecontrol
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_removefromsourcecontrol]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_removefromsourcecontrol]
GO

CREATE PROCEDURE [dbo].[dt_removefromsourcecontrol]

as

    set nocount on

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    exec dbo.dt_droppropertiesbyid @iPropertyObjectId, null

    /* -1 is returned by dt_droppopertiesbyid */
    if @@error <> 0 and @@error <> -1 return 1

    return 0
GO


-- ----------------------------
-- Procedure structure for dt_validateloginparams
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_validateloginparams]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_validateloginparams]
GO

CREATE PROCEDURE [dbo].[dt_validateloginparams]
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)
as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchSourceSafeINI varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT

    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError

    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'ValidateLoginParams',
											NULL,
											@sSourceSafeINI = @vchSourceSafeINI,
											@sLoginName = @vchLoginName,
											@sPassword = @vchPassword
    if @iReturn <> 0 GOTO E_OAError

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_vcsenabled
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_vcsenabled]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_vcsenabled]
GO

CREATE PROCEDURE [dbo].[dt_vcsenabled]

as

set nocount on

declare @iObjectId int
select @iObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iReturn int
    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 raiserror('', 16, -1) /* Can't Load Helper DLLC */
GO


-- ----------------------------
-- Procedure structure for dt_whocheckedout
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_whocheckedout]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_whocheckedout]
GO

CREATE PROCEDURE [dbo].[dt_whocheckedout]
        @chObjectType  char(4),
        @vchObjectName varchar(255),
        @vchLoginName  varchar(255),
        @vchPassword   varchar(255)

as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        declare @vchReturnValue varchar(255)
        select @vchReturnValue = ''

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'WhoCheckedOut',
												@vchReturnValue OUT,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword

        if @iReturn <> 0 GOTO E_OAError

        select @vchReturnValue

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp
GO


-- ----------------------------
-- Procedure structure for dt_getpropertiesbyid_vcs_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getpropertiesbyid_vcs_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getpropertiesbyid_vcs_u]
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid_vcs_u]
    @id       int,
    @property varchar(64),
    @value    nvarchar(255) = NULL OUT

as

    -- This procedure should no longer be called;  dt_getpropertiesbyid_vcsshould be called instead.
	-- Calls are forwarded to dt_getpropertiesbyid_vcs to maintain backward compatibility.
	set nocount on
    exec dbo.dt_getpropertiesbyid_vcs
		@id,
		@property,
		@value output
GO


-- ----------------------------
-- Procedure structure for dt_displayoaerror_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_displayoaerror_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_displayoaerror_u]
GO

CREATE PROCEDURE [dbo].[dt_displayoaerror_u]
    @iObject int,
    @iresult int
as
	-- This procedure should no longer be called;  dt_displayoaerror should be called instead.
	-- Calls are forwarded to dt_displayoaerror to maintain backward compatibility.
	set nocount on
	exec dbo.dt_displayoaerror
		@iObject,
		@iresult
GO


-- ----------------------------
-- Procedure structure for dt_addtosourcecontrol_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_addtosourcecontrol_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_addtosourcecontrol_u]
GO

CREATE PROCEDURE [dbo].[dt_addtosourcecontrol_u]
    @vchSourceSafeINI nvarchar(255) = '',
    @vchProjectName   nvarchar(255) ='',
    @vchComment       nvarchar(255) ='',
    @vchLoginName     nvarchar(255) ='',
    @vchPassword      nvarchar(255) =''

as
	-- This procedure should no longer be called;  dt_addtosourcecontrol should be called instead.
	-- Calls are forwarded to dt_addtosourcecontrol to maintain backward compatibility
	set nocount on
	exec dbo.dt_addtosourcecontrol 
		@vchSourceSafeINI, 
		@vchProjectName, 
		@vchComment, 
		@vchLoginName, 
		@vchPassword
GO


-- ----------------------------
-- Procedure structure for dt_checkinobject_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_checkinobject_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_checkinobject_u]
GO

CREATE PROCEDURE [dbo].[dt_checkinobject_u]
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255)='',
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     text = '',  /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     text = '',  /* create stream */
    @txStream3     text = ''   /* grant stream  */

as	
	-- This procedure should no longer be called;  dt_checkinobject should be called instead.
	-- Calls are forwarded to dt_checkinobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkinobject
		@chObjectType,
		@vchObjectName,
		@vchComment,
		@vchLoginName,
		@vchPassword,
		@iVCSFlags,
		@iActionFlag,   
		@txStream1,		
		@txStream2,		
		@txStream3
GO


-- ----------------------------
-- Procedure structure for dt_checkoutobject_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_checkoutobject_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_checkoutobject_u]
GO

CREATE PROCEDURE [dbo].[dt_checkoutobject_u]
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255),
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	-- This procedure should no longer be called;  dt_checkoutobject should be called instead.
	-- Calls are forwarded to dt_checkoutobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkoutobject
		@chObjectType,  
		@vchObjectName, 
		@vchComment,    
		@vchLoginName,  
		@vchPassword,  
		@iVCSFlags,    
		@iActionFlag
GO


-- ----------------------------
-- Procedure structure for dt_isundersourcecontrol_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_isundersourcecontrol_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_isundersourcecontrol_u]
GO

CREATE PROCEDURE [dbo].[dt_isundersourcecontrol_u]
    @vchLoginName nvarchar(255) = '',
    @vchPassword  nvarchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as
	-- This procedure should no longer be called;  dt_isundersourcecontrol should be called instead.
	-- Calls are forwarded to dt_isundersourcecontrol to maintain backward compatibility.
	set nocount on
	exec dbo.dt_isundersourcecontrol
		@vchLoginName,
		@vchPassword,
		@iWhoToo
GO


-- ----------------------------
-- Procedure structure for dt_validateloginparams_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_validateloginparams_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_validateloginparams_u]
GO

CREATE PROCEDURE [dbo].[dt_validateloginparams_u]
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)
as

	-- This procedure should no longer be called;  dt_validateloginparams should be called instead.
	-- Calls are forwarded to dt_validateloginparams to maintain backward compatibility.
	set nocount on
	exec dbo.dt_validateloginparams
		@vchLoginName,
		@vchPassword
GO


-- ----------------------------
-- Procedure structure for dt_whocheckedout_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_whocheckedout_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_whocheckedout_u]
GO

CREATE PROCEDURE [dbo].[dt_whocheckedout_u]
        @chObjectType  char(4),
        @vchObjectName nvarchar(255),
        @vchLoginName  nvarchar(255),
        @vchPassword   nvarchar(255)

as

	-- This procedure should no longer be called;  dt_whocheckedout should be called instead.
	-- Calls are forwarded to dt_whocheckedout to maintain backward compatibility.
	set nocount on
	exec dbo.dt_whocheckedout
		@chObjectType, 
		@vchObjectName,
		@vchLoginName, 
		@vchPassword
GO


-- ----------------------------
-- Function structure for fn_SJ
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_SJ]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP FUNCTION[dbo].[fn_SJ]
GO

CREATE FUNCTION [dbo].[fn_SJ](@ID Varchar(15))
Returns Varchar(18)
As
Begin
If Len(@ID)!=15
Return Null
Declare @SFZ Varchar(18)
Set @SFZ=Left(@ID,6)+'19'+Right(@ID,9)
Declare @Q Varchar(17),@YZM Varchar(1)
Set @Q='1,0,X,9,8,7,6,5,4,3,2,'
Declare @X Varchar(40)
Set @X='7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,'
Declare @S int,@I int
Set @S=0
Set @I=1
While @I<18
Begin
Set @S=@S+Convert(int,SUBSTRING(@SFZ,@I,1))*Left(@X,CharIndex(',',@X)-1)
Set @X=Substring(@X,CharIndex(',',@X)+1,40)
Set @I=@I+1
End
Set @S=@S%11
Set @YZM=Substring(@Q,CharIndex(',' ,@Q ,@S*2)+1 ,1)
Return @SFZ+@YZM
End
GO


-- ----------------------------
-- Function structure for id15to18
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[id15to18]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP FUNCTION[dbo].[id15to18]
GO

CREATE FUNCTION [dbo].[id15to18] (@id15 char(15)) 
returns char(18)
as 
begin 
declare @id18 char(18)
declare @s1 as integer
declare @s2 as integer
declare @s3 as integer
declare @s4 as integer
declare @s5 as integer
declare @s6 as integer
declare @s7 as integer
declare @s8 as integer
declare @s9 as integer
declare @s10 as integer
declare @s11 as integer
declare @s12 as integer
declare @s13 as integer
declare @s14 as integer
declare @s15 as integer
declare @s16 as integer
declare @s17 as integer
declare @s18 as integer
set @s1=substring(@id15,1,1)
set @s2=substring(@id15,2,1)
set @s3=substring(@id15,3,1)
set @s4=substring(@id15,4,1)
set @s5=substring(@id15,5,1)
set @s6=substring(@id15,6,1)
set @s7=1
set @s8=9
set @s9=substring(@id15,7,1)
set @s10=substring(@id15,8,1)
set @s11=substring(@id15,9,1)
set @s12=substring(@id15,10,1)
set @s13=substring(@id15,11,1)
set @s14=substring(@id15,12,1)
set @s15=substring(@id15,13,1)
set @s16=substring(@id15,14,1)
set @s17=substring(@id15,15,1)
set @s18=((@s1*7)+(@s2*9)+(@s3*10)+(@s4*5)+(@s5*8)+(@s6*4)+(@s7*2)+(@s8*1)
+(@s9*6)+(@s10*3)+(@s11*7)+(@s12*9)+(@s13*10)+(@s14*5)+(@s15*8)+(@s16
*4)+(@s17*2))%11
set @id18=substring(@id15,1,6)+'19'+substring(@id15,7,9)
+case when @s18=0 then '1'
when @s18=1 then '0'
when @s18=2 then 'X'
when @s18=3 then '9'
when @s18=4 then '8'
when @s18=5 then '7'
when @s18=6 then '6'
when @s18=7 then '5'
when @s18=8 then '4'
when @s18=9 then '3'
when @s18=10 then '2'
end
return @id18
end
GO


-- ----------------------------
-- Procedure structure for dt_generateansiname
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_generateansiname]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_generateansiname]
GO

CREATE PROCEDURE [dbo].[dt_generateansiname](@name varchar(255) output) 
as 
	declare @prologue varchar(20) 
	declare @indexstring varchar(20) 
	declare @index integer 
 
	set @prologue = 'MSDT-A-' 
	set @index = 1 
 
	while 1 = 1 
	begin 
		set @indexstring = cast(@index as varchar(20)) 
		set @name = @prologue + @indexstring 
		if not exists (select value from dtproperties where value = @name) 
			break 
		 
		set @index = @index + 1 
 
		if (@index = 10000) 
			goto TooMany 
	end 
 
Leave: 
 
	return 
 
TooMany: 
 
	set @name = 'DIAGRAM' 
	goto Leave
GO


-- ----------------------------
-- Procedure structure for dt_adduserobject
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_adduserobject]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_adduserobject]
GO

CREATE PROCEDURE [dbo].[dt_adduserobject]
as
	set nocount on
	/*
	** Create the user object if it does not exist already
	*/
	begin transaction
		insert dbo.dtproperties (property) VALUES ('DtgSchemaOBJECT')
		update dbo.dtproperties set objectid=@@identity 
			where id=@@identity and property='DtgSchemaOBJECT'
	commit
	return @@identity
GO


-- ----------------------------
-- Procedure structure for dt_setpropertybyid
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_setpropertybyid]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_setpropertybyid]
GO

CREATE PROCEDURE [dbo].[dt_setpropertybyid]
	@id int,
	@property varchar(64),
	@value varchar(255),
	@lvalue image
as
	set nocount on
	declare @uvalue nvarchar(255) 
	set @uvalue = convert(nvarchar(255), @value) 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@value, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @value, @uvalue, @lvalue)
	end
GO


-- ----------------------------
-- Procedure structure for dt_getobjwithprop
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getobjwithprop]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getobjwithprop]
GO

CREATE PROCEDURE [dbo].[dt_getobjwithprop]
	@property varchar(30),
	@value varchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@value is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and value=@value
GO


-- ----------------------------
-- Procedure structure for dt_getpropertiesbyid
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_getpropertiesbyid]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_getpropertiesbyid]
GO

CREATE PROCEDURE [dbo].[dt_getpropertiesbyid]
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property
GO


-- ----------------------------
-- Procedure structure for dt_setpropertybyid_u
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_setpropertybyid_u]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[dt_setpropertybyid_u]
GO

CREATE PROCEDURE [dbo].[dt_setpropertybyid_u]
	@id int,
	@property varchar(64),
	@uvalue nvarchar(255),
	@lvalue image
as
	set nocount on
	-- 
	-- If we are writing the name property, find the ansi equivalent. 
	-- If there is no lossless translation, generate an ansi name. 
	-- 
	declare @avalue varchar(255) 
	set @avalue = null 
	if (@uvalue is not null) 
	begin 
		if (convert(nvarchar(255), convert(varchar(255), @uvalue)) = @uvalue) 
		begin 
			set @avalue = convert(varchar(255), @uvalue) 
		end 
		else 
		begin 
			if 'DtgSchemaNAME' = @property 
			begin 
				exec dbo.dt_generateansiname @avalue output 
			end 
		end 
	end 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@avalue, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @avalue, @uvalue, @lvalue)
	end
GO


-- ----------------------------
-- Primary Key structure for table dtproperties
-- ----------------------------
ALTER TABLE [dbo].[dtproperties] ADD CONSTRAINT [pk_dtproperties] PRIMARY KEY CLUSTERED ([id], [property])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table T_yhks
-- ----------------------------
ALTER TABLE [dbo].[T_yhks] ADD CONSTRAINT [PK_T_yhks] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table T_yhks_tmp
-- ----------------------------
ALTER TABLE [dbo].[T_yhks_tmp] ADD CONSTRAINT [PK_T_yhks_tmp] PRIMARY KEY CLUSTERED ([sfzh])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table T_yhks_zxnl
-- ----------------------------
ALTER TABLE [dbo].[T_yhks_zxnl] ADD CONSTRAINT [PK_T_yhks_zxnl] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table T_yhks_zxnl_tmp
-- ----------------------------
ALTER TABLE [dbo].[T_yhks_zxnl_tmp] ADD CONSTRAINT [PK_T_yhks_zxnl_tmp] PRIMARY KEY CLUSTERED ([sfzh])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table T_yhlszs
-- ----------------------------
ALTER TABLE [dbo].[T_yhlszs] ADD CONSTRAINT [PK_T_yhlszs] PRIMARY KEY CLUSTERED ([zsh])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table T_yhlszs_tmp
-- ----------------------------
ALTER TABLE [dbo].[T_yhlszs_tmp] ADD CONSTRAINT [PK_T_yhlszs_tmp] PRIMARY KEY CLUSTERED ([zsh])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table T_yhlszs_zxnl
-- ----------------------------
ALTER TABLE [dbo].[T_yhlszs_zxnl] ADD CONSTRAINT [PK_T_yhlszs_zxnl] PRIMARY KEY CLUSTERED ([zsh])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table T_yhlszs_zxnl_tmp
-- ----------------------------
ALTER TABLE [dbo].[T_yhlszs_zxnl_tmp] ADD CONSTRAINT [PK_T_yhlszs_zxnl_tmp] PRIMARY KEY CLUSTERED ([zsh])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

