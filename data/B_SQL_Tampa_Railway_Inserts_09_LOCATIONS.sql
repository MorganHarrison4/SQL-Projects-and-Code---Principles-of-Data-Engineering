

--INSERT TABLE [locations]

USE [Tampa_Railway]
GO
INSERT [dbo].[locations] ([location_id], [name], [location_type_id], [address_line1], [address_line2], [zipcode_id], [city_state_id], [location_x], [location_y]) VALUES (1, N'Orlando Main Station', 2, N'1400 Sligh Blvd', N'Orlando FL 32806', 10603, 2197, N'28.526235', N'-81.381630')
GO
INSERT [dbo].[locations] ([location_id], [name], [location_type_id], [address_line1], [address_line2], [zipcode_id], [city_state_id], [location_x], [location_y]) VALUES (2, N'Sales Kiosk 001', 1, N'1400 Sligh Blvd', N'Orlando FL 32806', 10603, 2197, N'28.526235', N'-81.381630')
GO
INSERT [dbo].[locations] ([location_id], [name], [location_type_id], [address_line1], [address_line2], [zipcode_id], [city_state_id], [location_x], [location_y]) VALUES (3, N'Tampa FL Union Station', 2, N'601 N Nebraska Ave', N'Tampa FL 33602', 10902, 2066, N'27.952865', N' -82.450215')
GO
INSERT [dbo].[locations] ([location_id], [name], [location_type_id], [address_line1], [address_line2], [zipcode_id], [city_state_id], [location_x], [location_y]) VALUES (4, N'Sales Kiosk 002', 1, N'601 N Nebraska Ave', N'Tampa FL 33602', 10902, 2066, N'27.952865', N' -82.450215')
GO
INSERT [dbo].[locations] ([location_id], [name], [location_type_id], [address_line1], [address_line2], [zipcode_id], [city_state_id], [location_x], [location_y]) VALUES (5, N'Web site', 4, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[locations] ([location_id], [name], [location_type_id], [address_line1], [address_line2], [zipcode_id], [city_state_id], [location_x], [location_y]) VALUES (6, N'iOS App', 5, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[locations] ([location_id], [name], [location_type_id], [address_line1], [address_line2], [zipcode_id], [city_state_id], [location_x], [location_y]) VALUES (7, N'Android App', 6, NULL, NULL, NULL, NULL, NULL, NULL)
GO
