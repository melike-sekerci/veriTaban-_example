CREATE DATABASE webYemek;
USE webYemek;
CREATE TABLE Musteri(
mid INT NOT NULL PRIMARY KEY IDENTITY(1,1),
mad VARCHAR(50),
telefon VARCHAR(15),
mail VARCHAR(20),
parola VARCHAR(15),
adresid INT)

SELECT * FROM Musteri

INSERT INTO Musteri VALUES('Ahmet','05412589632','ahmt@gmail.com','123ahmet',1)
INSERT INTO Musteri VALUES('Melike','05122589632','melike@gmail.com','1234',2)
INSERT INTO Musteri VALUES('Halil','05522128654','halil@gmail.com','125',3)

CREATE TABLE Satis(
satýsid INT NOT NULL PRIMARY KEY IDENTITY(1,1),
odemeid INT,
teslimid INT,
urunid INT,
mid INT)

INSERT INTO Satis VALUES(1,1,1,1)
INSERT INTO Satis VALUES(2,2,2,2)
INSERT INTO Satis VALUES(3,3,3,3)

CREATE TABLE Urun(
urunid INT NOT NULL PRIMARY KEY IDENTITY(1,1),
uad VARCHAR(50) ,
fiyat INT,
açýklama VARCHAR(250),
firmaid INT,
kategoriid INT)

INSERT INTO Urun VALUES('pizza','20','peynir,sucuk,biber,mýsýr,mantar',1,1)
INSERT INTO Urun VALUES('kola','5','peynir,köfte,domates',2,2)
INSERT INTO Urun VALUES('sütlaç','10','süt,pirinç,þeker',3,3)


CREATE TABLE Kategorii(
kategoriid INT NOT NULL PRIMARY KEY IDENTITY(1,1),
kad VARCHAR(50),
urunid INT)

INSERT INTO Kategorii VALUES('yemek',1)
INSERT INTO Kategorii VALUES('icecek',2)
INSERT INTO Kategorii VALUES('tatli',3)


CREATE TABLE Firma(
firmaid INT NOT NULL PRIMARY KEY IDENTITY(1,1),
fad VARCHAR(50),
ftelefon VARCHAR(11),
adresid INT)

INSERT INTO Firma VALUES('Ozseven','02129874152',4)
INSERT INTO Firma VALUES('Kervan' ,'02127413698',5)
INSERT INTO Firma VALUES('Osmanlý' ,'02129874563',7)


CREATE TABLE Teslim(
teslimid INT NOT NULL PRIMARY KEY IDENTITY(1,1),
kalkis_zamani datetime,
varis_zamani datetime,
durumid INT)

INSERT INTO Teslim VALUES('15-05-2020 11:15:12','15-05-2020 11:45:42',1)
INSERT INTO Teslim VALUES('16052020 12:15:12.000 ','16052020 12:45:36.000',2)
INSERT INTO Teslim VALUES('15052020 13:15:45 AM','15052020 13:45:05 AM',3)




CREATE TABLE Durum(
durumid INT NOT NULL PRIMARY KEY IDENTITY(1,1),
dad VARCHAR(15))

INSERT INTO Durum VALUES('Gönderildi')
INSERT INTO Durum VALUES('Beklemede')
INSERT INTO Durum VALUES('Gönderildi')

CREATE TABLE Odeme(
odemeid INT NOT NULL PRIMARY KEY IDENTITY(1,1),
oad VARCHAR(10))

INSERT INTO Odeme VALUES('Nakit')
INSERT INTO Odeme VALUES('Nakit')
INSERT INTO Odeme VALUES('K.Kartý')


CREATE TABLE Adresler(
adresid INT NOT NULL PRIMARY KEY IDENTITY(1,1) ,
il VARCHAR(15),
ilce VARCHAR(20),
cadde VARCHAR(20),
mahalle VARCHAR(25),
sokak VARCHAR(20),
diskapino INT,
ickapino INT)
SELECT * FROM Adresler;

INSERT INTO Adresler VALUES('Aydýn','Dere','Mimar','Osmanlý','5042',12,4)
INSERT INTO Adresler VALUES('Kahramanmaras','Onikisubat','','Abdulhamithan','3035',8,9)
INSERT INTO Adresler VALUES('Kocaeli','Darýca','Sokullu','Baglarbasi','Rýza',16,7)

INSERT INTO Adresler VALUES('Tokat','Turhal','1258','Kilic','4563',18,7)
INSERT INTO Adresler VALUES('Ýzmir','Göztepe','1355','Fatih','Enes',10,14)
INSERT INTO Adresler VALUES('Konya','Meram','1258','Kilic','4563',28,16)


SELECT mid,mad,telefon FROM Musteri WHERE mid=(Select mid From Satis Where urunid =(SELECT urunid FROM Urun WHERE uad='pizza')) 
SELECT * FROM Firma WHERE fad LIKE'%a%' AND adresid=(SELECT adresid From Adresler Where ilce='Meram')
SELECT * FROM Musteri WHERE mad= 'Melike' AND (adresid=(SELECT adresid FROM Adresler Where il='Kahramanmaras' ) OR adresid=(SELECT adresid FROM Adresler Where il='Kocaeli'))
Select*From Urun where(urunid=1 OR urunid=3)And fiyat>=5
SELECT * FROM Urun where fiyat>(SELECT AVG(fiyat) AS "Ortalama" FROM Urun)

































SELECT * FROM Urun where fiyat>(SELECT AVG(fiyat) AS "Ortalama" FROM Urun)