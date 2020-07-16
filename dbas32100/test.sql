SELECT ProductDescription, ProductFinish, ProductStandardPrice
	FROM Product_T
	WHERE (ProductDescription LIKE '%Desk'
		OR ProductDescription LIKE '%TABLE')
		AND ProductStandardPrice > 300;

