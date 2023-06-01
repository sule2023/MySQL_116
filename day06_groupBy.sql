/* ======================== ALIASES ===========================
   Aliases kodu ile tablo yazdirilirken, field isimleri sadece
   o cikti icin degistirilebilir.
===============================================================*/
CREATE TABLE employees
(
employee_id char(9),
employee_name varchar(50),
employee_birth_city varchar(50)
);
INSERT INTO employees VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO employees VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO employees VALUES(345678901, 'Mine Bulut', 'Izmir');
SELECT * FROM employees;


select employee_id AS id,employee_name AS NAME, employee_birth_city AS birth_city
from employess;

/* ======================== GROUP BY CLAUSE ===========================
   Group By komutu sonuclari bir veya daha fazla sutuna gore
   gruplamak icin SELECT komutuyla birlikte kullanilir.
   
   GROUP BY komutu her grup basina bir satir dondurur.
   
   GROUP BY AGGREGATE fonksiyonlariyla birlikte kullanilir.
======================================================================*/  
CREATE TABLE manav (
    isim VARCHAR(50),
    urun_adi VARCHAR(50),
    urun_miktar INT
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
INSERT INTO manav VALUES( 'Ali', null, 2);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 1);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 4);
INSERT INTO manav VALUES( 'Ayse', null, 3);
SELECT * FROM manav;

-- 1) Isme gore, alinan urunlerin toplam kilosunu bulup,
-- isim sirasina gore siralayin.
select isim, sum(urun_miktar)as top_kg -- isme gore toplam urun getir  -- as ile kisa isim verdik 
from manav      --  manav tablosundan geleck
group by isim -- gruplnck  yer
order by isim; -- isme grore siralma yapck

-- 2) Isme gore, alinan urunlerin toplam kilosunu bulup,
-- isim sirasina gore ters siralayin.
select isim, sum(urun_miktar)as top_kg 
from manav      
group by isim 
order by isim desc; -- ismi ters sirali getrck

-- 3) Isme gore, alinan urunlerin toplam kilosunu bulup,
-- toplam kiloya gore ters siralayin.(-- yeni  ismi kullabilirz)
select isim, sum(urun_miktar)as top_kg 
from manav      
group by isim 
order by top_kg desc; -- yeni ismini kullndik

-- 4) Urun ismine gore, urunu alan toplam kisi sayisini,
-- kisi sayisina gore siralayiniz.

select urun_adi, count(isim) as kisi_sayisi
from manav      
group by urun_adi 
order by kisi_sayisi; 

-- 5) Satilan meyve turune (urun_adi) gore urun alan kisi sayisini,
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin. kisi sayisni  sayma count ile oluyor
SELECT urun_adi, COUNT(isim) AS urun_alan_kisi_sayisi
FROM manav
WHERE urun_adi IS NOT NULL
GROUP BY urun_adi
ORDER BY urun_adi;
-- 6) Alinan kilo miktarina gore musteri sayisini, urun_miktar
-- sirasina gore listeleyiniz.
SELECT urun_miktar, COUNT(isim) AS urun_alan_kisi_sayisi
FROM manav
GROUP BY urun_miktar
ORDER BY urun_miktar;

-- 7) Satilan meyvenin 4 harfli olmasina (urun_adi) gore urun alan kisi sayisini,
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.

SELECT urun_adi, COUNT(isim) AS urun_alan_kisi_sayisi
FROM manav
WHERE urun_adi like'____' 
GROUP BY urun_adi
ORDER BY urun_adi;

-- 8) Satilan meyve turune (urun_adi) gore satilan (urun_miktari)
-- MIN ve MAX urun miktarlarini, MAX urun miktarina gore siralayarak
-- listeleyen OUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.
SELECT urun_adi, MIN(urun_miktar)min_kg, MAX(urun_miktar)max_kg
FROM manav
WHERE urun_adi is not null
GROUP BY urun_adi
ORDER BY max_kg desc;

-- 9) Kisi ismine ve urun_adina gore satilan urunlerin toplamini
-- gruplandiran ve isime gore ters sirada listeleyen QUERY yaziniz.

SELECT isim,urun_adi, SUM(urun_miktar)top_kg
FROM manavhholl
GROUP BY isim,urun_adi
ORDER BY isim desc; 
-- not : burada isim ve urun adini bir kelime gb 
-- algiladigi icin siralamada urun adinida goz onunde bulunduruyor 
