-- ************************ Kelimeler Tablosundan *******************************
/*-------------------------------------------------------------------------
Q1: 3 harfli kelimeleri listeleyin
---------------------------------------------------------------------------*/
select kelime 
from kelimeler
where kelime like'___';
/*-------------------------------------------------------------------------
Q2: En az 3 harfli kelimeleri listeleyin
---------------------------------------------------------------------------*/
select kelime 
from kelimeler
where kelime like'___%';
/*-------------------------------------------------------------------------
Q3: H ile baslayip t ile biten kelimeleri listeleyin
---------------------------------------------------------------------------*/
select kelime 
from kelimeler
where kelime like'H%t';
/*-------------------------------------------------------------------------
Q4: H ile baslayip t ile biten kelimeleri case sensitive listeleyin
---------------------------------------------------------------------------*/
select kelime 
from kelimeler
where regexp_like (kelime , '^H.*t$','c');

insert into kelimeler values(1021,'Hoot',4);
/*-------------------------------------------------------------------------
Q5: H ile baslayip t ile biten 3 harfli kelimeleri case sensitive listeleyin
---------------------------------------------------------------------------*/
select kelime 
from kelimeler
where regexp_like (kelime , '^H[!-~]T$','c');
/*-------------------------------------------------------------------------
Q6: 3 ya da daha az karakterli kelimeleri listeleyin
---------------------------------------------------------------------------*/
select kelime 
from kelimeler
where kelime not like '____%';
/*-------------------------------------------------------------------------
Q7: id'si 8 rakamini iceren kelimeleri listeleyin
---------------------------------------------------------------------------*/
SELECT id
FROM kelimeler
WHERE id LIKE '%8%'

