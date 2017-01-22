USE Hotel

UPDATE Payments
SET TaxRate=TaxRate-TaxRate*0.03

SELECT TaxRate from Payments