TRIGGER
-- 1) Trigger massimo 11 team.
delimiter //
create trigger max_team
before insert on team
for each row
begin
if
(select count(*) from team)=11
then 
signal sqlstate'45000' set message_text="MASSIMO NUMERO TEAM RAGGIUNTI";
end if;
end//
delimiter ;
-----------------------------------------------------------------------------------
-- 2) Trigger che aggiorna la colonna marca nella tabella team dopo aver
-- inserito un contratto attivo del team.

delimiter //
create trigger update_team
after insert on contratto_team_attivo
for each row
begin
declare nome_marca varchar(20);
(select nome from marca where id=new.id_marca) into nome_marca;

update team
set marca=nome_marca
where id=new.id_team;

end//
delimiter ;
-----------------------------------------------------------------------------

-- 3)TRIGGER CHE AGGIORNA COLONNA TEAM SU DIRETTORE

delimiter //
create trigger update_direttore
after insert on contratto_direttore_attivo
for each row
begin
declare nome_team varchar(20);
(select nome from team where id=new.id_team) into nome_team;

update direttore
set team=nome_team
where id=new.id_direttore;

end//
delimiter ;
-------------------------------------------------------------------------------------------------------

-- 4)TRIGGER CHE AGGIORNA COLONNA TEAM SU TECNICO
-- MAX 2 TECNICI PER TEAM

delimiter //
create trigger update_tecnico 
before insert on contratto_tecnico_attivo
for each row
begin
declare nome_team varchar(20);
if((select count(*) from contratto_tecnico_attivo c join tecnico t on c.id_tecnico=t.id
 where c.id_team=new.id_team AND t.ruolo="I")=2)

 then
signal sqlstate'45000' set message_text="Già sono presenti 2 ingegneri di pista per quel team";
else

(select nome from team where id=new.id_team) into nome_team;

update tecnico
set team=nome_team
where id=new.id_tecnico;
end if;

end//
delimiter ;

------------------------------------------------------------------------------------------------------
-- 5)TRIGGER CHE AGGIORNA COLONNE TEAM,RUOLO SU PILOTA + BUSINESS RULE
-- Gerarchia stipendio Prima Guida > Seconda Guida > Collaudatore

delimiter //
create trigger update_pilota1
before insert on contratto_pilota_attivo
for each row
begin
declare nome_team varchar(20);
declare stip2 float;
declare stip float;

if((select count(*) from contratto_pilota_attivo where id_team=new.id_team)=3)
then  signal sqlstate'45000' set message_text="Il team ha già 3 piloti";
else
if((select ruolo from contratto_pilota_Attivo where id_team=new.id_team)=new.ruolo)
then
signal sqlstate'45000' set message_text="Già è presente un pilota con quel ruolo nel team!";
end if;
case new.ruolo
	when "Prima Guida" then
		if exists(select * from contratto_pilota_Attivo
		where id_team=new.id_team and ruolo="Seconda Guida")
			then 
			(select stipendio from contratto_pilota_Attivo
				where id_team=new.id_team and ruolo="Seconda Guida")
				into stip;
		else
			if exists(select * from contratto_pilota_Attivo
			where id_team=new.id_team and ruolo="Collaudatore")
			then 
				(select stipendio from contratto_pilota_Attivo
				where id_team=new.id_team and ruolo="Collaudatore")
				into stip;
			else set @stip=1;
			end if;
			
		end if;
		
		
		if(new.stipendio>@stip) then
			(select nome from team where id=new.id_team) into nome_team;
			update pilota
			set ruolo=new.ruolo, team=nome_team
			where numero=new.id_pilota;
		else
		signal sqlstate'45000' set message_text="Stipendio troppo basso";
		 end if;
		
		
		
	when "Seconda Guida" then
		if exists(select * from contratto_pilota_Attivo
		where id_team=new.id_team and ruolo="Prima Guida")
			then 
			(select stipendio from contratto_pilota_Attivo
				where id_team=new.id_team and ruolo="Prima Guida")
				into stip;
		else set @stip=99999999;
		end if;
		
		if exists(select * from contratto_pilota_Attivo
		where id_team=new.id_team and ruolo="Collaudatore")
			then 
			(select stipendio from contratto_pilota_Attivo
				where id_team=new.id_team and ruolo="Collaudatore")
				into stip2;
		else set @stip2=1;
		end if;
		
		if (new.stipendio<stip2) then
		signal sqlstate'45000' set message_text="Stipendio minore del collaudatore";
		else
			if(new.stipendio>stip)
			then
			signal sqlstate'45000' set message_text="Stipendio maggiore della prima guida";
			else
				(select nome from team where id=new.id_team) into nome_team;
				update pilota
				set ruolo=new.ruolo, team=nome_team
				where numero=new.id_pilota;
			end if;
		end if;
		
		
		when "Collaudatore" then
			if exists(select * from contratto_pilota_Attivo
				where id_team=new.id_team and ruolo="Seconda Guida")
				then 
					(select stipendio from contratto_pilota_Attivo
					where id_team=new.id_team and ruolo="Seconda Guida")
					into stip;
			else
				if exists(select * from contratto_pilota_Attivo
				where id_team=new.id_team and ruolo="Prima Guida")
				then 
					(select stipendio from contratto_pilota_Attivo
					where id_team=new.id_team and ruolo="Prima Guida")
					into stip;
					else set @stip=0;
				end if;
			end if;
		
			
			if(new.stipendio>stip) then
			signal sqlstate'45000' set message_text="Stipendio maggiore degli altri piloti";
			else
			(select nome from team where id=new.id_team) into nome_team;
				update pilota
				set ruolo=new.ruolo, team=nome_team
				where numero=new.id_pilota;
			end if;
end case;
end if;
end//
delimiter ;
---------------------------------------------------------------------------------------------------------
-- 6)Trigger max 4 moto reali per team a stagione

delimiter //
create trigger check_moto
before insert on moto_reale
for each row
begin

if((select count(*) from moto_reale where id_team=new.id_team and stagione=new.stagione)=4)
then
signal sqlstate'45000' set message_text="Il team ha già 4 moto per quella stagione!";
end if;

end//
delimiter ;
---------------------------------------------------------------------------------------------------------
-- 7)update numero gp su tabella stagione (after insert on weekend_reale)
delimiter //
create trigger update_stagione1
after insert on weekend_reale
for each row
begin

update stagione
set gp=gp+1
where anno=new.stagione;

end//
delimiter ;
---------------------------------------------------------------------------------------------------------
-- 8)update PILOTA-> gp e vittorie after insert on arrivi
delimiter //
create trigger update1
after insert on arrivi
for each row
begin

if(new.posizione=1) then
update pilota
set vittorie=vittorie+1
where numero=new.id_pilota;
update weekend_reale
set pilota_vincitore= (select cognome from pilota where numero=new.id_pilota)
where id=new.id_weekend_reale;
end if;

update pilota
set gp=gp+1
where numero=new.id_pilota;



end//
delimiter ;
