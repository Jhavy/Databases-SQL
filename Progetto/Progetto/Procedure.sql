-- DATO IN INPUT UN ANNO, CREA UNA TABELLA CLASSIFICA ED AGGIORNA LA TABELLA STAGIONE CON RELATIVI
-- PILOTA E TEAM VINCITORI
1)

delimiter //
create procedure calcoloStagione(in anno integer)
begin
declare vincitore integer;
declare nome_vincitore varchar(20);
declare nome_team varchar(20);
declare stag integer;
set @stag=anno;
drop table if exists classifica;
create table classifica(
numero integer,
punti integer);
drop table if exists classifica2;
create temporary  table classifica2(
numero integer,
punti integer);

-- tutti i piloti che hanno corso nelle gare di quella stagione
drop table if exists calcolo1;
create temporary  table calcolo1(
numero integer,
posizione integer);
insert into calcolo1 
select a.id_pilota,a.posizione from weekend_reale w join arrivi a on w.id=a.id_weekend_reale where w.stagione=anno;



-- calcolo punteggi
drop table if exists primi;
create temporary table primi(
numero integer,
vittorie integer);
insert into primi 
select numero,count(posizione) from calcolo1 where posizione=1 group by numero;
update primi
set vittorie=vittorie*10;
drop table if exists secondi;
create temporary table secondi(
numero integer,
secondi integer);
insert into secondi
select numero,count(posizione) from calcolo1 where posizione=2 group by numero;
update secondi
set secondi=secondi*7;
drop table if exists terzi;
create temporary table terzi(
numero integer,
terzi integer);
insert into terzi
select numero,count(posizione) from calcolo1 where posizione=3 group by numero;
update terzi
set terzi=terzi*5;

-- riempio la classifica con i piloti che hanno corso quella stagione
insert into classifica2
select distinct numero,0 from calcolo1;
insert into classifica2
select numero,sum(vittorie) from primi group by numero;
insert into classifica2
select numero,sum(secondi) from secondi group by numero;
insert into classifica2
select numero,sum(terzi) from terzi group by numero;

insert into classifica
select numero,sum(punti) as punti from classifica2 group by numero order by punti DESC;


-- aggiorno tabella stagione
set @vincitore= (select numero from classifica where punti=(select max(punti) from classifica));
set @nome_vincitore= (select cognome from pilota where numero=@vincitore);

update stagione
set pilota_campione=@nome_vincitore
where stagione.anno=@stag;

-- aggiorno tabella albo_team
set @nome_team='aa';
if(@stag=2020) then
set @nome_team=(select nome from team where id = (select id_team from contratto_pilota_Attivo
where id_pilota=
(select numero from classifica where punti=(select max(punti) from classifica))));
else

set @nome_team=(select nome from team where id = (select id_team from contratto_pilota_scaduto
where id_pilota=
(select numero from classifica where punti=(select max(punti) from classifica)) and anno_inizio<=@stag and anno_fine>=@stag));
end if;

if exists(select anno from albo_Team where albo_team.anno=@stag) then
update albo_team
set team=@nome_team
where albo_team.anno=@stag;

else
insert into albo_team values
(@stag,@nome_Team);
end if;
end//
delimiter ;

-- 2) PILOTI CHE HANNO UN CONTRATTO ATTIVO ED UNO PASSATO DEL 2019

delimiter //
create procedure pilota_contratti()
begin
create temporary table pilota_cont(
nome varchar(20),
cognome varchar(20));

insert into pilota_cont
select p.nome,p.cognome from pilota p join contratto_pilota_Attivo ca on p.numero=ca.id_pilota
where p.numero in(select id_pilota from contratto_pilota_scaduto);


end//
delimiter ;

-- 3) STIPENDI CONTRATTI ATTIVI PAGATI DA OGNI TEAM
delimiter //
create procedure contratti_team()
begin
create temporary table contr_team(
stipendi integer,
team varchar(20));

insert into contr_team
select sum(stipendio),t.nome from contratto_pilota_Attivo ca join team t on ca.id_Team=t.id group by id_team;

end//
delimiter ;

