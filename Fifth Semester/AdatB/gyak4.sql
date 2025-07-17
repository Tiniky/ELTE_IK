select * from dual;

--A NIKOVITS felhasználó CIKK táblájának adatai melyik blokkokban helyezkednek el, és hány sor van az egyes blokkokban? (file_id, blokk_id, darab)
-- 616-623
select fajl, blokk, count(sor) from
(SELECT dbms_rowid.rowid_object(ROWID) adatobj, 
        dbms_rowid.rowid_relative_fno(ROWID) fajl,
        dbms_rowid.rowid_block_number(ROWID) blokk,
        dbms_rowid.rowid_row_number(ROWID) sor
 FROM nikovits.cikk)
 group by fajl, blokk;
 
--T(R) - sorok száma
--bf(R) - hány sor fér el egy blokkban
--B(R) - szükséges blokkok száma

--(F1) I1 sûrû, I2 ritka, T(R) 10 000, bf(R) = 20, bf(I1) = 100, bf(I2) = 100
-- B(R) = 10000 / 20 = 500
-- B(I1) = 10000 / 100 = 100
-- B(I2) = 500 / 100 = 5

--(F2) csak 80%ban lehet tele
-- B(R) = 10000 / 16 = 625
-- B(I1) = 10000 / 80 = 125 
-- B(I2) = 625 / 80 = 7.81 aka 8

--(F3) T(R) 1 000 000, bf(R) 20, bf(I) 50
-- a) rendezetlenül: 1000000 / 20 = 50000
-- b) rendezett de nem használunk indexet: log2 50000
-- c) B+ fa indexxel:
-- 1000000 / 50 = 20000
-- 20000 / 50 = 400
-- 400 / 50 = 8
-- 8 / 50 -> 1
-- B(I) = 20000 + 400 + 8 + 1
-- => 5