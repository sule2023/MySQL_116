/* ======================== EXISTS CONDITION ===========================
EXISTS Condition subquery'ler ile kullanilir. IN ifadesinin kullanimina
benzer olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen 
degerlerin icerisinde bir degerin olmasi veya olmamasi durumunda islem 
yapilmasini saglar.
======================================================================*/

CREATE TABLE mayis_satislar
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO mayis_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar VALUES (20, 'John', 'Toyota');
INSERT INTO mayis_satislar VALUES (30, 'Amy', 'Ford');
INSERT INTO mayis_satislar VALUES (20, 'Mark', 'Toyota');
INSERT INTO mayis_satislar VALUES (10, 'Adem', 'Honda');
INSERT INTO mayis_satislar VALUES (40, 'John', 'Hyundai');
INSERT INTO mayis_satislar VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan_satislar
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');
select*from mayis_satislar;
select*from nisan_satislar;
/*----------------------------------------------------------------
SORU 1 : Her iki ayda da ayni id ile satilan urunlerin urun_id'lerini
ve urunleri mayis ayinda alanlarin isimlerini getiren bir query yaziniz.
----------------------------------------------------------------*/ 
-- 1.cozum where in ile 
select urun_id,musteri_isim 
from mayis_satislar
where urun_id in (select urun_id
from nisan_satislar
where mayis_satislar.urun_id= nisan_satislar.urun_id);

-- 2.cozum exists ile
select urun_id,musteri_isim 
from mayis_satislar
where exists (select urun_id
from nisan_satislar
where mayis_satislar.urun_id= nisan_satislar.urun_id);

select urun_id,musteri_isim 
from mayis_satislar
where exists (select urun_id
from nisan_satislar
where mayis_satislar.urun_isim= nisan_satislar.isim_id); -- not ortak basliklar uzerinden yapilabilirim

/*----------------------------------------------------------------
SORU 2 : Her iki ayda da satilan urun_isimleri ayni urunlerin,
urun_isim'ini ve urunleri nisan ayinda alan musterilerin isimlerini 
getiren bir Query yaziniz.
----------------------------------------------------------------*/ 

select urun_isim, musteri_isim 
from nisan_satislar
where exists (select urun_isim
from mayis_satislar
where mayis_satislar.urun_isim= nisan_satislar.urun_isim);

/*----------------------------------------------------------------
SORU 3 : Nisan ayinda satilip mayis ayinda satilmayan urun ismini ve
satin alan kisiyi listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/
select urun_isim, musteri_isim 
from nisan_satislar
where not exists  (select urun_isim
from mayis_satislar
where mayis_satislar.urun_isim = nisan_satislar.urun_isim);

/*----------------------------------------------------------------
SORU 4 : Mayis ayinda satilip nisan ayinda satilmayan urun id ve
satin alan kisiyi listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/


select urun_id, musteri_isim 
from mayis_satislar
where not exists  (select urun_id
from nisan_satislar
where mayis_satislar.urun_id = nisan_satislar.urun_id);

/* ======================== IS NULL CONDITION ===========================
    Arama yapilan field'da NULL degeri almis kayitlari getirir.
======================================================================*/

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
SELECT * FROM insanlar;

-- ismi null olan kayitlari listele
select* 
from insanlar
where isim is null ;

-- Ismi null olan kayitlari 'Isimsiz' olarak guncelleyin :
update insanlar     
set isim = 'Isimsiz'
where isim is null;
-- NOT -- insanlar tablosunda degeri  null olan  isim girilmeyen ktuyu isim yeri  bos degil isimsiz olarak degistrdik 

-- isimsiz kayitlari  silin
delete from insanlar
where isim = 'Isimsiz';

-- ismi null olanlari silin
delete from insanlar
where isim is null;

/* ======================== ORDER BY- siralama ===========================
=> ORDER BY komutu belli bir field'a gore NATURAL ORDER olarak siralama
yapmak icin kullanilir.
=> ORDER BY komutu sadece SELECT komutu ile kullanilir.
=> ORDER BY komutuna ozel olarak, siralama yapacagimiz field ismi yerine 
field sirasini da yazabiliriz.
=> Isimleri natural order'a gore siralamak icin sorgunun sonuna 
 ORDER BY (field_name) yazmak yeterlidir.
=> Isimleri ters siralama ile yazdirmak isterseniz DESC -azalan orn Z' den A ye gb yaziyoruz.
-- asc ise artan A' dan Z ye gb 
=> Ayni degerde olan kayitlari, tablodaki kayit sirasina gore getirir.
==============================================================*/
CREATE TABLE insanciklar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
INSERT INTO insanciklar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanciklar VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanciklar VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanciklar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanciklar VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanciklar VALUES (345678901, 'Ali','Yilmaz', 'Istanbul');
SELECT * FROM insanciklar;

-- Soru 1: Insanciklar tablosundaki datalari adres'e gore siralayin :
select * 
from insanciklar
order by adres; -- kayit sirasina  gore getrr

-- Soru 2: Isim' i Mine olanlari soyisim sirali olarak listeleyen Query yaziniz.
select *
from insanciklar
where isim ='Mine' -- mine leri  where getrip
order by soyisim; --- soysisim siralamayi  order by ile olack

-- Soru 3: Insanciklar tablosundaki soyismi BULUT olanlari isim sirali olarak listeleyin
select *
from insanciklar
where soyisim ='Bulut' 
order by isim;

-- Soru 4: Insanciklar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin.
select * -- SELECT YANINA NE YAZARSAK O SUTUNU  GETRYOR BISEY YAZMAZSAK TUM SUTUNLARI GTRR-- ssn desydik ssn
from insanciklar
order by SSN desc; -- tum siralamyi  kayit sirasini baz alarak buyuklugu  kucuklugu siralar

-- Soru 5: Insanciklar tablosundaki tum kayitlari SSN numarasina gore siralayin.
select * 
from insanciklar
order by SSN asc; -- tum siralamyi  kayit sirasini baz alarak   kucuklugu buyuklugu siralar

-- Soru 6: Insanciklar tablosundaki tum kayitlari Soyisimler ters sirali,
-- isimler Natural sirali olarak listeleyin.
select * 
from insanciklar
order by soyisim desc, isim;
-- Soru 7: Insanciklar tablosundaki tum kayitlari adresler ters sirali, 
-- isimler ters sirali olarak listeleyin
select * 
from insanciklar
order by adres desc, isim desc;

-- Soru 8: Insanciklar tablosundaki tum kayitlari adresler ters sirali, 
-- isimler ters sirali, soyisimler ters sirali olarak listeleyin
select * 
from insanciklar
order by adres desc, isim desc, soyisim desc;

