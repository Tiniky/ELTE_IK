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
insert into Hajoosztalyok values ( 'Bismark','bb','N�metorszag',8,15,42000) ;
insert into Hajoosztalyok values ( 'Iowa','bb','USA',9,16,46000);
insert into Hajoosztalyok values ( 'Kongo','bc','Jap�n',8,14,32000);
insert into Hajoosztalyok values ( 'North Carolina','bb','USA',9,16,37000);
insert into Hajoosztalyok values ( 'Renown','bc','Nagy Britannia',6,15,32000);
insert into Hajoosztalyok values ( 'Revenge','bb','Nagy Britannia',8,15,29000);
insert into Hajoosztalyok values ( 'Tennessee','bb','USA',12,14,32000);
insert into Hajoosztalyok values ( 'Yamato','bb','Jap�n',9,18,65000);

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
insert into Kimenetelek values ( 'Arizona','Pearl Harbour','els�llyedt');
insert into Kimenetelek values ( 'Bismark','Denmark Strait','els�llyedt');
insert into Kimenetelek values ( 'California','Surigao Strait','�p');
insert into Kimenetelek values ( 'Duke of York','North Cape','�p');
insert into Kimenetelek values ( 'Fuso','Surigao Strait','els�llyedt');
insert into Kimenetelek values ( 'Hood','Denmark Strait','els�llyedt');
insert into Kimenetelek values ( 'King George V','Denmark Strait','�p');
insert into Kimenetelek values ( 'Kirishima','Guadalcanal','els�llyedt');
insert into Kimenetelek values ( 'Prince of Wales','Denmark Strait','megs�r�lt');
insert into Kimenetelek values ( 'Rodney','Denmark Strait','�p');
insert into Kimenetelek values ( 'Scharnhorst','North Cape','els�llyedt');
insert into Kimenetelek values ( 'South of Dakota','Guadalcanal','megs�r�lt');
insert into Kimenetelek values ( 'Tennessee','Surigao Strait','�p');
insert into Kimenetelek values ( 'Washington','Guadalcanal','�p');
insert into Kimenetelek values ( 'West Wirginia','Surigao Strait','�p');
insert into Kimenetelek values ( 'Yamashiro','Surigao Strait','els�llyedt');

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

--a) Adjuk meg azokat a haj�oszt�lyokat a gy�rt� orsz�gok nev�vel egy�tt, amelyeknek az �gy�i legal�bb 16-os kaliber�ek
select osztaly, orszag from hajoosztalyok
where kaliber>=16;

--b) Melyek azok a haj�k, amelyeket 1921 el?tt avattak fel? 
select * from hajok
where felavatva<1921;

--c) Adjuk meg a Denmark Strait-csat�ban els�llyedt haj�k nev�t.
select hajonev from kimenetelek
where csatanev='Denmark Strait' and eredmeny='els�llyedt';

--d) Az 1921-es washingtoni egyezm�ny betiltotta a 35000 tonn�n�l s�lyosabb haj�kat. Adjuk meg azokat a haj�kat, amelyek megszegt�k az egyezm�nyt.
select H1.hajonev from hajok H1, hajoosztalyok HH1
where H1.felavatva>1921 and H1.osztaly=HH1.osztaly and HH1.vizkiszoritas>35000;

--e) Adjuk meg a Guadalcanal csat�ban r�szt vett haj�k nev�t, v�zkiszor�t�s�t �s �gy�inak a sz�m�t
select hajonev, vizkiszoritas, agyukSzama from kimenetelek natural join hajok, hajoosztalyok
where csatanev='Guadalcanal' and hajok.osztaly=hajoosztalyok.osztaly;

--f) Adjuk meg az adatb�zisban szerepl? �sszes hadihaj� nev�t. (Ne feledj�k, hogy a Haj�k rel�ci�ban nem felt�tlen�l szerepel az �sszes haj�!) 
select hajonev from hajok
union
select hajonev from kimenetelek
order by hajonev;

--g) Adjuk meg azokat az oszt�lyokat, amelyekbe csak egyetlenegy haj� tartozik.
select osztaly from hajok
group by osztaly
having count(distinct hajonev)=1;

--h) Melyek azok az orsz�gok, amelyeknek csatahaj�ik is �s cirk�l�haj�ik is voltak?
select orszag from hajoosztalyok
group by orszag
having count(distinct tipus)=2;

--i) Adjuk meg azokat a haj�kat, amelyek ��jj��ledtek�, azaz egyszer m�r megs�r�ltek egy csat�ban, de egy k�s?bbi csat�ban �jra harcoltak. 
