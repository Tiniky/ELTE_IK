create table PLAN_TABLE (
        statement_id       varchar2(30),
        plan_id            number,
        timestamp          date,
        remarks            varchar2(4000),
        operation          varchar2(30),
        options            varchar2(255),
        object_node        varchar2(128),
        object_owner       varchar2(30),
        object_name        varchar2(30),
        object_alias       varchar2(65),
        object_instance    numeric,
        object_type        varchar2(30),
        optimizer          varchar2(255),
        search_columns     number,
        id                 numeric,
        parent_id          numeric,
        depth              numeric,
        position           numeric,
        cost               numeric,
        cardinality        numeric,
        bytes              numeric,
        other_tag          varchar2(255),
        partition_start    varchar2(255),
        partition_stop     varchar2(255),
        partition_id       numeric,
        other              long,
        distribution       varchar2(30),
        cpu_cost           numeric,
        io_cost            numeric,
        temp_space         numeric,
        access_predicates  varchar2(4000),
        filter_predicates  varchar2(4000),
        projection         varchar2(4000),
        time               numeric,
        qblock_name        varchar2(30),
        other_xml          clob
);

EXPLAIN PLAN FOR
SELECT sum(fizetes)
FROM VDANI.DOLGOZO
WHERE oazon='10';

EXPLAIN PLAN FOR
select foglalkozas from VDANI.DOLGOZO
group by foglalkozas;

select plan_table_output from table(dbms_xplan.display());

create index ii27 on fizetes(kategoria);

CREATE TABLE dolgozo AS SELECT * FROM vdani.dolgozo;
CREATE TABLE osztaly AS SELECT * FROM vdani.osztaly;
CREATE TABLE fizetes AS SELECT * FROM vdani.fiz_kategoria;

EXPLAIN PLAN FOR
select distinct onev
from (dolgozo d natural join osztaly o) cross join fizetes f
where d.fizetes > f.also and d.fizetes < f.felso and kategoria = 1;

select plan_table_output from table(dbms_xplan.display());

EXPLAIN PLAN FOR
SELECT sum(darab) FROM VDANI.hivas, VDANI.kozpont, VDANI.primer
WHERE hivas.kozp_azon_hivo=kozpont.kozp_azon AND kozpont.primer=primer.korzet
AND primer.varos = 'Szentendre' 
AND datum + 1 = next_day(to_date('2012.01.31', 'yyyy.mm.dd'),'hétfõ');

EXPLAIN PLAN FOR
SELECT sum(darab) FROM VDANI.hivas, VDANI.kozpont, VDANI.primer
WHERE hivas.kozp_azon_hivo=kozpont.kozp_azon AND kozpont.primer=primer.korzet
AND primer.varos = 'Szentendre' 
AND datum = next_day(to_date('2012.01.31', 'yyyy.mm.dd'),'hétfõ') - 1;

EXPLAIN PLAN FOR
select /*+ full(f) */ distinct onev
from (dolgozo d natural join osztaly o) cross join fizetes f
where d.fizetes > f.also and d.fizetes < f.felso and kategoria = 1;

select plan_table_output from table(dbms_xplan.display());

EXPLAIN PLAN FOR
select /*+ full(f) ordered use_nl(d o) use_nl(f) */ distinct onev
from (dolgozo d natural join osztaly o) cross join fizetes f
where d.fizetes > f.also and d.fizetes < f.felso and kategoria = 1;

select plan_table_output from table(dbms_xplan.display());

EXPLAIN PLAN FOR
select sum(suly)
from nikovits.cikk;

EXPLAIN PLAN FOR
select sum(suly)
from nikovits.cikk
where ckod = 10;
