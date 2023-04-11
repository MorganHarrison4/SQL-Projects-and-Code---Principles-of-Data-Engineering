use Tampa_Railway
go

delete [dbo].[pass_types_cabin_types]
delete [dbo].[tickets]
delete [dbo].[passes_travels]
delete [dbo].[routes_cabin_types]
delete [dbo].[travels_wagons]
delete [dbo].[travels_employees]
delete [dbo].[travels]
delete [dbo].[wagons_maintenances]
delete [dbo].[trains_maintenances]
delete [dbo].[wagons]
delete [dbo].[wagon_types]
delete [dbo].[trains]
delete [dbo].[routes]
delete [dbo].[passes]
delete [dbo].[pass_types]
delete [dbo].[maintenances]
delete [dbo].[employees_job_positions] 
delete [dbo].[cards]
delete [dbo].[customers]
delete [dbo].[employees]
delete [dbo].[locations]
delete [dbo].[cities_states]
delete [dbo].[zipcodes]
delete [dbo].[states]
delete [dbo].[job_positions]
delete [dbo].[cabin_types]
delete [dbo].[location_types]
delete [dbo].[discounts]
delete [dbo].[weekdays]
delete [dbo].[travel_roles]
delete [dbo].[payment_types]


go



BULK INSERT Tampa_Railway..weekdays
FROM 'C:\data\weekdays.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..payment_types
FROM 'C:\data\payment_types.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..states
FROM 'C:\data\states.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..discounts
FROM 'C:\data\discounts.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..location_types
FROM 'C:\data\location_types.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..cabin_types
FROM 'C:\data\cabin_types.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..cities_states
FROM 'C:\data\cities_states.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..zipcodes
FROM 'C:\data\zipcodes.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..locations
FROM 'C:\data\locations.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');


BULK INSERT Tampa_Railway..customers
FROM 'C:\data\customers.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..job_positions
FROM 'C:\data\job_positions.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..travel_roles
FROM 'C:\data\travel_roles.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..employees
FROM 'C:\data\employees.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..cards
FROM 'C:\data\cards.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..employees_job_positions
FROM 'C:\data\employees_job_positions.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..maintenances
FROM 'C:\data\maintenances.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..pass_types
FROM 'C:\data\pass_types.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..passes
FROM 'C:\data\passes.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..routes
FROM 'C:\data\routes.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..trains
FROM 'C:\data\trains.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..wagon_types
FROM 'C:\data\wagon_types.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..wagons
FROM 'C:\data\wagons.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..trains_maintenances
FROM 'C:\data\trains_maintenances.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..wagons_maintenances
FROM 'C:\data\wagons_maintenances.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..travels
FROM 'C:\data\travels.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..travels_employees
FROM 'C:\data\travels_employees.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..travels_wagons
FROM 'C:\data\travels_wagons.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..routes_cabin_types
FROM 'C:\data\routes_cabin_types.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..passes_travels
FROM 'C:\data\passes_travels.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..tickets
FROM 'C:\data\tickets.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Tampa_Railway..pass_types_cabin_types
FROM 'C:\data\pass_types_cabin_types.csv'
WITH (FORMAT = 'CSV', FIRSTROW=2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

