
--INSERT TABLE [pass_types_cabin_types]

USE [Tampa_Railway]
GO
INSERT [dbo].[pass_types_cabin_types] ([pass_type_cabin_type_id], [pass_type_id], [cabin_type_id], [price], [start_date], [end_date]) VALUES (1, 1, 1, CAST(25.00 AS Decimal(10, 2)), CAST(N'2012-01-01' AS Date), NULL)
GO
INSERT [dbo].[pass_types_cabin_types] ([pass_type_cabin_type_id], [pass_type_id], [cabin_type_id], [price], [start_date], [end_date]) VALUES (2, 1, 2, CAST(20.00 AS Decimal(10, 2)), CAST(N'2012-01-01' AS Date), NULL)
GO
INSERT [dbo].[pass_types_cabin_types] ([pass_type_cabin_type_id], [pass_type_id], [cabin_type_id], [price], [start_date], [end_date]) VALUES (3, 2, 1, CAST(75.00 AS Decimal(10, 2)), CAST(N'2012-01-01' AS Date), NULL)
GO
INSERT [dbo].[pass_types_cabin_types] ([pass_type_cabin_type_id], [pass_type_id], [cabin_type_id], [price], [start_date], [end_date]) VALUES (4, 2, 2, CAST(60.00 AS Decimal(10, 2)), CAST(N'2012-01-01' AS Date), NULL)
GO
INSERT [dbo].[pass_types_cabin_types] ([pass_type_cabin_type_id], [pass_type_id], [cabin_type_id], [price], [start_date], [end_date]) VALUES (5, 3, 1, CAST(150.00 AS Decimal(10, 2)), CAST(N'2012-01-01' AS Date), NULL)
GO
INSERT [dbo].[pass_types_cabin_types] ([pass_type_cabin_type_id], [pass_type_id], [cabin_type_id], [price], [start_date], [end_date]) VALUES (6, 3, 2, CAST(120.00 AS Decimal(10, 2)), CAST(N'2012-01-01' AS Date), NULL)
GO



