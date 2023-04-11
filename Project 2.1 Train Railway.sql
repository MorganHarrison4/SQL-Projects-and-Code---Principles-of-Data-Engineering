C
reate Table Customers(
	Customer_ID Integer NOT NULL, 
	FName VarChar(30) NOT NULL,
	LName VarChar(30) NOT NULL,
	Bdate Date NOT NULL,
	Email VarChar(50) NOT NULL,
	Phone_Number Integer NOT NULL,
	Address VarChar(50) NOT NULL,
	City VarChar(50) NOT NULL,
	Primary Key(Customer_ID),
	check (Phone_Number>=1000000000 and Phone_Number<=999999999999999),
	check (Bdate>'1900-01-01'));

CREATE TABLE Department(
	Dnum Integer NOT NULL,
	Dname VarChar(20) NOT NULL,
	Primary Key(Dnum));

Create Table Employees(
	Employee_ID Char(10) NOT NULL,
	SSN int NOT NULL,
	FName VarChar(30) NOT NULL,
	LName VarChar(30) NOT NULL,
	Bdate Date NOT NULL,
	Position VarChar(30) NOT NULL,
	Department_num Integer NOT NULL,
	Supervisor_ID Char(10) NOT NULL,
	Primary Key(Employee_ID),
	check (Bdate>'1900-01-01'),
	check (SSN >=1000000000),
	Foreign Key(Department_num) references Department(Dnum),
	Foreign Key (Supervisor_ID) references Employees(Employee_ID));

Create Table Weeks(
	Week_day VarChar(20),
	Primary Key (Week_day)
);

Create Table Routes_T(
	Route_Number Integer NOT NULL,
	Origin VarChar(30) NOT NULL,
	Destination VarChar(30) NOT NULL,
	Day_of_Week VarChar(20)NOT NULL,
	Departure_Time Time NOT NULL,
	Arrival_Time Time NOT NULL, 
	Distance Integer NOT NULL,
	Primary Key(Route_Number),
	Foreign Key (Day_of_Week) references Weeks(Week_day));

Create Table Trains(
	Train_ID Integer NOT NULL,
	Train_Model VarChar(30) NOT NULL,
	Current_Status VarChar(20) NOT NULL,
	Wagons Integer NOT NULL,
	Top_Speed Integer,
	Capacity Integer NOT NULL,
	Primary Key(Train_ID));

CREATE TABLE Travel_S(
	Travel_Status VarChar(20) NOT NULL,
	Primary Key(Travel_Status));

Create Table Travels(
	Travel_ID Integer NOT NULL,
	Route_Number Integer NOT NULL,
	Driver Char(10) NOT NULL,
	Train_ID Integer NOT NULL,
	Completion_Status VarChar(20) NOT NULL,
	Real_Departure_Time Time NOT NULL,
	Real_Arrival_Time Time NOT NULL,
	Primary Key(Travel_ID),
	Foreign Key(Route_Number) references Routes_T(Route_Number),
	Foreign Key(Train_ID) references Trains(Train_ID),
	Foreign Key(Completion_Status) references Travel_S(Travel_Status),
	Foreign Key (Driver) references Employees (Employee_ID));

Create Table Locations(
	Location_Number Char(20) NOT NULL,
	Location_Address VarChar(50) NOT NULL,
	City VarChar(30) NOT NULL,
	Primary Key (Location_Number));

CREATE TABLE ClassCabin(
	Class_Cabin varchar(20) NOT NULL,
	Primary Key(Class_Cabin));

Create Table Cabins(
	Route_Number Integer NOT NULL,
	Class_Cabin VarChar(20) NOT NULL,
	Price Real NOT NULL,
	Primary Key(Route_Number, Class_Cabin),
	Foreign Key(Route_number) references Routes_T(Route_Number),
	Foreign Key (Class_Cabin) references ClassCabin(Class_Cabin));

Create Table Discounts(
	Discount_Code Char(10) NOT NULL,
	Discount_Percent real NOT NULL,
	Primary Key(Discount_Code));

Create Table Payments(
	Payment_Number VarChar(15) NOT NULL,
	Total_Payments Integer NOT NULL,
	Discount_Code Char(10) NOT NULL,
	Primary Key(Payment_Number),
	Foreign Key(Discount_Code) references Discounts(Discount_Code));

Create Table Tickets(
	Ticket_ID Char(15) NOT NULL,
	Customer_ID Integer NOT NULL,
	Class VarChar(20) NOT NULL,
	Route_Number Integer NOT NULL,
	Day_Date date NOT NULL,
	Location_Number Char(20) NOT NULL,
	Payment_Number VarChar(15) NOT NULL,
	Primary Key(Ticket_ID),
	Foreign Key(Customer_ID) references Customers(Customer_ID),
	Foreign Key (Route_Number) references Routes_T(Route_Number),
	Foreign Key(Location_Number) references Locations(Location_Number),
	Foreign Key(Payment_Number) references Payments(Payment_Number));

Create Table Salary(
	Employee_ID Char(10) NOT NULL,
	New_Date Date NOT NULL,
	Base_Salary Real NOT NULL,
	Updated_Salary Real NOT NULL,
	Primary Key(Employee_ID, New_Date),
	Foreign Key(Employee_ID) references Employees(Employee_ID));

Create Table Supplier_Dept(
	SupplierType VarChar (20) NOT NULL,
	Primary Key(SupplierType));

Create Table Suppliers(
	Supplier_ID Char(10) NOT NULL,
	SupplierType VarChar(20) NOT NULL,
	Supplier_Department Integer NOT NULL,
	Phone_Number integer,
	check (Phone_Number>=1000000000 and Phone_Number<=999999999999999),
	Primary Key(Supplier_ID),
	Foreign Key(Supplier_Department) references Department(Dnum),
	Foreign Key(SupplierType) references Supplier_Dept(SupplierType));