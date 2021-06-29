insert into marca values
(1,"KTM"),
(2,"YAMAHA"),
(3,"HONDA"),
(4,"DUCATI"),
(5,"APRILIA"),
(6,"SUZUKI");

-----------------------------------------------------------------------------

insert into team values
(1,"REPSOL HONDA TEAM",null),
(2,"MONSTER YAMAHA TEAM",null),
(3,"DUCATI RACING TEAM",null),
(4,"KTM FACTORY TEAM",null),
(5,"SUZUKI ECSTAR TEAM",null),
(6,"APRILIA RACING TEAM",null),
(7,"LCR HONDA",null),
(8,"PETRONAS YAMAHA SRT",null),
(9,"PRAMAC RACING",null),
(10,"KTM TECH3 RACING",null),
(11,"AVINTIA RACING",null);

-----------------------------------------------------------------------------
DIRETTORE
insert into direttore values
(1,"Ezio","Pisano","1960-02-04",null),
(2,"Baddy","Smith","1990-09-24",null),
(3,"Alejandro","Gomez","1960-02-04",null),
(4,"Luigi","Pardo","1964-06-04",null),
(5,"Marin","Bastos","1940-01-05",null),
(6,"Marlen","Diro","1980-09-08",null),
(7,"Peter","Fadder","1972-12-12",null),
(8,"Enry","Lock","1961-09-07",null),
(9,"Roberto","Baggio","1989-11-12",null),
(10,"Manuele","Locatelli","1960-02-04",null),
(11,"Eddy","Pedersoli","1955-11-04",null);
----------------------------------------------------------------------------

CONTRATTI DIRETTORE_ATTIVO 1-1 CON TEAM
insert into contratto_direttore_attivo values
(1,11,2020,20000),
(2,10,2020,10000),
(3,9,2020,350000),
(4,8,2020,347000),
(5,7,2020,40000),
(6,6,2020,78000),
(7,5,2020,800000),
(8,4,2020,155000),
(9,3,2020,85000),
(10,2,2020,35000),
(11,1,2020,705000);
-----------------------------------------------------------------------------
PILOTA 

insert into pilota values
(8,"Valerio","Lupi","1999-01-25",null,null,0,0),
(20,"Fabio","Quartararo","1999-10-21",null,null,0,0),
(21,"Franco","Morbidelli","1995-11-10",null,null,0,0),
(36,"Joan","Mir","1996-05-02",null,null,0,0),
(42,"Alex","Rins","1985-10-14",null,null,0,0),
(88,"Miguel","Oliveira","1996-01-04",null,null,0,0),
(27,"Iker","Lecuona","1989-10-28",null,null,0,0),
(44,"Pol","Espargaro","1989-06-09",null,null,0,0),
(33,"Brad","Binder","1997-09-16",null,null,0,0),
(93,"Marc","Marquez","1993-08-01",null,null,0,0),
(73,"Alex","Marquez","1995-10-21",null,null,0,0),
(9,"Danilo","Petrucci","1988-05-10",null,null,0,0),
(4,"Andrea","Dovizioso","1985-03-04",null,null,0,0),
(29,"Andrea","Iannone","1987-12-8",null,null,0,0),
(41,"Aleix","Espargaro","1984-07-15",null,null,0,0),
(63,"Francesco","Bagnaia","1997-05-29",null,null,0,0),
(43,"Jack","Miller","1991-12-04",null,null,0,0),
(35,"Cal","Crutchlow","1988-02-26",null,null,0,0),
(30,"Taka","Nakagami","1995-01-30",null,null,0,0),
(53,"Tito","Rabat","1989-04-23",null,null,0,0),
(5,"Johann","Zarco","1986-09-07",null,null,0,0),
(46,"Valentino","Rossi","1979-02-16",null,null,0,0),
(25,"Maverik","Vinales","1994-04-06",null,null,0,0),
(99,"Jorge","Lorenzo","1982-03-04",null,null,0,0),
(26,"Daniel","Pedrosa","1983-01-21",null,null,0,0);

------------------------------------------------------------------------------------------------
CONTRATTI PILOTI ATTIVI
-- business rule poi su contratto attivo guida e collaudatore
-- test trigger contratto pilota
insert into contratto_pilota_attivo values
(8,4,2020,12000,"Collaudatore"),
(20,8,2020,1000000,"Prima Guida"),
(21,8,2020,800000,"Seconda Guida"),
(36,5,2020,4000000,"Prima Guida"),
(42,5,2020,700000,"Seconda Guida"),
(88,10,2020,1000000,"Prima Guida"),
(27,10,2020,400000,"Seconda Guida"),
(44,4,2020,900000,"Prima Guida"),
(33,4,2020,800000,"Seconda Guida"),
(93,1,2020,11000000,"Prima Guida"),
(73,1,2020,800000,"Seconda Guida"),
(9,3,2020,4000000,"Prima Guida"),
(4,3,2020,1000000,"Seconda Guida"),
(29,6,2020,2000000,"Prima Guida"),
(41,6,2020,500000,"Seconda Guida"),
(63,9,2020,1000000,"Prima Guida"),
(43,9,2020,800000,"Seconda Guida"),
(35,7,2020,700000,"Prima Guida"),
(30,7,2020,300000,"Seconda Guida"),
(53,11,2020,200000,"Prima Guida"),
(5,11,2020,100000,"Seconda Guida"),
(46,2,2020,9400000,"Prima Guida"),
(25,2,2020,600000,"Seconda Guida"),
(99,2,2020,20000,"Collaudatore"),
(26,8,2020,50000,"Collaudatore");

CONTRATTI PILOTI SCADUTI
-- business rule poi su contratto attivo guida e collaudatore
-- test trigger contratto pilota
insert into contratto_pilota_scaduto values
(8,4,2019,2019,12000,"Collaudatore"),
(20,8,2019,2019,1000000,"Prima Guida"),
(21,8,2019,2019,800000,"Seconda Guida"),
(36,5,2019,2019,4000000,"Prima Guida"),
(42,5,2019,2019,700000,"Seconda Guida");

------------------------------------------------------------------------------------------------------
TECNICO
insert into tecnico values
(1,"Angelo","Manfredini","1989-09-22","I",null),
(2,"Giuseppe","Sabato","1991-01-30","M",null),
(3,"Ayr","Dominguez","1989-07-07","M",null),
(4,"Octo","Pramer","1980-11-07","I",null),
(5,"Mario","Padella","1974-10-15","I",null),
(6,"Leonard","Bape","1976-02-01","I",null);

contratti tecnici attivi
insert into contratto_Tecnico_attivo values
(6,3,2020,15000),
(2,4,2020,15000),
(3,2,2020,15000),
(5,7,2020,15000),
(4,1,2020,15000),
(1,1,2020,15000);

----------------------------------------------------------------------------------------------------------
CONTRATTI TEAM ATTIVI

insert into contratto_team_attivo values
(1,3,1997),
(2,2,1995),
(3,4,2000),
(4,1,2018),
(5,6,2012),
(6,5,2018),
(7,3,2020),
(8,2,2020),
(9,4,2015),
(10,1,2018),
(11,4,2019);

---------------------------------------------------------------------------------------------------------
MOTO

insert into moto values
(1,1,2019,1100,320), -- 1 ktm
(2,1,2020,1200,328),
(3,2,2019,1000,310), -- 2 yamaha
(4,2,2020,1100,315),
(5,3,2019,1000,310), -- 3 honda
(6,3,2020,1200,325),
(7,4,2019,1200,340), -- 4 ducati
(8,5,2019,1000,307), -- 5 aprilia
(9,6,2019,1058,317); -- 6 suzuki

MOTO_REALE
insert into moto_reale values
-- (id,id_team,id_moto,stagione)
(1,1,5,2019),
(2,1,6,2020),
(3,2,2,2019),
(4,2,3,2020),
(5,3,7,2019),
(6,3,7,2020),
(7,4,1,2019),
(8,4,2,2020),
(9,5,9,2019),
(10,5,9,2020),
(11,6,8,2019),
(12,6,8,2020),
(13,7,5,2020),
(14,8,3,2020),
(15,9,7,2020),
(16,10,1,2020),
(17,11,7,2020);

-- TEST TRIGGER MAX 4 MOTO A STAG PER TEAM
insert into moto_reale values
(1,1,5,2020),
(2,1,6,2020),
(3,1,5,2020),
(4,1,6,2020);
insert into moto_reale values
(5,1,5,2020);