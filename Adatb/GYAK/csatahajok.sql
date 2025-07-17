--
drop table Kimenetelek;
drop table Csatak;
drop table Hajok;
drop table Hajoosztalyok;

--
create table Hajoosztalyok
(
	osztaly varchar(15),
	tipus varchar(3),
	orszag varchar(20),
	agyukszama number,
	kaliber number,
	vizkiszoritas number
);
insert into Hajoosztalyok values ( 'Bismark','bb','Németorszag',8,15,42000) ;
insert into Hajoosztalyok values ( 'Iowa','bb','USA',9,16,46000);
insert into Hajoosztalyok values ( 'Kongo','bc','Japán',8,14,32000);
insert into Hajoosztalyok values ( 'North Carolina','bb','USA',9,16,37000);
insert into Hajoosztalyok values ( 'Renown','bc','Nagy Britannia',6,15,32000);
insert into Hajoosztalyok values ( 'Revenge','bb','Nagy Britannia',8,15,29000);
insert into Hajoosztalyok values ( 'Tennessee','bb','USA',12,14,32000);
insert into Hajoosztalyok values ( 'Yamato','bb','Japán',9,18,65000);

--
create table Hajok
(
	hajonev varchar(20),
	osztaly varchar(15),
	felavatva number
);
insert into Hajok values ( 'California','Tennessee',1921);
insert into Hajok values ( 'Haruna','Kongo',1915);
insert into Hajok values ( 'Hiei','Kongo',1914);
insert into Hajok values ( 'Iowa','Iowa',1943);
insert into Hajok values ( 'Kirishima','Kongo',1915);
insert into Hajok values ( 'Kongo','Kongo',1913);
insert into Hajok values ( 'Missuri','Iowa',1944);
insert into Hajok values ( 'Musashi','Yamato',1942);
insert into Hajok values ( 'New Jersey','Iowa',1943);
insert into Hajok values ( 'North Carolina','North Carolina',1941);
insert into Hajok values ( 'Ramillies','Revenge',1917);
insert into Hajok values ( 'Renown','Renown',1916);
insert into Hajok values ( 'Repulse','Renown',1916);
insert into Hajok values ( 'Resolution','Revenge',1916);
insert into Hajok values ( 'Revenge','Revenge',1916);
insert into Hajok values ( 'Royal Oak','Revenge',1916);
insert into Hajok values ( 'Royal Sovereign','Revenge',1916);
insert into Hajok values ( 'Tennesse','Tennesse',1920);
insert into Hajok values ( 'Washington','North Carolina',1941);
insert into Hajok values ( 'Wisconsin','Iowa',1944);
insert into Hajok values ( 'Yamato','Yamato',1941);

--
create table Csatak
(
	csatanev varchar(15),
	datum varchar(15)
);
insert into Csatak values ( 'Denmark Strait','5/24-27/41');
insert into Csatak values ( 'Guadalcanal','11/15/42');
insert into Csatak values ( 'North Cape','12/26/43');
insert into Csatak values ( 'Suriago Strait','10/25/44');

--
create table Kimenetelek
(
	hajonev varchar(20),
	csatanev varchar(15),
	eredmeny varchar(15)
);
insert into Kimenetelek values ( 'Arizona','Pearl Harbour','elsüllyedt');
insert into Kimenetelek values ( 'Bismark','Denmark Strait','elsüllyedt');
insert into Kimenetelek values ( 'California','Surigao Strait','ép');
insert into Kimenetelek values ( 'Duke of York','North Cape','ép');
insert into Kimenetelek values ( 'Fuso','Surigao Strait','elsüllyedt');
insert into Kimenetelek values ( 'Hood','Denmark Strait','elsüllyedt');
insert into Kimenetelek values ( 'King George V','Denmark Strait','ép');
insert into Kimenetelek values ( 'Kirishima','Guadalcanal','elsüllyedt');
insert into Kimenetelek values ( 'Prince of Wales','Denmark Strait','megsérült');
insert into Kimenetelek values ( 'Rodney','Denmark Strait','ép');
insert into Kimenetelek values ( 'Scharnhorst','North Cape','elsüllyedt');
insert into Kimenetelek values ( 'South of Dakota','Guadalcanal','megsérült');
insert into Kimenetelek values ( 'Tennessee','Surigao Strait','ép');
insert into Kimenetelek values ( 'Washington','Guadalcanal','ép');
insert into Kimenetelek values ( 'West Wirginia','Surigao Strait','ép');
insert into Kimenetelek values ( 'Yamashiro','Surigao Strait','elsüllyedt');

--
commit; 

--
select * from Hajoosztalyok;
select * from Hajok;
select * from Csatak;
select * from Kimenetelek;

--
grant select on Hajoosztalyok to public;
grant select on Hajok to public;
grant select on Csatak to public;
grant select on Kimenetelek to public;
--

--a) Adjuk meg azokat a hajóosztályokat a gyártó országok nevével együtt, amelyeknek az ágyúi legalább 16-os kaliberõek
select osztaly, orszag from hajoosztalyok
where kaliber>=16;

--b) Melyek azok a hajók, amelyeket 1921 el?tt avattak fel? 
select * from hajok
where felavatva<1921;

--c) Adjuk meg a Denmark Strait-csatában elsüllyedt hajók nevét.
select hajonev from kimenetelek
where csatanev='Denmark Strait' and eredmeny='elsüllyedt';

--d) Az 1921-es washingtoni egyezmény betiltotta a 35000 tonnánál súlyosabb hajókat. Adjuk meg azokat a hajókat, amelyek megszegték az egyezményt.
select H1.hajonev from hajok H1, hajoosztalyok HH1
where H1.felavatva>1921 and H1.osztaly=HH1.osztaly and HH1.vizkiszoritas>35000;

--e) Adjuk meg a Guadalcanal csatában részt vett hajók nevét, vízkiszorítását és ágyúinak a számát
select hajonev, vizkiszoritas, agyukSzama from kimenetelek natural join hajok, hajoosztalyok
where csatanev='Guadalcanal' and hajok.osztaly=hajoosztalyok.osztaly;

--f) Adjuk meg az adatbázisban szerepl? összes hadihajó nevét. (Ne feledjük, hogy a Hajók relációban nem feltétlenül szerepel az összes hajó!) 
select hajonev from hajok
union
select hajonev from kimenetelek
order by hajonev;

--g) Adjuk meg azokat az osztályokat, amelyekbe csak egyetlenegy hajó tartozik.
select osztaly from hajok
group by osztaly
having count(distinct hajonev)=1;

--h) Melyek azok az országok, amelyeknek csatahajóik is és cirkálóhajóik is voltak?
select orszag from hajoosztalyok
group by orszag
having count(distinct tipus)=2;

--i) Adjuk meg azokat a hajókat, amelyek „újjáéledtek”, azaz egyszer már megsérültek egy csatában, de egy kés?bbi csatában újra harcoltak. 
