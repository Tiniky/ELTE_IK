--Adjuk meg azokat a t�bl�kat, amelyeknek 26 k�l�nb�z? t�pus� oszlopuk van. Elv�rt kimenet: tulajdonos, t�blan�v.
select owner, table_name from dba_tab_columns
group by owner, table_name
having count(distinct data_type) = 26
intersect
select owner, object_name as table_name from dba_objects
where object_type='TABLE';

--H�ny olyan felhaszn�l� van az adatb�zisban, akinek van olyan t�bl�ja, amely t�bb adatf�jlban is helyet foglal?
select count(distinct owner) as felhasznalok from(
    select owner, segment_name from dba_extents
    where segment_type='TABLE'
    group by owner, segment_name
    having count(distinct file_id) > 1);

--H�ny extents van lefoglalva a VDANI felhaszn�l�nak a users02.dbf adatf�jlban? Elv�rt kimenet: extensek sz�ma
select count(distinct extent_id) as "Extensek szama" from dba_extents
where owner='VDANI' and file_id=(select file_id from dba_data_files where file_name like '%users02%');

--Adjuk meg azokat a klasztereket, amelyekhez t�bb, mint 10 t�bla tartozik. Elv�rt kimenet: klaszter n�v
select owner, cluster_name from dba_tables
where cluster_name is not null
group by owner, cluster_name
having count(distinct table_name)>10;
    
--�rjunk meg egy PL/SQL proced�r�t, amelyik ki�rja, hogy a NIKOVITS.HALLGATOK t�bl�nak melyek azok az adattblokkjai, amelyekben nincs egyetlen sor sem. Elv�rt kimenet: f�jl id, blokk id felsorolva
create or replace procedure ures is
    cursor c is
    select * from dba_extents
    where owner='NIKOVITS' and segment_name='HALLGATOK';
    darab integer;
begin
    for sor in c loop
        for i in 0..sor.blocks-1 loop
            select count(*)
            into darab
            from nikovits.hallgatok
            where dbms_rowid.rowid_relative_fno(ROWID) = sor.file_id
            and dbms_rowid.rowid_block_number(ROWID) = sor.block_id+i;
            
            if darab = 0 then
                dbms_output.put_line(sor.file_id || ', ' || to_char(sor.block_id + i) || ', ' || darab);
            end if;
        end loop;
    end loop;
end;
/

set serveroutput on;
execute ures()
