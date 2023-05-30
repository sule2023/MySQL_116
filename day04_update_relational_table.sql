-- id, isim ve irtibat fieldlarinin oldugu bir tedarik tablosu olusturun.
-- id field'ini Primary Key yapin.
CREATE TABLE tedarik
(
id INT PRIMARY KEY,
isim VARCHAR(10),
irtibat VARCHAR(15)
);
-- tedarikci_id , urun_id , urun_isim , musteri_isim  fieldlari olan urun 
-- tablosu olusturun. Bu tablodaki tedarikci_id fieldini tedarik tablosunun
-- PK 'si ile Foreign Key yapin.
CREATE TABLE urun
(
tedarikci_id INT,
urun_id INT,
urun_isim VARCHAR(10),
musteri_isim VARCHAR(15),
CONSTRAINT urun_fk FOREIGN KEY (tedarikci_id)
REFERENCES tedarik (id)
);
INSERT INTO tedarik VALUES(100, 'IBM', 'Ali Can'); 
INSERT INTO tedarik VALUES(101, 'APPLE', 'Merve Temiz'); 
INSERT INTO tedarik VALUES(102, 'SAMSUNG', 'Kemal Can'); 
INSERT INTO tedarik VALUES(103, 'LG', 'Ali Can');
INSERT INTO urun VALUES(100, 1001,'Laptop', 'Suleyman'); 
INSERT INTO urun VALUES(101, 1002,'iPad', 'Fatma'); 
INSERT INTO urun VALUES(102, 1003,'TV', 'Ramazan'); 
INSERT INTO urun VALUES(103, 1004,'Phone', 'Ali Can');
SELECT * FROM tedarik;
SELECT * FROM urun;
-- 'LG' firmasinda calisan 'Ali Can'in ismini 'Veli Can' olarak degistiriniz.
update tedarik
set irtibat = 'Veli Can'
where isim = 'LG';

/*
a) Urun tablosundan Ali Can'in aldigi urunun ismini, 
tedarik tablosunda irtibat Merve Temiz olan 
sirketin ismi ile degistirin. */
-- 1. Adim : Ali Can'in aldigi urunun ismini Apple olarak degistirin
UPDATE urun
SET urun_isim= 'Apple'
WHERE musteri_isim= 'Ali Can';

-- 2. Adim : Irtibat'i Merve Temiz olan kaydin sirket ismini getirin
select isim
from tedarik
where irtibat = 'Merve Temiz';
-- 3.adim iki sorguyu  birlestitip yapacagiz

UPDATE urun
SET urun_isim= (select isim
                from tedarik
                where irtibat = 'Merve Temiz')
WHERE musteri_isim= 'Ali Can';

/*-------------------------------------------------------------------------
b) TV satin alan musterinin ismini, 
IBM'in irtibat'i ile degistirin.
-------------------------------------------------------------------------*/

update urun 
set musteri_isim = (select irtibat
                    from tedarik
                    where isim ='IBM')
where urun_isim ='TV';


-- ************************************************************************
/*------------------------------------------------------------------------
Mart_satislar isimli bir tablo olusturun, 
icinde urun_id, musteri_isim, urun_isim ve urun_fiyat field'lari olsun
1) Ismi hatice olan musterinin urun_id'sini 30,urun_isim'ini Ford yapin 
2) Toyota marka araclara %10 indirim yapin 
3) Ismi Ali olanlarin urun_fiyatlarini %15 artirin 
4) Honda araclarin urun id'sini 50 yapin.
--------------------------------------------------------------------------*/
CREATE TABLE mart_satislar 
(
 urun_id int,
 musteri_isim varchar(20),
 urun_isim varchar(10),
 urun_fiyat int 
);
INSERT INTO mart_satislar VALUES (10, 'Ali', 'Honda',75000); 
INSERT INTO mart_satislar VALUES (10, 'Ayse', 'Honda',95200); 
INSERT INTO mart_satislar VALUES (20, 'Hasan', 'Toyota',107500); 
INSERT INTO mart_satislar VALUES (30, 'Mehmet', 'Ford', 112500); 
INSERT INTO mart_satislar VALUES (20, 'Ali', 'Toyota',88000); 
INSERT INTO mart_satislar VALUES (10, 'Hasan', 'Honda',150000); 
INSERT INTO mart_satislar VALUES (40, 'Ayse', 'Hyundai',140000); 
INSERT INTO mart_satislar VALUES (20, 'Hatice', 'Toyota',60000);
SELECT * FROM mart_satislar;
-- 1) Ismi hatice olan musterinin urun_id'sini 30,urun_isim'ini Ford yapin 

update mart_satislar
set urun_id= 30, urun_isim='Ford'
where musteri_isim = 'Hatice';
-- 2) Toyota marka araclara %10 indirim yapin 

update mart_satislar
set urun_fiyat = urun_fiyat *0.9
where urun_isim= 'Toyota';

-- 3) Ismi A ile baslayan butun musterilerin urun_fiyatlarini %15 artirin
update mart_satislar
set urun_fiyat = urun_fiyat*1.15
where musteri_isim like ('a%');
-- 4) Honda araclarin urun id'sini 50 yapin.
update mart_satislar
set urun_id = 50
where urun_isim= 'Honda';

