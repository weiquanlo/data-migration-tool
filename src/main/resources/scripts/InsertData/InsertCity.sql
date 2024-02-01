USE TSI
GO
BEGIN TRAN
GO
SET NOCOUNT ON
GO
DELETE FROM City
GO
INSERT City (Code, Name, Country) VALUES ('KUL','Kuala Lumpur', 'Malaysia')
GO
INSERT City (Code, Name, Country) VALUES ('PEN', 'Penang', 'Malaysia')
GO
INSERT City (Code, Name, Country) VALUES ('IPH', 'Ipoh','Malaysia')
GO
INSERT City (Code, Name, Country) VALUES ('AOR','Alor Setar', 'Malaysia')
GO
INSERT City (Code, Name, Country) VALUES ('LGK', 'Langkawi', 'Malaysia')
GO
INSERT City (Code, Name, Country) VALUES ('KBR', 'Kota Bharu','Malaysia')
GO
INSERT City (Code, Name, Country) VALUES ('BGK', 'Bangkok', 'Thailand')
GO
INSERT City (Code, Name, Country) VALUES ('BAL', 'Bali','Indonesia')
GO
SET NOCOUNT OFF
GO
COMMIT TRAN
PRINT 'City is inserted'
GO