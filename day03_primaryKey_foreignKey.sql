-- ====== tekrar ======
-- tanimlayici, ortak anahterdi  
-- iki tabloyu  birbirine  baglamak icin kullaniyoruz
-- iki ozelligi  vr; unique ve not null nul kabul etmiyor 
--  max bir tane primary  olmaliiii bir tabloda
-- birbiryle bagli olan tablolarda her tabloda pk olabilirken olmayabilirde 
-- 1 tabloda mx 1 pk olmali
-- birden fazla tablonun iliskisini tanimlamak icin EN AZ 1 tane pk olmali 
-- ama bir tablonun kendi  icinde max bir pk olmali 
-- FK null kabul eder puplicate kabul eder
-- bir tabloda birden fazlada fk olabilir 
-- bir pk kendi tablosunda fk  donusebilir 
-- bir tabloda birden fazla fk olabilir 
/*====================================== PRIMARY KEY ==============================================
1) Primary Key bir record'u tanimlayan bir field veya birden fazla field'in kombinasyonudur. 
2) Primary Key Unique'dir. 
3) Bir tabloda en fazla bir Primary Key olabilir .
4) Primary Key field'inda hic bir data NULL olamaz.
-----Syntax-----
 "id" field'ini "primary key" yapmak icin 2 yol var.
1) Data Type'dan sonra "PRIMARY KEY" yazarak.
 
 CREATE TABLE students_table 
(
 id int PRIMARY KEY,
 name varchar(50) NOT NULL,
 grade int,
 adres varchar(100),
 last_update date 
);
2) CONSTRAINT Keyword Kullanilarak Primary Key Tanimlanabilir; 
"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n)" 
CREATE TABLE students 
(
id int,
name varchar(50) NOT NULL,
grade int,
address varchar(100),
last_modification date, 
CONSTRAINT id_pk PRIMARY KEY (id) 
);
================================================================================================*/

/*---------------------------------------------------------------------
"sehirler" isimli bir Table olusturun. 
Tabloda "alan_kodu", "isim", "nufus" field'lari olsun. 
Isim field'i bos birakilamasin. 
1.Yontemi kullanarak "alan_kodu" field'ini "Primary Key" yapin
-----------------------------------------------------------------------*/
CREATE TABLE sehirler
(
alan_kodu int primary key,
isim varchar(50) NOT NULL,
nufus int
);


/*------------------------------------------------------------------------------
"ogretmenler" isimli bir Table olusturun. 
Tabloda "id", "isim", "brans", "cinsiyet" field'lari olsun. 
Id field'i tekrarli deger kabul etmesin. 
2.Yontemi kullanarak "id ve isim" field'lerinin birlesimini "primary key" yapin 
-------------------------------------------------------------------------------*/
CREATE TABLE ogretmenler
(
id int unique,
isim varchar(50) NOT NULL,
brans varchar(25),
cinsiyet varchar(1),

CONSTRAINT id_isim_pk primary key (id,isim) 
);
select * from ogretmenler;
/*------------------------------------------------------------------------------
"universite_ogrenci_bilgi_sistemi" isimli bir Table olusturun. 
Tabloda "giris yili", "giris siralamasi", "isim", "bolum" field'lari olsun. 
isim field'i null deger kabul etmesin. 
2.Yontemi kullanarak "giris yili ve giris siralamasi" field'lerinin birlesimini
 "primary key" yapin 
-------------------------------------------------------------------------------*/
CREATE TABLE universite_ogrenci_bilgi_sistemi
(
giris_yili int ,
giris_siralamasi int,
isim varchar(25) NOT NULL,
bolum varchar(10),
CONSTRAINT ogrencino_pk primary key(giris_yili,giris_siralamasi) 
);
select * from universite_ogrenci_bilgi_sistemi;

/*====================================== FOREIGN KEY ==============================================
=> Foreign Key iki tablo arasinda Relation olusturmak icin kullanilir. 
=> Foreign Key baska bir tablonun Primary Key'ine baglidir. 
=> Referenced table (baglanilan tablo, Primary Key'in oldugu Tablo) parent table olarak adlandirilir. 
   Foreign Key'in oldugu tablo ise child table olarak adlandirilir. 
=> Bir Tabloda birden fazla Foreign Key olabilir. 
=> Foreign Key NULL degeri alabilir. 
=> Foreign Key duplicate olabilir. 

Note 1: "Parent Table"da olmayan bir id'ye sahip datayi "Child Table"'a ekleyemezsiniz .
Note 2: Child Table'i silmeden Parent Table'i silemezsiniz. Once "Child Table" silinir, 
sonra "Parent Table" silinir.
        
-----Syntax-----
CONSTRAINT constraintName FOREIGN KEY(table_name_id) 
REFERENCES parent_table (parent_table_field_name) 
CREATE TABLE table_name
(
id char(10),
name char(10),
CONSTRAINT constraint_name 
FOREIGN KEY (table_name_id) 
REFERENCES parent_table (parent_table_field_name) 
);
        
==================================================================================================*/
/*------------------------------------------------------------------------
"tedarikci" isimli bir tablo olusturun. 
Tabloda "tedarikci_id", "tedarikci_ismi", "iletisim_isim" field'lari olsun 
ve "tedarikci_id" yi Primary Key yapin.
 "urunler" isminde baska bir tablo olusturun "tedarikci_id" ve "urun_id"
 field'lari olsun ve "tedarikci_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/
create table tedarikci
( 
tedarikci_id char(4) primary key,
tedarikci_isim varchar(20),
iletisim_isim varchar(20)
);

create table urunler
( 
tedarikcinin_id char(4),
urun_id int,
iletisim_isim varchar(20),
constraint urunler_fk foreign key(tedarikcinin_id)
references tedarikci (tedarikci_id)
);

/*------------------------------------------------------------------------
"bebeler" isimli bir tablo olusturun. 
Tabloda "id", "isim", "iletisim" field'lari olsun 
ve "id" yi Primary Key yapin.
 "notlar" isminde baska bir tablo olusturun "bebe_id" ve "puan"
 field'lari olsun ve "bebe_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/
create table bebeler
( 
id int primary key,
isim varchar(20),
iletisim char(11)
);

create table notlar 
( 
bebe_id int,
puan double,
constraint notlarin_fk foreign key(bebe_id)
references bebeler(id)
);






