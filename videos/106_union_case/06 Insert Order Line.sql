DELETE FROM order_line;

Declare @Id int
Set @Id = 1

Declare @RandomPrice DECIMAL(8, 2)
Declare @LowerLimitForPrice int
Declare @UpperLimitForPrice int
Set @LowerLimitForPrice = 5 
Set @UpperLimitForPrice = 200 

DECLARE @RandomOrderId INT
DECLARE @LowerLimitForOrderId INT
DECLARE @UpperLimitForOrderId INT
Set @LowerLimitForOrderId = 1
Set @UpperLimitForOrderId = 10000

DECLARE @RandomProductId INT
DECLARE @LowerLimitForProductId INT
DECLARE @UpperLimitForProductId INT
Set @LowerLimitForProductId = 1
Set @UpperLimitForProductId = 200

DECLARE @RandomQty INT
DECLARE @LowerLimitForQty INT
DECLARE @UpperLimitForQty INT
Set @LowerLimitForQty = 1
Set @UpperLimitForQty = 50


While @Id <= 100000
Begin 

   Select @RandomPrice = Round(((@UpperLimitForPrice - @LowerLimitForPrice) * Rand()) + @LowerLimitForPrice, 2)
   Select @RandomOrderId = Round(((@UpperLimitForOrderId - @LowerLimitForOrderId) * Rand()) + @LowerLimitForOrderId, 0)
   Select @RandomProductId = Round(((@UpperLimitForProductId - @LowerLimitForProductId) * Rand()) + @LowerLimitForProductId, 0)
   Select @RandomQty = Round(((@UpperLimitForQty - @LowerLimitForQty) * Rand()) + @LowerLimitForQty, 0)

   Insert Into order_line (order_line_id, order_id, product_id, qty, price)
   VALUES (@id, @RandomOrderId, @RandomProductId, @RandomQty, @RandomPrice);


   Set @Id = @Id + 1
End


