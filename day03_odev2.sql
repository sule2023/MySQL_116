/*-------------------------------------------------------------------------
1) Lise tablosu olusturun.
 Icinde id,isim,veli_isim ve grade field'lari olsun. 
 Id field'i Primary Key olsun.
 --------------------------------------------------------------------------*/
  create table lise
  (
  id int primary key,
  isim varchar (20),
  veli_isim varchar(20),
  grade int
  
  );
 /*-------------------------------------------------------------------------
 2)  Kayitlari tabloya ekleyin.
 (123, 'Ali Can', 'Hasan',75), 
 (124, 'Merve Gul', 'Ayse',85), 
 (125, 'Kemal Yasa', 'Hasan',85),
 (126, 'Rumeysa Aydin', 'Zeynep',85);
 (127, 'Oguz Karaca', 'Tuncay',85);
 (128, 'Resul Can', 'Tugay',85);
 (129, 'Tugay Kala', 'Osman',45);
 --------------------------------------------------------------------------*/
 insert into lise values
 (123, 'Ali Can', 'Hasan',75), 
 (124, 'Merve Gul', 'Ayse',85), 
 (125, 'Kemal Yasa', 'Hasan',85),
 (126, 'Rumeysa Aydin', 'Zeynep',85),
 (127, 'Oguz Karaca', 'Tuncay',85),
 (128, 'Resul Can', 'Tugay',85),
 (129, 'Tugay Kala', 'Osman',45);
 /*-------------------------------------------------------------------------
3)deneme_puani tablosu olusturun. 
ogrenci_id, ders_adi, yazili_notu field'lari olsun, 
ogrenci_id field'i Foreign Key olsun 
--------------------------------------------------------------------------*/
create table deneme_puani
(
ogrenci_id int,
ders_adi varchar(10),
yazili_notu int,
constraint deneme_fk foreign key(ogrenci_id )
references lise(id)
);
/*-------------------------------------------------------------------------
4) deneme_puani tablosuna kayitlari ekleyin
 ('123','kimya',75), 
 ('124','fizik',65),
 ('125','tarih',90),
 ('126','kimya',87),
 ('127','tarih',69),
 ('128','kimya',93),
 ('129','fizik',25)
--------------------------------------------------------------------------*/
insert into deneme_puani values
('123','kimya',75), 
 ('124','fizik',65),
 ('125','tarih',90),
 ('126','kimya',87),
 ('127','tarih',69),
 ('128','kimya',93),
 ('129','fizik',25);
 
 select *from lise;
 select *from deneme_puani;
/*-------------------------------------------------------------------------
5) Ismi Resul Can olan ogrencinin grade ini deneme_puani tablosundaki 
ogrenci id'si 129 olan yazili notu ile update edin. 
--------------------------------------------------------------------------*/
update lise
set grade =(select yazili_notu
from deneme_puani
where ogrenci_id =129)
where isim= 'Resul Can';
/*-------------------------------------------------------------------------
6) Ders adi fizik olan kayitlarin yazili notunu Oguz Karaca'nin grade'i
ile update edin. 
--------------------------------------------------------------------------*/
update deneme_puani
set yazili_notu=(select grade
from lise
where isim = 'Oguz Karaca')
where ders_adi= 'fizik';

/*-------------------------------------------------------------------------
7) Ali Can'in grade'ini, 124 ogrenci_id'li yazili_notu ile guncelleyin.
--------------------------------------------------------------------------*/
update lise 
set grade=(select yazili_notu
from deneme_puani
where ogrenci_id= 124)
where isim = 'Ali Can';

/*-------------------------------------------------------------------------
8) Ders adi Kimya olan yazili notlarini Rumeysa Aydin'in 
grade'i ile guncelleyin.
--------------------------------------------------------------------------*/
update deneme_puani
set yazili_notu = (select grade
from lise
where isim ='Rumeysa Aydin')
where ders_adi= 'Kimya';

/*-------------------------------------------------------------------------
9) Ders adi tarih olan yazili notlarini Resul Can'in 
grade'i ile guncelleyin.
--------------------------------------------------------------------------*/
update deneme_puani 
set yazili_notu=(select grade
from lise
where isim='Resul Can')
where Ders_adi ='tarih';
/*-------------------------------------------------------------------------
10) Ders adi fizik olan yazili notlarini veli adi Tuncay olan 
grade ile guncelleyin.
--------------------------------------------------------------------------*/
update deneme_puani 
set yazili_notu=(select grade
from lise
where veli_isim='Tuncay')
where Ders_adi ='fizik';

/*-------------------------------------------------------------------------
11) Tum ogrencilerin gradelerini deneme_puani tablosundaki yazili_notu ile update edin. 
--------------------------------------------------------------------------*/
update lise
set grade=( select yazili_notu
from deneme_puani
where deneme_puani.ogrenci_id =lise.id
)


