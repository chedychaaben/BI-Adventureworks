SELECT 
    MIN(OrderDateID) AS MinOrderDate, 
    MAX(OrderDateID) AS MaxOrderDate,
    FLOOR(MIN(OrderDateID) / 100) AS MinYear,
    FLOOR(MAX(OrderDateID) / 100) AS MaxYear
FROM 
    [DataWarehouseSales].[dbo].[FactEnMagasinSales];