﻿
USE [TAC_KANBAN]
GO

------------------------------[FORECAST_ORDER]--------------------------------------
CREATE TABLE [dbo].[FORECAST_ORDER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_ID] [int] NULL,
	[MODEL_STRUCTURE_ID] [int] NULL,
	[STATUS] [nvarchar](10) NULL,
	[QUANTITY] [int] NULL,
	[MONTH_START] [int] NULL,
	[MONTH_END] [int] NULL,
	[YEAR] [int] NULL,
 CONSTRAINT [PK_FORECAST_ORDER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[FORECAST_ORDER_DETAIL]--------------------------------------

CREATE TABLE [dbo].[FORECAST_ORDER_DETAIL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MONTH] [int] NULL,
	[FORECAST_QTY] [int] NULL,
	[PLAN_QTY] [int] NULL,
	[FORCAST_ID] [int] NULL,
 CONSTRAINT [PK_FORECAST_ORDER_DETAIL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

------------------------------[PLAN_EXT]--------------------------------------
CREATE TABLE [dbo].[PLAN_EXT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KANBAN_ID] [int] NULL,
	[MODEL_STRUCTURE_ID] [int] NULL,
	[LOT_NO] [nvarchar](50) NULL,
	[LINE_ID] [int] NULL,
	[START_DATE] [datetime] NULL,
	[END_DATE] [datetime] NULL,
	[STATUS] [nchar](10) NULL,
	[MANUAL] [bit] null,
	[CAR_SIZE] [int] null,
	[LOT_SIZE] [int] null,
	[CIRCLE_TIME] [int] null,
	[UPDATE_BY] [int] null,
	[UPDATE_DATE] [datetime] null,
 CONSTRAINT [PK_BOM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO

------------------------------[PLAN_FIN]--------------------------------------

CREATE TABLE [dbo].[PLAN_FIN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_ID] int NULL,
	[MODEL_STRUCTURE_ID] [int] NULL,
	[STATUS] nvarchar(10) NULL,
	[QUANTITY] int NULL,
	[MONTH_START] int NULL,	
	[MONTH_END] int NULL,
	[YEAR] int NULL,
	[UPDATE_BY] [int] NULL,
	[UPDATE_DATE] [date] NULL,
 CONSTRAINT [PK_PLAN_FIN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

GO



------------------------------[KANBAN_EXT]--------------------------------------
CREATE TABLE [dbo].[KANBAN_EXT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TAG_ID] [nvarchar](50) NULL,
	[MODEL_STRUCTURE_ID] [int] NULL,
	[FORECAST_ID] [int] NULL,
	[QUANTITY] [int] NULL,
	[STATUS] [nchar](10) NULL,
	[LOST_SIZE] [int] NULL,
	[CIRCLE] [int]NULL,
 CONSTRAINT [PK_KANBAN_EXT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

------------------------------[EXT_WORK_ORDER]--------------------------------------
CREATE TABLE [dbo].[EXT_WORK_ORDER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KANBAN_ID] [int] NULL,
	[TAG_ID] [nvarchar](50) NULL,
	[MODEL_STRUCTURE_ID] [int] NULL,
	[ACTUAL_QTY] [nvarchar](10) NULL,
	[LINE_ID] [int] NULL,
	[START_TIME] [datetime] NULL,
	[ESTIMATE_END_TIME] [datetime] NULL,
	[ACTUAL_END_TIME] [datetime] NULL,
	[WORK_BY] [int] NULL,
	[STATUS] [nvarchar](10) NULL,
	[PD] [nvarchar](10) NULL,
 CONSTRAINT [PK_EXT_WORK_ORDER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[EXT_WORK_ORDER_DERAIL]--------------------------------------
CREATE TABLE [dbo].[EXT_WORK_ORDER_DERAIL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WORK_ORDER_ID] [int] NULL,
	[LOST_TIME_ID] [int] NULL,
 CONSTRAINT [PK_EXT_WORK_ORDER_DERAIL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[EXT_STOCK]--------------------------------------
CREATE TABLE [dbo].[EXT_STOCK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WORK_ORDER_ID] [int] NULL,
	[STOCK_IN] [int] NULL,
	[STOCK_OUT] [int] NULL,
	[ACC_STOCK_ID] [int] NULL,
	[IN_DATE] [datetime] NULL,
	[IN_BY] [int] NULL,
	[OUT_DATE] [datetime] NULL,
	[OUT_BY] [int] NULL,
	[MANUAL] [bit] NULL,
 CONSTRAINT [PK_EXT_STOCK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[FIN_WORK_ORDER]--------------------------------------
CREATE TABLE [dbo].[FIN_WORK_ORDER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WORK_ORDER_ID] [int] NULL,
	[TAG_ID] [nvarchar](50) NULL,
	[MODEL_STRUCTURE_ID] [int] NULL,
	[ACTUAL_QTY] [nvarchar](10) NULL,
	[LINE_ID] [int] NULL,
	[START_TIME] [datetime] NULL,
	[ESTIMATE_END_TIME] [datetime] NULL,
	[ACTUAL_END_TIME] [datetime] NULL,
	[WORK_BY] [int] NULL,
	[STATUS] [nvarchar](10) NULL,
	[PD] [nvarchar](10) NULL,
 CONSTRAINT [PK_FIN_WORK_ORDER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[FIN_STOCK]--------------------------------------
CREATE TABLE [dbo].[FIN_STOCK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WORK_ORDER_ID] [int] NULL,
	[STOCK_IN] [int] NULL,
	[STOCK_OUT] [int] NULL,
	[ACC_STOCK_ID] [int] NULL,
	[IN_DATE] [datetime] NULL,
	[IN_BY] [int] NULL,
	[OUT_DATE] [datetime] NULL,
	[OUT_BY] [int] NULL,
	[MANUAL] [bit] NULL,
 CONSTRAINT [PK_FIN_STOCK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[ACCUMULATE_STOCK]--------------------------------------
CREATE TABLE [dbo].[ACCUMULATE_STOCK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MODEL_STRUCTURE__ID] [int] NULL,
	[PLAN_IN] [int] NULL,
	[ACTUAL_IN] [int] NULL,
	[PLAN_OUT] [int] NULL,
	[ACTUAL_OUT] [int] NULL,
	[IN_DATE] [datetime] NULL,
	[IN_BY] [int] NULL,
	[OUT_DATE] [datetime] NULL,
	[OUT_BY] [int] NULL,
 CONSTRAINT [PK_ACCUMULATE_STOCK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

------------------------------[STD_STOCK]--------------------------------------
GO
CREATE TABLE [dbo].[STD_STOCK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FORCAST_ORDER_ID] [int] NULL,
	[MODEL_STRUCTURE_ID] [int] NULL,
	[MIN_STOCK_PCS] [int] NULL,
	[MIN_STOCK_DAYS] [int] NULL,
	[MAX_STOCK_PCS] [int] NULL,
	[MAX_STOCK_DAYS] [int] NULL,
	[LOT_SIZE] [int] NULL,
	[MONTH_STOCK] [int] NULL,
 CONSTRAINT [PK_	STD_STOCK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/*---------------------------- MASTER DATA--------------------------------------*/
/*                                                                              */
/*---------------------------- MASTER DATA--------------------------------------*/

------------------------------[MA_MODEL]--------------------------------------
CREATE TABLE [dbo].[MA_MODEL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MODEL_NAME] [nvarchar](50) NULL,
	[CUSTOMER_ID] [int] NULL,
	[PREFIX] [varchar](10) NULL,
 CONSTRAINT [PK_MA_MODEL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[MA_PART]--------------------------------------
CREATE TABLE [dbo].[MA_PART](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PART_NAME] [nvarchar](50) NULL,
	[PART_NO] [nvarchar](50) NULL,
	[PROD_LENGTH] [int] NULL,
	[PART_TYPE] [nvarchar](1) NULL,
	[UNIT_QTY] [int] NULL,
 CONSTRAINT [PK_MA_PART] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

------------------------------[MA_CUSTOMER]--------------------------------------
CREATE TABLE [dbo].[MA_CUSTOMER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_NAME] [nvarchar](50) NULL,
	[CUSTOMER_SHOT] [nvarchar](10) NULL,
 CONSTRAINT [PK_MA_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[MA_MODEL_STRUCTURE]--------------------------------------
CREATE TABLE [dbo].[MA_MODEL_STRUCTURE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PART_ID] int NULL,
	[MODEL_ID] int NULL,
	[LINE_SPEED] int NULL,
	[LOT_SIZE] int NULL,
 CONSTRAINT [PK_MODEL_STRUCTURE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[EXT_FIN_MAPPING_PART]--------------------------------------
CREATE TABLE [dbo].[EXT_FIN_MAPPING_PART](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EXT_PART_NO] [nvarchar](50) NULL,
	[FIN_PART_NO] [nvarchar](50) NULL,
	[EXT_UNIT_PER_FIN_UNIT] int NULL,
 CONSTRAINT [PK_FIN_MAPPING_PART] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[MA_LINE]--------------------------------------
CREATE TABLE [dbo].[MA_LINE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LINE_NAME] [nvarchar](10) NULL,
	[FACTORY_ID] [int] NULL,
 CONSTRAINT [PK_MA_LINE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[MA_LOSTTIME]--------------------------------------
CREATE TABLE [dbo].[MA_LOSTTIME](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPTION] [nvarchar](50) NULL,
	[LISTTIME] [int] NULL,
 CONSTRAINT [PK_MA_LOSTTIME] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[MA_OPT_ROLE]--------------------------------------
CREATE TABLE [dbo].[MA_OPT_ROLE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ROLE_NAME] [nvarchar](10) NULL,
	[DESCRIPTION] [nvarchar](10) NULL,
 CONSTRAINT [PK_MA_OPT_ROLE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------[MA_OPT_USER]--------------------------------------
CREATE TABLE [dbo].[MA_OPT_USER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_NAME] [nvarchar](50) NULL,
	[PASSWORD] [nvarchar](10) NULL,
	[ROLE_ID] [int] NULL,
	[USER_CODE] [nvarchar](20) NULL,
	[IMAGE] [image] NULL,
 CONSTRAINT [PK_MA_OPT_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


/*---------------------------Relationship----------------------------------*/
/*                                                                         */
/*---------------------------Relationship----------------------------------*/

------------------------------[FORECAST_ORDER]--------------------------------------

ALTER TABLE [dbo].[FORECAST_ORDER]  WITH CHECK ADD  CONSTRAINT [FK_FORECAST_ORDER_MA_CUSTOMER] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[MA_CUSTOMER] ([ID])
GO

ALTER TABLE [dbo].[FORECAST_ORDER] CHECK CONSTRAINT [FK_FORECAST_ORDER_MA_CUSTOMER]
GO

ALTER TABLE [dbo].[FORECAST_ORDER]  WITH CHECK ADD  CONSTRAINT [FK_FORECAST_ORDER_MA_MODEL_STRUCTURE] FOREIGN KEY([MODEL_STRUCTURE_ID])
REFERENCES [dbo].[MA_MODEL_STRUCTURE] ([ID])
GO

ALTER TABLE [dbo].[FORECAST_ORDER] CHECK CONSTRAINT [FK_FORECAST_ORDER_MA_MODEL_STRUCTURE]
GO

------------------------------[FORECAST_ORDER_DETAIL]--------------------------------------

ALTER TABLE [dbo].[FORECAST_ORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_FORECAST_ORDER_DETAIL_FORECAST_ORDER] FOREIGN KEY([FORCAST_ID])
REFERENCES [dbo].[FORECAST_ORDER] ([ID])
GO

ALTER TABLE [dbo].[FORECAST_ORDER_DETAIL] CHECK CONSTRAINT [FK_FORECAST_ORDER_DETAIL_FORECAST_ORDER]
GO

------------------------------[PLAN_EXT]--------------------------------------

ALTER TABLE [dbo].[PLAN_EXT]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_EXT_KANBAN_EXT] FOREIGN KEY([KANBAN_ID])
REFERENCES [dbo].[KANBAN_EXT] ([ID])
GO

ALTER TABLE [dbo].[PLAN_EXT] CHECK CONSTRAINT [FK_PLAN_EXT_KANBAN_EXT]
GO

ALTER TABLE [dbo].[PLAN_EXT]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_EXT_MA_MODEL_STRUCTURE] FOREIGN KEY([MODEL_STRUCTURE_ID])
REFERENCES [dbo].[MA_MODEL_STRUCTURE] ([ID])
GO

ALTER TABLE [dbo].[PLAN_EXT] CHECK CONSTRAINT [FK_PLAN_EXT_MA_MODEL_STRUCTURE]
GO

ALTER TABLE [dbo].[PLAN_EXT]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_EXT_MA_LINE] FOREIGN KEY([LINE_ID])
REFERENCES [dbo].[MA_LINE] ([ID])
GO

ALTER TABLE [dbo].[PLAN_EXT] CHECK CONSTRAINT [FK_PLAN_EXT_MA_LINE]
GO

------------------------------[KANBAN_EXT]--------------------------------------

ALTER TABLE [dbo].[KANBAN_EXT]  WITH CHECK ADD  CONSTRAINT [FK_KANBAN_EXT_MA_MODEL_STRUCTURE] FOREIGN KEY([MODEL_STRUCTURE_ID])
REFERENCES [dbo].[MA_MODEL_STRUCTURE] ([ID])
GO

ALTER TABLE [dbo].[KANBAN_EXT] CHECK CONSTRAINT [FK_KANBAN_EXT_MA_MODEL_STRUCTURE]
GO

ALTER TABLE [dbo].[KANBAN_EXT]  WITH CHECK ADD  CONSTRAINT [FK_KANBAN_EXT_FORECAST_ORDER] FOREIGN KEY([FORECAST_ID])
REFERENCES [dbo].[FORECAST_ORDER] ([ID])
GO

ALTER TABLE [dbo].[KANBAN_EXT] CHECK CONSTRAINT [FK_KANBAN_EXT_FORECAST_ORDER]
GO

------------------------------[EXT_WORK_ORDER]--------------------------------------

ALTER TABLE [dbo].[EXT_WORK_ORDER]  WITH CHECK ADD  CONSTRAINT [FK_EXT_WORK_ORDER_KANBAN_EXT] FOREIGN KEY([KANBAN_ID])
REFERENCES [dbo].[KANBAN_EXT] ([ID])
GO

ALTER TABLE [dbo].[EXT_WORK_ORDER] CHECK CONSTRAINT [FK_EXT_WORK_ORDER_KANBAN_EXT]
GO

ALTER TABLE [dbo].[EXT_WORK_ORDER]  WITH CHECK ADD  CONSTRAINT [FK_EXT_WORK_ORDER_MA_MODEL_STRUCTURE] FOREIGN KEY([MODEL_STRUCTURE_ID])
REFERENCES [dbo].[MA_MODEL_STRUCTURE] ([ID])
GO

ALTER TABLE [dbo].[EXT_WORK_ORDER] CHECK CONSTRAINT [FK_EXT_WORK_ORDER_MA_MODEL_STRUCTURE]
GO

ALTER TABLE [dbo].[EXT_WORK_ORDER]  WITH CHECK ADD  CONSTRAINT [FK_EXT_WORK_ORDER_MA_LINE] FOREIGN KEY([LINE_ID])
REFERENCES [dbo].[MA_LINE] ([ID])
GO

ALTER TABLE [dbo].[EXT_WORK_ORDER] CHECK CONSTRAINT [FK_EXT_WORK_ORDER_MA_LINE]
GO

ALTER TABLE [dbo].[EXT_WORK_ORDER]  WITH CHECK ADD  CONSTRAINT [FK_EXT_WORK_ORDER_MA_OPT_USER] FOREIGN KEY([WORK_BY])
REFERENCES [dbo].[MA_OPT_USER] ([ID])
GO

ALTER TABLE [dbo].[EXT_WORK_ORDER] CHECK CONSTRAINT [FK_EXT_WORK_ORDER_MA_OPT_USER]
GO

------------------------------[EXT_WORK_ORDER_DERAIL]--------------------------------------

ALTER TABLE [dbo].[EXT_WORK_ORDER_DERAIL]  WITH CHECK ADD  CONSTRAINT [FK_EXT_WORK_ORDER_DERAIL_EXT_WORK_ORDER] FOREIGN KEY([WORK_ORDER_ID])
REFERENCES [dbo].[EXT_WORK_ORDER] ([ID])
GO

ALTER TABLE [dbo].[EXT_WORK_ORDER_DERAIL] CHECK CONSTRAINT [FK_EXT_WORK_ORDER_DERAIL_EXT_WORK_ORDER]
GO

ALTER TABLE [dbo].[EXT_WORK_ORDER_DERAIL]  WITH CHECK ADD  CONSTRAINT [FK_EXT_WORK_ORDER_DERAIL_MA_LOSTTIME] FOREIGN KEY([LOST_TIME_ID])
REFERENCES [dbo].[MA_LOSTTIME] ([ID])
GO

ALTER TABLE [dbo].[EXT_WORK_ORDER_DERAIL] CHECK CONSTRAINT [FK_EXT_WORK_ORDER_DERAIL_MA_LOSTTIME]
GO

------------------------------[EXT_STOCK]--------------------------------------

ALTER TABLE [dbo].[EXT_STOCK]  WITH CHECK ADD  CONSTRAINT [FK_EXT_STOCK_EXT_WORK_ORDER] FOREIGN KEY([WORK_ORDER_ID])
REFERENCES [dbo].[EXT_WORK_ORDER] ([ID])
GO

ALTER TABLE [dbo].[EXT_STOCK] CHECK CONSTRAINT [FK_EXT_STOCK_EXT_WORK_ORDER]
GO

ALTER TABLE [dbo].[EXT_STOCK]  WITH CHECK ADD  CONSTRAINT [FK_EXT_STOCK_EXT_ACCUMULATE_STOCK] FOREIGN KEY([ACC_STOCK_ID])
REFERENCES [dbo].[ACCUMULATE_STOCK] ([ID])
GO

ALTER TABLE [dbo].[EXT_STOCK] CHECK CONSTRAINT [FK_EXT_STOCK_EXT_ACCUMULATE_STOCK]
GO

------------------------------[FIN_WORK_ORDER]--------------------------------------

ALTER TABLE [dbo].[FIN_WORK_ORDER]  WITH CHECK ADD  CONSTRAINT [FK_FIN_WORK_ORDER_EXT_WORK_ORDER] FOREIGN KEY([WORK_ORDER_ID])
REFERENCES [dbo].[EXT_WORK_ORDER] ([ID])
GO

ALTER TABLE [dbo].[FIN_WORK_ORDER] CHECK CONSTRAINT [FK_FIN_WORK_ORDER_EXT_WORK_ORDER]
GO

ALTER TABLE [dbo].[FIN_WORK_ORDER]  WITH CHECK ADD  CONSTRAINT [FK_FIN_WORK_ORDER_MA_MODEL_STRUCTURE] FOREIGN KEY([MODEL_STRUCTURE_ID])
REFERENCES [dbo].[MA_MODEL_STRUCTURE] ([ID])
GO

ALTER TABLE [dbo].[FIN_WORK_ORDER] CHECK CONSTRAINT [FK_FIN_WORK_ORDER_MA_MODEL_STRUCTURE]
GO

ALTER TABLE [dbo].[FIN_WORK_ORDER]  WITH CHECK ADD  CONSTRAINT [FK_FIN_WORK_ORDER_MA_LINE] FOREIGN KEY([LINE_ID])
REFERENCES [dbo].[MA_LINE] ([ID])
GO

ALTER TABLE [dbo].[FIN_WORK_ORDER] CHECK CONSTRAINT [FK_FIN_WORK_ORDER_MA_LINE]
GO

ALTER TABLE [dbo].[FIN_WORK_ORDER]  WITH CHECK ADD  CONSTRAINT [FK_FIN_WORK_ORDER_MA_OPT_USER] FOREIGN KEY([WORK_BY])
REFERENCES [dbo].[MA_OPT_USER] ([ID])
GO

ALTER TABLE [dbo].[FIN_WORK_ORDER] CHECK CONSTRAINT [FK_FIN_WORK_ORDER_MA_OPT_USER]
GO

------------------------------[FIN_STOCK]--------------------------------------

ALTER TABLE [dbo].[FIN_STOCK]  WITH CHECK ADD  CONSTRAINT [FK_FIN_STOCK_EXT_WORK_ORDER] FOREIGN KEY([WORK_ORDER_ID])
REFERENCES [dbo].[EXT_WORK_ORDER] ([ID])
GO

ALTER TABLE [dbo].[FIN_STOCK] CHECK CONSTRAINT [FK_FIN_STOCK_EXT_WORK_ORDER]
GO

ALTER TABLE [dbo].[FIN_STOCK]  WITH CHECK ADD  CONSTRAINT [FK_FIN_STOCK_EXT_ACCUMULATE_STOCK] FOREIGN KEY([ACC_STOCK_ID])
REFERENCES [dbo].[ACCUMULATE_STOCK] ([ID])
GO

ALTER TABLE [dbo].[FIN_STOCK] CHECK CONSTRAINT [FK_FIN_STOCK_EXT_ACCUMULATE_STOCK]
GO

------------------------------[MA_MODEL]--------------------------------------

ALTER TABLE [dbo].[MA_MODEL]  WITH CHECK ADD  CONSTRAINT [FK_MA_MODEL_MA_CUSTOMER] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[MA_CUSTOMER] ([ID])
GO

ALTER TABLE [dbo].[MA_MODEL] CHECK CONSTRAINT [FK_MA_MODEL_MA_CUSTOMER]
GO


------------------------------[MA_OPT_USER]--------------------------------------

ALTER TABLE [dbo].[MA_OPT_USER]  WITH CHECK ADD  CONSTRAINT [FK_MA_OPT_USER_MA_OPT_ROLE] FOREIGN KEY([ROLE_ID])
REFERENCES [dbo].[MA_OPT_ROLE] ([ID])
GO

ALTER TABLE [dbo].[MA_OPT_USER] CHECK CONSTRAINT [FK_MA_OPT_USER_MA_OPT_ROLE]
GO

------------------------------[MA_MODEL_STRUCTURE]--------------------------------------

ALTER TABLE [dbo].[MA_MODEL_STRUCTURE]  WITH CHECK ADD  CONSTRAINT [FK_MA_MODEL_STRUCTURE_MA_PART] FOREIGN KEY([PART_ID])
REFERENCES [dbo].[MA_PART] ([ID])
GO

ALTER TABLE [dbo].[MA_MODEL_STRUCTURE] CHECK CONSTRAINT [FK_MA_MODEL_STRUCTURE_MA_PART]
GO

ALTER TABLE [dbo].[MA_MODEL_STRUCTURE]  WITH CHECK ADD  CONSTRAINT [FK_MA_MODEL_STRUCTURE_MA_MODEL] FOREIGN KEY([MODEL_ID])
REFERENCES [dbo].[MA_MODEL] ([ID])
GO

ALTER TABLE [dbo].[MA_MODEL_STRUCTURE] CHECK CONSTRAINT [FK_MA_MODEL_STRUCTURE_MA_MODEL]
GO

------------------------------[PLAN_FIN]--------------------------------------
ALTER TABLE [dbo].[PLAN_FIN]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_FIN_MA_LINE] FOREIGN KEY([LINE_ID])
REFERENCES [dbo].[MA_LINE] ([ID])
GO

ALTER TABLE [dbo].[PLAN_FIN] CHECK CONSTRAINT [FK_PLAN_FIN_MA_LINE]
GO

ALTER TABLE [dbo].[PLAN_FIN]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_FIN_MA_MODEL_STRUCTURE] FOREIGN KEY([MODEL_STRUCTURE_ID])
REFERENCES [dbo].[MA_MODEL_STRUCTURE] ([ID])
GO

ALTER TABLE [dbo].[PLAN_FIN] CHECK CONSTRAINT [FK_PLAN_FIN_MA_MODEL_STRUCTURE]
GO

ALTER TABLE [dbo].[PLAN_FIN]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_FIN_MA_OPT_USER] FOREIGN KEY([UPDATE_BY])
REFERENCES [dbo].[MA_OPT_USER] ([ID])
GO

ALTER TABLE [dbo].[PLAN_FIN] CHECK CONSTRAINT [FK_PLAN_FIN_MA_OPT_USER]
GO

------------------------------[STD_STOCK]--------------------------------------
ALTER TABLE [dbo].[STD_STOCK]  WITH CHECK ADD  CONSTRAINT [FK_STD_STOCK_FORECAST_ORDER] FOREIGN KEY([FORCAST_ORDER_ID])
REFERENCES [dbo].[FORECAST_ORDER] ([ID])
GO

ALTER TABLE [dbo].[STD_STOCK] CHECK CONSTRAINT [FK_STD_STOCK_FORECAST_ORDER]
GO

ALTER TABLE [dbo].[STD_STOCK]  WITH CHECK ADD  CONSTRAINT [FK_STD_STOCK_MA_MODEL_STRUCTURE] FOREIGN KEY([MODEL_STRUCTURE_ID])
REFERENCES [dbo].[MA_MODEL_STRUCTURE] ([ID])
GO

ALTER TABLE [dbo].[STD_STOCK] CHECK CONSTRAINT [FK_STD_STOCK_MA_MODEL_STRUCTURE]
GO
------------------------------[EXT_FIN_MAPPING_PART]--------------------------------------
/*
ALTER TABLE [dbo].[EXT_FIN_MAPPING_PART]  WITH CHECK ADD  CONSTRAINT [FK_EXT_FIN_MAPPING_PART_MA_PART_EXT] FOREIGN KEY([EXT_PART_NO])
REFERENCES [dbo].[MA_PART] ([PART_NO])
GO

ALTER TABLE [dbo].[EXT_FIN_MAPPING_PART] CHECK CONSTRAINT [FK_EXT_FIN_MAPPING_PART_MA_PART_EXT]
GO


ALTER TABLE [dbo].[EXT_FIN_MAPPING_PART]  WITH CHECK ADD  CONSTRAINT [FK_EXT_FIN_MAPPING_PART_MA_PART_FIN] FOREIGN KEY([FIN_PART_NO])
REFERENCES [dbo].[MA_PART] ([PART_NO])
GO

ALTER TABLE [dbo].[EXT_FIN_MAPPING_PART] CHECK CONSTRAINT [FK_EXT_FIN_MAPPING_PART_MA_PART_FIN]
GO
*/









