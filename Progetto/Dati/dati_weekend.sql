-- CIRCUITI
insert into circuito values
(1,"Mugello",4722),
(2,"Imola",3800),
(3,"Jerez",4150);

-- GRAN PREMI
insert into gran_premio values
(1,"Gran Premio d'Italia"),
(2,"Gran Premio del Mugello"),
(3,"Andalucia Grand Prix"),
(4,"Gran Premio di Imola");

-- STAGIONI
insert into stagione values
(2019,0,null,null),
(2020,0,null,null);

-- GARE EFFETTIVE
insert into weekend_reale values
(1,1,1,2020,null),
(2,2,1,2020,null),
(3,3,3,2020,null),
(4,4,2,2020,null);

insert into weekend_reale values
(5,1,1,2019,null),
(6,3,3,2019,null),
(7,4,2,2019,null);

--ARRIVI
insert into arrivi values
-- (id_gp_reale,posizione,pilota,team)
(1,1,46,2),
(1,2,93,1),
(1,3,25,2),
(1,4,4,3),
(1,5,5,11),
(1,6,33,4),
(1,7,44,4);

insert into arrivi values
-- (id_gp_reale,posizione,pilota,team)
(2,2,46,2),
(2,1,93,1),
(2,3,25,2),
(2,4,4,3),
(2,5,5,11),
(2,6,33,4),
(2,7,44,4),
(3,1,46,2),
(3,2,93,1),
(3,3,25,2),
(3,4,4,3),
(3,5,5,11),
(3,6,33,4),
(3,7,44,4),
(4,1,46,2),
(4,2,93,1),
(4,3,25,2),
(4,4,4,3),
(4,5,5,11),
(4,6,33,4),
(4,7,44,4);
---------------------
insert into arrivi values
-- (id_gp_reale,posizione,pilota,team)
(5,1,8,4),
(5,2,20,8),
(5,3,21,8),
(5,4,36,5),
(5,5,42,5),

(6,1,8,4),
(6,2,20,8),
(6,3,21,8),
(6,4,36,5),
(6,5,42,5),

(7,1,8,4),
(7,2,20,8),
(7,3,21,8),
(7,4,36,5),
(7,5,42,5);



