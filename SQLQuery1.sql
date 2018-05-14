select * from tblGender
select * from tblPerson


select * from Employee1
select * from tblDepartment

set identity_insert tblPerson1 ON

DBCC checkident(tblPerson1 , RESEED , 0)

Insert into tblPerson(ID , Name, Email,GenderId,Age) Values( 12 , 'Todd' , 'T@T.com' , 1, 25)

Insert into tblPerson1 values ('Todd')

Delete from tblPerson1 Where personID = 1


Alter table tblPerson
Drop constraint DF_tblPerson_GenderId

Alter table tblPerson
Add Age int;

Delete from tblGender where Id = 1

Alter table tblPerson 
ADD constraint DF_tblPerson_GenderId
Default 3 for GENDERID		


select Name,Gender, Salary, DepartmentName
from Employee1
join Department
on Employee1.DepartmentID = DepartmentId

create trigger trForInsert on Test1 for insert 
as 
Begin
Insert into Test2 values('zzz')
End

Insert into Test1 values('X')
select * from Test1
select * from Test2

select	SCOPE_IDENTITY()
select @@IDENTITY
select IDENT_CURRENT('Test2')

Alter Table tblPerson
Add Constraint UQ_tblPerson_Email Unique(Email)

Create table tblDepartment
(
     ID int primary key,
     DepartmentName nvarchar(50),
     Location nvarchar(50),
     DepartmentHead nvarchar(50)
)
Go

Insert into tblDepartment values (1, 'IT', 'London', 'Rick')
Insert into tblDepartment values (2, 'Payroll', 'Delhi', 'Ron')
Insert into tblDepartment values (3, 'HR', 'New York', 'Christie')
Insert into tblDepartment values (4, 'Other Department', 'Sydney', 'Cindrella')
Go


Create table Employees
(
     ID int primary key identity,
     FirstName nvarchar(50),
     LastName nvarchar(50),
     Gender nvarchar(50),
     Salary int
)
Go

Insert into Employees values ('Mark', 'Hastings', 'Male', 60000)
Insert into Employees values ('Steve', 'Pound', 'Male', 45000)
Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values ('Philip', 'Hastings', 'Male', 45000)
Insert into Employees values ('Mary', 'Lambeth', 'Female', 30000)
Insert into Employees values ('Valarie', 'Vikings', 'Female', 35000)
Insert into Employees values ('John', 'Stanmore', 'Male', 80000)
Go

Drop table Employees;
select * from Employees
order by salary Asc;

Create Procedure spSearchEmployees
@FirstName nvarchar(100),
@LastName nvarchar(100),
@Gender nvarchar(50),
@Salary int
As
Begin

     Select * from Employees where
     (FirstName = @FirstName OR @FirstName IS NULL) AND
     (LastName  = @LastName  OR @LastName  IS NULL) AND
     (Gender      = @Gender    OR @Gender    IS NULL) AND
     (Salary      = @Salary    OR @Salary    IS NULL)
End
Go


Select distinct FirstName ,Salary from Employees;
Select * from Employees where Salary = 60000;
Select * from Employees where Salary in (80000,60000,70000);

Select * from Employees where Salary Between 10000 And 50000;

Select * from Employees where FirstName Like 'M%';

Select * from Employees where FirstName Like '[MST]%';

Select top 1 percent * from Employees

Select * from Employees order by Salary DESC;




Create table Employee1
(
     ID int primary key,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     DepartmentId int foreign key references tblDepartment(Id)
)
Go

Insert into Employee1 values (1, 'Tom', 'Male', 4000, 1)
Insert into Employee1 values (2, 'Pam', 'Female', 3000, 3)
Insert into Employee1 values (3, 'John', 'Male', 3500, 1)
Insert into Employee1 values (4, 'Sam', 'Male', 4500, 2)
Insert into Employee1 values (5, 'Todd', 'Male', 2800, 2)
Insert into Employee1 values (6, 'Ben', 'Male', 7000, 1)
Insert into Employee1 values (7, 'Sara', 'Female', 4800, 3)
Insert into Employee1 values (8, 'Valarie', 'Female', 5500, 1)
Insert into Employee1 values (9, 'James', 'Male', 6500, NULL)
Insert into Employee1 values (10, 'Russell', 'Male', 8800, NULL)
Go

................................................................

select top 1000 * 
from FactInternetSales;

bulk insert employees 
from 'C:\Users\User\Documents\SQL Server Management Studio\DimProduct.csv'
with 
(
rowterminator = '\n',
fieldterminator = ','
)