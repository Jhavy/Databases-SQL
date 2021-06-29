vista classifica da table classifica della procedura calcolo stagione

create view classifica_completa_attuale as
select p.numero,p.cognome as pilota,t.nome as team,clas.punti as punti
from classifica clas join  pilota p on clas.numero=p.numero
 join contratto_pilota_Attivo cp on p.numero=cp.id_pilota
join team t on cp.id_team=t.id;

create view classifica_completa_passata as
select p.numero,p.cognome as pilota,t.nome as team,clas.punti as punti
from classifica clas join  pilota p on clas.numero=p.numero
 join contratto_pilota_scaduto cp on p.numero=cp.id_pilota
join team t on cp.id_team=t.id;