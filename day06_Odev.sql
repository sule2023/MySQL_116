-- ********************** Isciler Tablosundan ************************
-- 1) Isme gore toplam maaslari bulun
-- 2) Sehre gore toplam isci sayisini bulun
-- 3) Sehre gore toplam isci sayisini, buyukten kucuge yazdiriniz 
-- 4) Sirketlere gore maasi 5000 liradan fazla olan isci sayisini bulun
-- 5) Her sirket icin Min ve Max maasi bulun
CREATE TABLE isciler
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO isciler VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO isciler VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO isciler VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO isciler VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO isciler VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO isciler VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO isciler VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
SELECT * FROM isciler;

-- 1) Isme gore toplam maaslari bulun
Select isim,sum(maas)top_maas
from isciler
group by isim
order by top_maas;

-- 2) Sehre gore toplam isci sayisini bulun
select sehir, count(isim)isci_sayisi
from isciler
group by sehir
order by isci_sayisi;

-- 3) Sehre gore toplam isci sayisini, buyukten kucuge yazdiriniz 
select sehir, count(isim)isci_sayisi
from isciler
group by sehir
order by isci_sayisi desc;

-- 4) Sirketlere gore maasi 5000 liradan fazla olan isci sayisini bulun
select sirket, count(isim)isci_sayisi
from isciler
where maas>5000
group by sirket
order by isci_sayisi;

-- 5) Her sirket icin Min ve Max maasi bulun

SELECT sirket, MIN(maas) AS min_maas, MAX(maas) AS max_maas
FROM isciler
GROUP BY sirket
ORDER BY min_maas, max_maas;





