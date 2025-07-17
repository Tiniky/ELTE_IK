drop table Nyomtato;
drop table Laptop;
drop table PC;
drop table Termek;

create table Termek(
	gyarto varchar(10),
	modell integer,
	tipus varchar(10)
	);

insert into Termek values ('A',1001,'pc');
insert into Termek values ('A',1002,'pc');
insert into Termek values ('A',1003,'pc');
insert into Termek values ('A',2004,'laptop');
insert into Termek values ('A',2005,'laptop');
insert into Termek values ('A',2006,'laptop');
insert into Termek values ('B',1004,'pc');
insert into Termek values ('B',1005,'pc');
insert into Termek values ('B',1006,'pc');
insert into Termek values ('B',2007,'laptop');
insert into Termek values ('C',1007,'pc');
insert into Termek values ('D',1008,'pc');
insert into Termek values ('D',1009,'pc');
insert into Termek values ('D',1010,'pc');
insert into Termek values ('D',3004,'nyomtató');
insert into Termek values ('D',3005,'nyomtató');
insert into Termek values ('E',1011,'pc');
insert into Termek values ('E',1012,'pc');
insert into Termek values ('E',1013,'pc');
insert into Termek values ('E',2001,'laptop');
insert into Termek values ('E',2002,'laptop');
insert into Termek values ('E',2003,'laptop');
insert into Termek values ('E',3001,'nyomtató');
insert into Termek values ('E',3002,'nyomtató');
insert into Termek values ('E',3003,'nyomtató');
insert into Termek values ('F',2008,'laptop');
insert into Termek values ('F',2009,'laptop');
insert into Termek values ('G',2010,'laptop');
insert into Termek values ('H',3006,'nyomtató');
insert into Termek values ('H',3007,'nyomtató');


create table PC(
	modell integer,
	sebesseg float,
	memoria integer,
	merevlemez integer,
	ar integer
	);

insert into PC values (1001,2.66,1024,250,2114);
insert into PC values (1002,2.10,512,250,995);
insert into PC values (1003,1.42,512,80,478);
insert into PC values (1004,2.80,1024,250,649);
insert into PC values (1005,3.20,512,250,630);
insert into PC values (1006,3.20,1024,320,1049);
insert into PC values (1007,2.20,1024,200,510);
insert into PC values (1008,2.20,2048,250,770);
insert into PC values (1009,2.00,1024,250,650);
insert into PC values (1010,2.80,2048,300,770);
insert into PC values (1011,1.86,2048,160,959);
insert into PC values (1012,2.80,1024,160,649);
insert into PC values (1013,3.06,512,80,529);


create table Laptop(
	modell integer,
	sebesseg float,
	memoria integer,
	merevlemez integer,
	kepernyo float,
	ar integer
	);

insert into Laptop values (2001,2.00,2048,240,20.1,3673);
insert into Laptop values (2002,1.73,1024,80,17.0,949);
insert into Laptop values (2003,1.80,512,60,15.4,549);
insert into Laptop values (2004,2.00,512,60,13.3,1150);
insert into Laptop values (2005,2.16,1024,120,17.0,2500);
insert into Laptop values (2006,2.00,2048,80,15.4,1700);
insert into Laptop values (2007,1.83,1024,120,13.3,1429);
insert into Laptop values (2008,1.60,1024,100,15.4,900);
insert into Laptop values (2009,1.60,512,80,14.1,680);
insert into Laptop values (2010,2.00,2048,160,15.4,2300);


create table Nyomtato(
	modell integer,
	szines varchar(5),
	tipus varchar(15),
	ar integer);

insert into Nyomtato values (3001,'igen','tintasugaras',3673);
insert into Nyomtato values (3002,'nem','lézer',949);
insert into Nyomtato values (3003,'igen','lézer',549);
insert into Nyomtato values (3004,'igen','tintasugaras',1150);
insert into Nyomtato values (3005,'nem','lézer',2500);
insert into Nyomtato values (3006,'igen','tintasugaras',1700);
insert into Nyomtato values (3007,'igen','lézer',1429);

commit; 

select * from Termek;
select * from PC;
select * from Laptop;
select * from Nyomtato;

-- Adjunk a táblákhoz jogokat, hogy mások is lekérdezhessék (select)
-- grant select on Termek to public;
-- grant select on PC to public;
-- grant select on Laptop to public;
-- grant select on Nyomtato to public; 

--a)Melyek azok a PC modellek, amelyek sebessége legalább 3.00?
select * from PC
where sebesseg>3.00;

--b)Mely gyártók készítenek legalább száz gigabájt méretõ merevlemezzel rendelkezõ laptopot?
select * from laptop
where merevlemez >= 100;

--c)Adjuk meg a B gyártó által gyártott összes termék modellszámát és árát, típustól függetlenül
select termek.modell, pc.ar from termek, pc
where termek.gyarto='B' and (termek.modell=pc.modell or termek.modell=pc.modell)
UNION
select termek.modell, laptop.ar from termek, laptop
where termek.gyarto='B' and (termek.modell=laptop.modell or termek.modell=laptop.modell)
UNION
select termek.modell, nyomtato.ar from termek, nyomtato
where termek.gyarto='B' and (termek.modell=nyomtato.modell or termek.modell=nyomtato.modell)
;

--d)Adjuk meg valamennyi színes lézernyomtató modellszámát.
select modell from nyomtato
where szines='igen' and tipus='lezer';

--e)Melyek azok a gyártók, akik laptopot árulnak, PC-t viszont nem?
select gyarto from termek
where tipus='laptop'
minus
select gyarto from termek
where tipus='pc';

--f)Melyek azok a merevlemezméretek, amelyek legalább két PC-ben megtalálhatók?
select DISTINCT pc1.merevlemez from pc pc1, pc pc2
where pc1.merevlemez=pc2.merevlemez and pc1.modell<>pc2.modell;

--g)Adjuk meg azokat a PC modell párokat, amelyek ugyanolyan gyorsak és a memóriájuk is ugyanakkora. Egy pár csak egyszer jelenjen meg, azaz ha már szerepel az (i, j), akkor a (j, i) ne jelenjen meg.
select pc1.modell, pc2.modell from pc pc1, pc pc2
where pc1.sebesseg=pc2.sebesseg and pc1.memoria=pc2.memoria and pc1.modell<pc2.modell;

--h)Melyek azok a gyártók, amelyek gyártanak legalább két, egymástól különböz?, legalább 2.80 gigahertzen mõköd? számítógépet (PC-t vagy laptopot)?
select gyarto from Termek
where modell in (select modell from pc
                where sebesseg >= 2.8
                union
                select modell from laptop
                where sebesseg >= 2.8)
group by gyarto
having count(*)>=2;

--i)Melyik gyártó gyártja a leggyorsabb számítógépet (PC-t vagy laptopot)?
select distinct gyarto from Termek
where modell in (select modell from pc
                where sebesseg=(select max(sebesseg) from pc));

--j) Melyik gyártó gyárt legalább három, különböz? sebességõ PC-t?
select distinct T1.gyarto, COUNT(DISTINCT P1.sebesseg) as DB from Termek T1
left join Pc P1 on p1.modell=T1.modell
group by gyarto
having COUNT(DISTINCT P1.sebesseg) >= 3
order by gyarto;

--k) Melyek azok a gyártók, akik pontosan három típusú PC-t forgalmaznak?
select T1.gyarto, COUNT(DISTINCT T1.modell) from Termek T1
where T1.tipus = 'pc'
group by gyarto
having count(DISTINCT T1.modell)=3
order by gyarto;
