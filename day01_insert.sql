/*========================================
               VERI GIRISI
========================================*/
-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken Tabloyu 
-- olustururken degerleri atadigimiz veri cinsinden olmasi
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL 'in default tarih formati YYYY-MM-DD seklindedir.
/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/
-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve 
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.
use sys;
CREATE TABLE fen_lisesi

( 
okul_no INT UNIQUE,
isim VARCHAR(20) NOT NULL,
derece DOUBLE,
adres VARCHAR(20),
son_degisiklik_tarihi DATE
);
SELECT * FROM fen_lisesi;

INSERT INTO fen_lisesi VALUES(101,'Mustafa Onkibar', 4.3,'Rize','2023-05-23');
INSERT INTO fen_lisesi VALUES(102,'Esat Fatih', 4.5,'Balikesir','2023-05-22');
INSERT INTO fen_lisesi VALUES(103,'Sevde Hanim', 4.2,'Erzurum','2023-05-19');
INSERT INTO fen_lisesi VALUES(104,'Veysel Jonturk ', 3.9,'Mersin','2023-05-22');
INSERT INTO fen_lisesi VALUES(105,'Yasemin Tahtali', 4.9,'Kutahya','2023-05-22');
INSERT INTO fen_lisesi VALUES(106,'Kubra Filiz', 3.8,'Ankara','2023-05-22');
INSERT INTO fen_lisesi VALUES(107,'Adem Tekin', 3.7,'null','2023-03-29');
INSERT INTO fen_lisesi VALUES(null,'Muhammet Ozyon ', 3.7,'Ankara','2023-03-19');
INSERT INTO fen_lisesi VALUES(null,'Kubra Tekin', 3.7,'Aydin','2023-03-19');

-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder, 
-- diger kayitlarda duplicate hatasi verir.

/* ----------------------------------------------
Q1 : okul_no , isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */
CREATE TABLE anadolu_lisesi
(
okul_no CHAR (4)UNIQUE,
isim VARCHAR(20) NOT NULL,
adres VARCHAR(20),
derece DOUBLE 
);
SELECT * FROM anadolu_lisesi;
INSERT INTO anadolu_lisesi VALUES( '1001','Esat Fatih','Ankara',4.7);
INSERT INTO anadolu_lisesi VALUES( '1002','Yusuf Rahman','Ankara',4.8);
INSERT INTO anadolu_lisesi VALUES( '1003','Muhammet ozyon','Marmara',4.3);
INSERT INTO anadolu_lisesi VALUES( '1004','Sevda ','Ankara',4.7);
INSERT INTO anadolu_lisesi VALUES( '1005','Cemil Cetin ','Istanbul',4.7);
INSERT INTO anadolu_lisesi VALUES( '1006','Sule Yilmaz ','Amestardam',4.7);
INSERT INTO anadolu_lisesi VALUES( '','Ali Yilmaz ','Amestardam',4.7);-- 1.hicligi ilkini kaydeder 
INSERT INTO anadolu_lisesi VALUES( '','Veli Yilmaz ','Amestardam',4.7); -- 2.kez hicligi kaydetmez-- kirmizi uyari  verir
INSERT INTO anadaolu_lisesi (okul_no,isim) VALUES ('1007','Ayse Yilmaz');
INSERT INTO anadolu_lisesi (adres,isim) VALUES ('Antalya','Ayse Yilmaz');
INSERT INTO anadolu_lisesi (adres,okul_no,derece) VALUES ('Antalya','1008',3.2);--  bu kaydi kabul etmez isim olmazsa girisi kabul etmeme komutu verdik



