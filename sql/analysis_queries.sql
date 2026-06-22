SELECT VehicleName,
SUM(Revenue) AS TotalRevenue
FROM fleet_data
GROUP BY VehicleName;

SELECT VehicleName,
Revenue-(FuelCost+EMI)
AS Profit
FROM fleet_data;

SELECT BookingSource,
COUNT(*) AS TotalBookings
FROM fleet_data
GROUP BY BookingSource;
