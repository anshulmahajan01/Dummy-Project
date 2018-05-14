





















Execute spSearchEmployees 'Mark' , 'Hastings' , 'Male' , '60000'

Declare @sql nvarchar(1000)
Declare @params nvarchar(1000)

set @sql = 'Select * from Employees' + ' Where FirstName = @FirstName and LastName = @LastName'
Set @params = '@FirstName nvarchar(100) , @LastName nvarchar(100)' 

Execute sp_executesql @sql , @params , @FirstName = 'Mark' , @LastName = 'Hastings'