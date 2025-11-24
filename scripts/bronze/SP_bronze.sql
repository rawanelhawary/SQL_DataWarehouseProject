----------------------------------------------------------------
--Thist Stored Procedure: Load Bronze Layer
--usage ex:
EXEC bronze.load_bronze ;
-----------------------------------------------------------------

-- THIS CREATE BRONZE TABLES
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
  BEGIN
      declare @startTime datetime , @endTime datetime, @batchSTime datetime, @batchETime datetime;
  BEGIN TRY

PRINT '***********************************';
PRINT '       Loading Bronze Layer        ';
PRINT '***********************************';


PRINT ' Loading CRM Table       ';
PRINT '-----------------------------------';

      set @startTime = GETDATE();
PRINT'>> Truncating Table : bronze.crm_cust_info';
TRUNCATE TABLE bronze.crm_cust_info;
PRINT'>> Inserting Date Into : bronze.crm_cust_info';
BULk INSERT bronze.crm_cust_info
FROM 'C:\DWHproject\datasetDWH\cust_info.csv'
WITH (
 FIRSTROW = 2,
 FIELDTERMINATOR = ',',
 TABLOCK );
    set @endTime = GETDATE();
	print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	print '============================================================================';

      set @startTime = GETDATE();
PRINT'>> Truncating Table : bronze.crm_prd_info';
 TRUNCATE TABLE bronze.crm_prd_info;
 PRINT'>> Inserting Date Into : bronze.crm_prd_info';
 BULk INSERt bronze.crm_prd_info
 FROM 'C:\DWHproject\datasetDWH\prd_info.csv'
 WITH (
  FIRSTROW = 2,
  FIELDTERMINATOr =',',
  TABLOCK);
         set @endTime = GETDATE();
	     print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	     print '============================================================================';


      set @startTime = GETDATE();
  PRINT'>> Truncating Table : bronze.crm_sales_details';
  TRUNCATE TABLE bronze.crm_sales_details;
  PRINT'>> Inserting Date Into : bronze.crm_sales_details';
  BULK INSERT bronze.crm_sales_details
  FROM 'C:\DWHproject\datasetDWH\sales_details.csv'
  WITH(
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLoCK);
      set @endTime = GETDATE();
	  print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	  print '============================================================================';
	  

  print ' Loading ERP Table       ';
  print '-----------------------------------';

   
        set @startTime = GETDATE();
  PRINT'>> Truncating Table : bronze.erp_LOC_A101';
  TRUNCATE TABLE bronze.erp_LOC_A101;
  PRINT'>> Inserting Date Into : bronze.erp_LOC_A101';
  BULK INSERT bronze.erp_LOC_A101
  FROM 'C:\DWHproject\datasetDWH\LOC_A101.csv'
  WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR =',',
  TABLOCk);
         set @endTime = GETDATE();
	     print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	     print '============================================================================';


    set @startTime = GETDATE();
  PRINT'>> Truncating Table : bronze.erp_CUST_AZ12 ';
  TRUNCATE TABLE bronze.erb_CUST_AZ12 ;
  PRINT'>> Inserting Date Into : bronze.erb_CUST_AZ12';
  BULK INSERT bronze.erb_CUST_AZ12 
  FROM 'C:\DWHproject\datasetDWH\CUST_AZ12.csv'
  WITH (
  FIRSTROW =2,
  FIELDTERMINATOR =',',
  TABLOCK);
        set @endTime = GETDATE();
	    print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	    print '============================================================================';


   set @startTime = GETDATE();
  PRINT'>> Truncating Table : bronze.erp_PX_CAT_G1V2';
  TRUNCATE Table bronze.erp_PX_CAT_G1V2;
  PRINT'>> Inserting Date Into : bronze.erb_PX_CAT_G1V2';
  BULK INSERT bronze.erp_PX_CAT_G1V2
  FROM 'C:\DWHproject\datasetDWH\PX_CAT_G1V2.csv'
  WITH (
  FIRSTROW =2,
  FIELDTERMINATOR = ',',
  TABLOCk);
      set @endTime = GETDATE();
	    print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	    print '============================================================================';
		 
   SET @batchETime = GETDATE();
  -- print'____________________________________________'
   PRINT 'Bronze Layer Is Completed';
    PRINT ' - Total Load Duration : ' +CAST(DATEDIFF(SECOND ,@batchSTime, @batchETime)AS NVARCHAR)+ 'seconds';
    PRINT '___________________________________________'
   END TRY
       BEGIN CATCH
	            PRINT '--------------------------------------------'
	            PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER !'
	            PRINT 'Error Message'+ ERROR_MESSAGE();
                PRINT 'Error Message'+ CAST( ERROR_NUMBER() as nvarchar);
			    PRINT 'Error Message'+ CAST (ERROR_STATE() as nvarchar);
	            PRINT '--------------------------------------------'
      END CATCh
 ENDuse DataWarehouse;

-- this create  bronze tables 

EXEC bronze.load_bronze ;

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
  BEGIN
      declare @startTime datetime , @endTime datetime, @batchSTime datetime, @batchETime datetime;
  BEGIN TRY

PRINT '***********************************';
PRINT '       Loading Bronze Layer        ';
PRINT '***********************************';


PRINT ' Loading CRM Table       ';
PRINT '-----------------------------------';

      set @startTime = GETDATE();
PRINT'>> Truncating Table : bronze.crm_cust_info';
TRUNCATE TABLE bronze.crm_cust_info;
PRINT'>> Inserting Date Into : bronze.crm_cust_info';
BULk INSERT bronze.crm_cust_info
FROM 'C:\DWHproject\datasetDWH\cust_info.csv'
WITH (
 FIRSTROW = 2,
 FIELDTERMINATOR = ',',
 TABLOCK );
    set @endTime = GETDATE();
	print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	print '============================================================================';

      set @startTime = GETDATE();
PRINT'>> Truncating Table : bronze.crm_prd_info';
 TRUNCATE TABLE bronze.crm_prd_info;
 PRINT'>> Inserting Date Into : bronze.crm_prd_info';
 BULk INSERt bronze.crm_prd_info
 FROM 'C:\DWHproject\datasetDWH\prd_info.csv'
 WITH (
  FIRSTROW = 2,
  FIELDTERMINATOr =',',
  TABLOCK);
         set @endTime = GETDATE();
	     print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	     print '============================================================================';


      set @startTime = GETDATE();
  PRINT'>> Truncating Table : bronze.crm_sales_details';
  TRUNCATE TABLE bronze.crm_sales_details;
  PRINT'>> Inserting Date Into : bronze.crm_sales_details';
  BULK INSERT bronze.crm_sales_details
  FROM 'C:\DWHproject\datasetDWH\sales_details.csv'
  WITH(
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLoCK);
      set @endTime = GETDATE();
	  print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	  print '============================================================================';
	  

  print ' Loading ERP Table       ';
  print '-----------------------------------';

   
        set @startTime = GETDATE();
  PRINT'>> Truncating Table : bronze.erp_LOC_A101';
  TRUNCATE TABLE bronze.erp_LOC_A101;
  PRINT'>> Inserting Date Into : bronze.erp_LOC_A101';
  BULK INSERT bronze.erp_LOC_A101
  FROM 'C:\DWHproject\datasetDWH\LOC_A101.csv'
  WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR =',',
  TABLOCk);
         set @endTime = GETDATE();
	     print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	     print '============================================================================';


    set @startTime = GETDATE();
  PRINT'>> Truncating Table : bronze.erp_CUST_AZ12 ';
  TRUNCATE TABLE bronze.erb_CUST_AZ12 ;
  PRINT'>> Inserting Date Into : bronze.erb_CUST_AZ12';
  BULK INSERT bronze.erb_CUST_AZ12 
  FROM 'C:\DWHproject\datasetDWH\CUST_AZ12.csv'
  WITH (
  FIRSTROW =2,
  FIELDTERMINATOR =',',
  TABLOCK);
        set @endTime = GETDATE();
	    print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	    print '============================================================================';


   set @startTime = GETDATE();
  PRINT'>> Truncating Table : bronze.erp_PX_CAT_G1V2';
  TRUNCATE Table bronze.erp_PX_CAT_G1V2;
  PRINT'>> Inserting Date Into : bronze.erb_PX_CAT_G1V2';
  BULK INSERT bronze.erp_PX_CAT_G1V2
  FROM 'C:\DWHproject\datasetDWH\PX_CAT_G1V2.csv'
  WITH (
  FIRSTROW =2,
  FIELDTERMINATOR = ',',
  TABLOCk);
      set @endTime = GETDATE();
	    print 'Load Duration :' + cast( datediff(second, @startTime, @endTime) as nvarchar)+' seconds';
	    print '============================================================================';
		 
   SET @batchETime = GETDATE();
  -- print'____________________________________________'
   PRINT 'Bronze Layer Is Completed';
    PRINT ' - Total Load Duration : ' +CAST(DATEDIFF(SECOND ,@batchSTime, @batchETime)AS NVARCHAR)+ 'seconds';
    PRINT '___________________________________________'
   END TRY
       BEGIN CATCH
	            PRINT '--------------------------------------------'
	            PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER !'
	            PRINT 'Error Message'+ ERROR_MESSAGE();
                PRINT 'Error Message'+ CAST( ERROR_NUMBER() as nvarchar);
			    PRINT 'Error Message'+ CAST (ERROR_STATE() as nvarchar);
	            PRINT '--------------------------------------------'
      END CATCh
 END
