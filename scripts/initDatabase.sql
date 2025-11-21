-- initialization a data warehouse 
use dataWarehouse 
go 
IF EXISTS (SELECT 1 FROM sys.databases WHERE name='DataWarehouse')
 BEGIN
 ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACk IMMEDIATE
 DROP DATABASE DataWarehouse
   END
   go ;

--return a mlti user if you want 
--ALTER DATABASE DataWarehouse SET MULTI_USER WITH ROLLBACK IMMEDIATE;

use DataWarehouse 
go
create schema bronze;
go
create schema silver;
go
create schema gold;

