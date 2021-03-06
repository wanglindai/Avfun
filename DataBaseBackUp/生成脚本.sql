USE [avfun]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 05/25/2014 21:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USER](
	[u_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [uniqueidentifier] NOT NULL,
	[user_account] [char](64) NOT NULL,
	[user_password] [char](32) NOT NULL,
	[user_nickname] [nvarchar](50) NOT NULL,
	[user_sex] [bit] NOT NULL,
	[user_head] [varchar](256) NOT NULL,
	[user_isDeleted] [bit] NOT NULL,
	[user_isChecked] [bit] NOT NULL,
	[user_last_login_time] [datetime] NOT NULL,
	[user_last_login_ip] [varchar](64) NOT NULL,
	[user_money] [float] NOT NULL,
	[user_introduction] [nvarchar](256) NOT NULL,
	[user_timestamp] [timestamp] NOT NULL,
	[user_verify_code] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_USER_ACCOUNT] UNIQUE NONCLUSTERED 
(
	[user_account] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户账户名必须唯一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER', @level2type=N'CONSTRAINT',@level2name=N'UN_USER_ACCOUNT'
GO
/****** Object:  Table [dbo].[REVIEW]    Script Date: 05/25/2014 21:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVIEW](
	[r_id] [bigint] IDENTITY(1,1) NOT NULL,
	[review_id] [uniqueidentifier] NOT NULL,
	[review_content] [text] NOT NULL,
	[review_author] [uniqueidentifier] NOT NULL,
	[review_publish_date] [datetime] NOT NULL,
	[review_isDeleted] [bit] NOT NULL,
	[review_news] [uniqueidentifier] NOT NULL,
	[review_timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_REVIEW] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 05/25/2014 21:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[o_id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [uniqueidentifier] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[order_price] [float] NOT NULL,
	[order_isPaid] [bit] NOT NULL,
	[order_isDeleted] [bit] NOT NULL,
	[order_user] [uniqueidentifier] NOT NULL,
	[order_course] [uniqueidentifier] NOT NULL,
	[order_timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ORDER] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEWS]    Script Date: 05/25/2014 21:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NEWS](
	[n_id] [bigint] IDENTITY(1,1) NOT NULL,
	[news_id] [uniqueidentifier] NOT NULL,
	[news_title] [nvarchar](128) NOT NULL,
	[news_content] [text] NOT NULL,
	[news_author] [uniqueidentifier] NOT NULL,
	[news_publish_date] [datetime] NOT NULL,
	[news_isDeleted] [bit] NOT NULL,
	[news_isOnIndex] [bit] NOT NULL,
	[news_image] [varchar](256) NOT NULL,
	[news_click_count] [int] NOT NULL,
	[news_timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_NEWS] PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 05/25/2014 21:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN](
	[a_id] [bigint] IDENTITY(1,1) NOT NULL,
	[admin_id] [uniqueidentifier] NOT NULL,
	[admin_account] [char](64) NOT NULL,
	[admin_password] [char](32) NOT NULL,
	[admin_last_login_time] [datetime] NOT NULL,
	[admin_last_login_ip] [char](64) NOT NULL,
	[admin_nickname] [nvarchar](32) NOT NULL,
	[admin_timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ADMIN] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_ADMIN_ACCOUNT] UNIQUE NONCLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一的管理员账户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ADMIN', @level2type=N'CONSTRAINT',@level2name=N'UN_ADMIN_ACCOUNT'
GO
/****** Object:  Table [dbo].[COURSE]    Script Date: 05/25/2014 21:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COURSE](
	[c_id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[course_id] [uniqueidentifier] NOT NULL,
	[course_name] [nvarchar](256) NOT NULL,
	[course_intro] [text] NOT NULL,
	[course_price] [float] NOT NULL,
	[course_robot_link] [varchar](256) NOT NULL,
	[course_begin_date] [datetime] NOT NULL,
	[course_isDeleted] [bit] NOT NULL,
	[course_timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_COURSE] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[UserCourseList]    Script Date: 05/25/2014 21:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserCourseList]
AS
SELECT     dbo.[ORDER].order_id, dbo.[ORDER].order_date, dbo.[ORDER].order_price, dbo.[ORDER].order_isPaid, dbo.[ORDER].order_user, dbo.[ORDER].order_course, 
                      dbo.COURSE.course_id, dbo.COURSE.course_name, dbo.COURSE.course_intro, dbo.COURSE.course_robot_link, dbo.COURSE.course_price, 
                      dbo.COURSE.course_begin_date, dbo.COURSE.course_isDeleted, dbo.[USER].user_id
FROM         dbo.[ORDER] INNER JOIN
                      dbo.[USER] ON dbo.[ORDER].order_user = dbo.[USER].user_id AND dbo.[ORDER].order_user = dbo.[USER].user_id INNER JOIN
                      dbo.COURSE ON dbo.[ORDER].order_course = dbo.COURSE.course_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ORDER"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 125
               Right = 427
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "COURSE"
            Begin Extent = 
               Top = 6
               Left = 465
               Bottom = 125
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "USER"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserCourseList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserCourseList'
GO
/****** Object:  View [dbo].[AdminNewsList]    Script Date: 05/25/2014 21:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AdminNewsList]
AS
SELECT     dbo.ADMIN.admin_nickname, dbo.NEWS.news_id, dbo.NEWS.news_title, dbo.NEWS.news_publish_date, dbo.NEWS.news_isDeleted, dbo.NEWS.news_isOnIndex, 
                      dbo.NEWS.news_image, dbo.NEWS.news_click_count, dbo.NEWS.news_content, dbo.NEWS.news_author
FROM         dbo.ADMIN INNER JOIN
                      dbo.NEWS ON dbo.ADMIN.admin_id = dbo.NEWS.news_author
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ADMIN"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "NEWS"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 125
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AdminNewsList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AdminNewsList'
GO
/****** Object:  StoredProcedure [dbo].[CreateNewOrder]    Script Date: 05/25/2014 21:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<YuXun-Lu>
-- Create date: <2014-5-24>
-- Description:	<删除订单用存储过程>
-- =============================================
CREATE PROCEDURE [dbo].[CreateNewOrder]
	-- Add the parameters for the stored procedure here
	@OrderPrice FLOAT,
	@OrderUser UNIQUEIDENTIFIER,
	@OrderCourse UNIQUEIDENTIFIER,
	@OrderIsPaid BINARY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- 一条出错整个回滚
	SET XACT_ABORT ON;
	-- 开事务
	BEGIN TRAN
	DECLARE @Result INT;
	SET @Result = 0;
		BEGIN TRY
			--首先插入一条新的订单记录
			INSERT INTO [ORDER]
			(order_id,ORDER_DATE,ORDER_PRICE,ORDER_ISPAID,ORDER_ISDELETED,ORDER_USER,ORDER_COURSE)
			 VALUES
			 (NEWID(),GETDATE(),@OrderPrice,@OrderIsPaid,0,@OrderUser,@OrderCourse);
			 
			--然后在对应用户账号里扣钱
			UPDATE [USER]
			SET user_money = user_money - @OrderPrice
			WHERE
				user_id = @OrderUser;
			COMMIT TRAN
			SET @Result = 1;
		END TRY
		BEGIN CATCH
			ROLLBACK
			SET @Result = 0;
		END CATCH	
		RETURN @Result;
END
GO
/****** Object:  Check [CK_USER_MONEY]    Script Date: 05/25/2014 21:47:49 ******/
ALTER TABLE [dbo].[USER]  WITH CHECK ADD  CONSTRAINT [CK_USER_MONEY] CHECK  (([user_money]>=(0)))
GO
ALTER TABLE [dbo].[USER] CHECK CONSTRAINT [CK_USER_MONEY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户余额必须大于等于0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER', @level2type=N'CONSTRAINT',@level2name=N'CK_USER_MONEY'
GO
/****** Object:  Check [CK_ORDER_PRICE]    Script Date: 05/25/2014 21:47:49 ******/
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [CK_ORDER_PRICE] CHECK  (([order_price]>=(0)))
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [CK_ORDER_PRICE]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单价格不小于0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER', @level2type=N'CONSTRAINT',@level2name=N'CK_ORDER_PRICE'
GO
/****** Object:  Check [CK_COURSE_PRICE]    Script Date: 05/25/2014 21:47:49 ******/
ALTER TABLE [dbo].[COURSE]  WITH CHECK ADD  CONSTRAINT [CK_COURSE_PRICE] CHECK  (([course_price]>=(0.0)))
GO
ALTER TABLE [dbo].[COURSE] CHECK CONSTRAINT [CK_COURSE_PRICE]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程价格不小于0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COURSE', @level2type=N'CONSTRAINT',@level2name=N'CK_COURSE_PRICE'
GO
