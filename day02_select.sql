/*==================================SELECT-WHERE=============================================
Verileri SELECT komutu ile veritabanindan cekerken filtreleme yapmak icin : 
 
SELECT ile birlikte WHERE komutu kullanilabilir.
-----Syntax----- :
SELECT field1, field2 
FROM tablo_adi 
WHERE kosul;
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
=========================================================================================*/
CREATE TABLE meslek_lisesi (
okul_no CHAR(4) UNIQUE,
isim VARCHAR(50) NOT NULL,
derece DOUBLE,
adres VARCHAR(100),
son_degisiklik_tarihi DATE
);
SELECT * FROM meslek_lisesi; -- yildiz meslek lisesinden hepsini getir demektir
INSERT INTO meslek_lisesi VALUES('1001','Fatih Oz', 89,'Ankara', '2022-11-23');      
INSERT INTO meslek_lisesi VALUES('1002','Fatih Yildiz', 94,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1003','Bora Sverige', 78,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1004','Nevzat Celik', 69,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1005','Gursel Unal', 90,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1006','Soner Karatasoglu ', 85,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1007','Talha Kurt', 75,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1008','Yakup Lejon', 79,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1009','Ilhan Gurbetci', 80,'Izmir', '2022-11-23');
-- Q1 : Derecesi 90'dan yuksek olan ogrencilerin tum bilgilerini getirin.

SELECT * -- hangi  bilgileri getirecegiz tamami vya bir kismi mi onu getrir select 
FROM meslek_lisesi
WHERE derece>90;
-- Q2 : Derecesi 80'den kucuk olan ogrencilerin isimlerini listeleyin.

SELECT isim
FROM meslek_lisesi
WHERE derece<80;

-- Q3 : Adresi Ankara olan ogrencilerin isim ve derece bilgilerini listeleyin.
SELECT isim,derece
FROM meslek_lisesi
where adres='Ankara';-- harfin kucuk vye buyuk olmasi onemli  degil onemli  olan ayni harf olmali 

-- Q4 : okul_no'su 1005 olan ogrencinin isim ve adres bilgisini listeleyin

SELECT isim,adres
from meslek_lisesi
where okul_no='1005';-- tirnak koymasaydik yine calisirdi 

-- Q5 : Derecesi 70 ile 80 arasinda olan ogrencilerin okul_no ve adreslerini listeleyin.
-- select okul_no,adres -- bana bu bilgileri getir
-- from meslek_lisesi   -- meslek lisesinden getir
-- where 70<derece<80; -- bu kismi tamamen sana kalmis bir sekilde formul yap,bu formul tum listeyi getryor  

select okul_no,adres 
from meslek_lisesi   
where 70<derece && derece<80; -- artik kelimeler daha onemli where 70<derece AND derece<80; BU DAHA GUZEL 


select okul_no,adres 
from meslek_lisesi   
where 70<derece AND derece<80;  

/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla 
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 AND deger2;
=========================================================================================*/

/*==========================AND (ve) Operatoru kullanimi==================================
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez.

SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50

Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
/*==========================OR (veya) Operatoru kullanimi==================================
=> Or ile belirtilen sartlardan en az biri gerceklesiyorsa o kayit listelenir,
sartlardan hicbiri gerceklesmiyorsa o kayit listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu ornekte sinav1 veya sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
=========================================================================================*/
-- *************************************************************************
CREATE TABLE ogretmen_lisesi(
id int,
isim VARCHAR(45),
adres VARCHAR(100),
sinav_notu DOUBLE
);
INSERT INTO ogretmen_lisesi VALUES (111, 'Emine Yucel', 'Ankara', 75);
INSERT INTO ogretmen_lisesi VALUES (112, 'Muhammet Talha Kurt', 'Istanbul', 85);
INSERT INTO ogretmen_lisesi VALUES (113, 'Ilhan Sahin', 'Ankara', 70);
INSERT INTO ogretmen_lisesi VALUES (114, 'Kadir Corumlu', 'Corum', 90);
INSERT INTO ogretmen_lisesi VALUES (115, 'Selman Kasabali', 'Ankara',70);
INSERT INTO ogretmen_lisesi VALUES (116, 'Murat Aycicek', 'Izmir', 85);
INSERT INTO ogretmen_lisesi VALUES (117, 'Tugba Ozsoy', 'Bolu', 85);
SELECT * FROM ogretmen_lisesi;
/*-------------------------------------------------------------------------
Q4: sinav notu 70'ten buyuk 80'den kucuk olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/
-- *************** cvp 1.yol****************
select * 
from ogretmen_lisesi
where  sinav_notu <80 and 70<sinav_notu;

-- *************** cvp 2.yol****************

select *  
from ogretmen_lisesi
where sinav_notu
between 71 AND 79 ; -- bu gunluk konusma diline uygun tercih edilir -- sinira dahil ettigini  bilerek bu sekilde yazdirck
-- between kosulunda once kucuk olan degeri yazmaliyiz 

/*-------------------------------------------------------------------------
Q7: Muhammet Talha ve Murat arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/
select isim
from ogretmen_lisesi
where isim
between 'muhammet talha ' and 'murat';
-- not : string ifadeler between komutunu ile kiyaslamk istersek  bize
-- sonucu ASCII degerine gore siralayark getrck
-- aalfabet siraladi  alfabedeki  siraya gore ... muhmmet talha dan sonra muhmmt talha kurt
-- ardindan murat murattan sonra murat aycicek ... diye siraliyck cunku biz siniri  soy isimsiz istedik 
-- o sebeple o sira arsinda sadece murat talha kurt  getrir kayitlarimiz muhmmet talha ile  murat arsinda 
-- lafabetik sirayida dikkat ederek getrdi
/*-------------------------------------------------------------------------
Q8: Ankara ile Corum arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/
SELECT isim
FROM ogretmen_lisesi
WHERE adres
BETWEEN 'Ankara ' AND 'Corum';
-- **************************************************************
CREATE TABLE personel(
id CHAR(5),
isim VARCHAR(50),
maas INT
);
INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Meryem',7215);
INSERT INTO personel VALUES('10004','Veli Han',5000);
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES('10006','Ayse Can',5600);
INSERT INTO personel VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Cano',4300);
INSERT INTO personel VALUES('10007','Can Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);
SELECT * FROM personel;
/*-------------------------------------------------------------------------
Q9: id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

SELECT id,isim,maas
FROM personel
WHERE id
BETWEEN '10005' AND '10009'; -- TIRNAKTA BOSLUK koyarsam siralama degisir o sebple 
-- hata yapmamak adina tirnak koymasadanda olurdu

/*-------------------------------------------------------------------------
Q10: Ismi Mehmet Yilmaz ile Veli arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/

SELECT id,isim,maas -- herseyi  istiyorsak * da yeterliydi
FROM personel
WHERE isim
BETWEEN 'Mehmet Yilmaz' AND 'Veli'; -- string ifadesinin icinde bosluk veya karekter koymamaya dikkat et


/*-------------------------------------------------------------------------
Q11: Ismi Ahmet ile Ayse Cano arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE isim
BETWEEN 'Ahmet' AND 'Ayse Cano'; 
/*-------------------------------------------------------------------------
Q12: Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin
---------------------------------------------------------------------------*/
SELECT id
FROM personel
WHERE maas=7000 OR isim='Ayse'; 
/*-------------------------------------------------------------------------
Q13: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/

SELECT isim
FROM personel
WHERE id=10001 OR id=10005 OR id=10008; 

/*================================== SELECT-IN ===========================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/

/*-------------------------------------------------------------------------
Q13: Id'si /*-------------------------------------------------------------------------
Q13: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
olan personel isimlerini listeleyin
SORUNUN BU SEKILDEDE COZUMU
---------------------------------------------------------------------------*/ 
SELECT isim
FROM personel
WHERE id IN (10001,10005,10008);

/*-------------------------------------------------------------------------
Q15: Maasi sadece 7000 veya 12000 olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE maas IN (7000,12000);

/*================================== SELECT-LIKE (gibi)=============================================
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field LIKE pattern
 
 ----------------
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir
 _ ---> Tek bir karakteri temsil eder.
=========================================================================================*/
/*-------------------------------------------------------------------------
Q16: ismi A ile baslayan personel  listele
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE 'a%';
/*-------------------------------------------------------------------------
Q17: isminde Ayse iceren  personelin  listeleyiniz
---------------------------------------------------------------------------*/
SELECT isim
FROM personel
WHERE isim LIKE '%Ayse%';-- bu sekilde ondede ardinda ne olduguna bakmadan tum ayse icerern kayitlari getryor
-- onunde % onundeki  karekter olsada getriyor 


/*-------------------------------------------------------------------------
Q18: Ismi n harfi ile biten personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT isim
FROM personel
WHERE isim LIKE '%n';
/*-------------------------------------------------------------------------
Q19: Isminin 2. harfi e olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT isim
FROM personel
WHERE isim LIKE '_e%';-- 1.karekter _ temsil etti  ardinda e yi olan herseyi  getr 
/*-------------------------------------------------------------------------
Q20: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT isim
FROM personel
WHERE isim LIKE '_e%'AND isim LIKE '%y%'; -- 2.karekteri e olan ve onunde ardinda y olanlarida getr 
-- her iki kosulu  yazarken isim LIKE yazmaliyiz 
/*-------------------------------------------------------------------------
Q21: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE isim NOT LIKE '%a%';
/*-------------------------------------------------------------------------
Q22: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE maas LIKE '_____';

/*-------------------------------------------------------------------------
Q23: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE isim LIKE 'a_____a%';











