create table pilota(
numero integer primary key,
nome varchar(20),
cognome varchar(20),
data_nascita date,
team varchar(20),
ruolo varchar(20),
gp integer,
vittorie integer
)engine'InnoDB';

create table direttore(
id integer primary key,
nome varchar(20),
cognome varchar(20),
data_nascita date,
team varchar(20)
)engine'InnoDB';

create table tecnico(
id integer primary key,
nome varchar(20),
cognome varchar(20),
data_nascita date,
ruolo varchar(1),
team varchar(20)
)engine'InnoDB';

create table team(
id integer primary key,
nome varchar(20),
marca varchar(20)
)engine'InnoDB';

create table marca (
id integer primary key,
nome varchar(20)
)engine'InnoDB';

create table contratto_pilota_attivo (
id_pilota integer,
id_team integer,
anno_inizio integer,
stipendio float,
ruolo varchar(20),
foreign key(id_pilota) references pilota(numero),
foreign key(id_team) references team(id),
index idx_pilota(id_pilota),
index idx_team(id_team),
primary key(id_pilota)
)engine'InnoDB';

create table contratto_direttore_attivo (
id_direttore integer,
id_team integer,
anno_inizio integer,
stipendio float,
foreign key(id_direttore) references direttore(id),
foreign key(id_team) references team(id),
index idx_direttore(id_direttore),
index idx_team(id_team),
primary key(id_direttore,id_team),
unique(id_direttore),
unique(id_team)
)engine'InnoDB';

create table contratto_tecnico_attivo (
id_tecnico integer,
id_team integer,
anno_inizio integer,
stipendio float,
foreign key(id_tecnico) references tecnico(id),
foreign key(id_team) references team(id),
index idx_tecnico(id_tecnico),
index idx_team(id_team),
primary key(id_tecnico)
)engine'InnoDB';

create table contratto_pilota_scaduto (
id_pilota integer,
id_team integer,
anno_inizio integer,
anno_fine integer,
stipendio float,
ruolo varchar(20),
foreign key(id_pilota) references pilota(numero),
foreign key(id_team) references team(id),
index idx_pilota(id_pilota),
index idx_team(id_team),
primary key(id_pilota,anno_inizio)
)engine'InnoDB';

create table contratto_direttore_scaduto (
id_direttore integer,
id_team integer,
anno_inizio integer,
anno_fine integer,
stipendio float,
foreign key(id_direttore) references direttore(id),
foreign key(id_team) references team(id),
index idx_direttore(id_direttore),
index idx_team(id_team),
primary key(id_direttore,id_team,anno_inizio)
)engine'InnoDB';

create table contratto_tecnico_scaduto (
id_tecnico integer,
id_team integer,
anno_inizio integer,
anno_fine integer,
stipendio float,
foreign key(id_tecnico) references tecnico(id),
foreign key(id_team) references team(id),
index idx_tecnico(id_tecnico),
index idx_team(id_team),
primary key(id_tecnico,anno_inizio)
)engine'InnoDB';

create table contratto_team_attivo (
id_team integer,
id_marca integer,
anno_inizio integer,
foreign key(id_marca) references marca(id),
foreign key(id_team) references team(id),
index idx_marca(id_marca),
index idx_team(id_team),
primary key(id_team)
)engine'InnoDB';

create table contratto_team_scaduto(
id_team integer,
id_marca integer,
anno_inizio integer,
anno_fine integer,
foreign key(id_marca) references marca(id),
foreign key(id_team) references team(id),
index idx_marca(id_marca),
index idx_team(id_team),
primary key(id_team,anno_inizio)
)engine'InnoDB';

create table moto(
id integer primary key,
marca integer,
anno_produzione integer,
cilindrata integer,
potenza_cv integer,
foreign key(marca)references marca(id)
)engine'InnoDB';

create table moto_reale (
id integer,
id_team integer,
id_moto integer,
stagione integer,
foreign key(id_team)references team(id),
foreign key(id_moto)references moto(id),
index idx_team(id_team),
index idx_moto(id_moto),
primary key(id,id_team,id_moto)
)engine'InnoDB';

create table gran_premio(
id integer primary key,
nome varchar(30),
unique(nome)
)engine'InnoDB';

create table circuito (
id integer primary key,
nome varchar(30),
lunghezza integer
)engine'InnoDB';

create table albo_team(
anno integer primary key,
team varchar(30)
)engine'InnoDB';

create table stagione (
anno integer primary key,
gp integer,
pilota_campione varchar(20),
)engine'InnoDB';

create table weekend_reale(
id integer,
id_gp integer,
id_circuito integer,
stagione integer,
pilota_vincitore varchar(20),
foreign key(id_gp) references gran_premio(id),
foreign key(id_circuito) references circuito(id),
foreign key(stagione) references stagione(anno),
index idx_gp(id_gp),
index idx_cir(id_circuito),
index idx_stag(stagione),
primary key(id_gp,id_circuito,stagione),
unique(id)
)engine'InnoDB';

create table arrivi(
id_weekend_reale integer,
posizione integer,
id_pilota integer,
id_team integer,
foreign key(id_weekend_reale) references weekend_reale(id),
foreign key(id_pilota) references pilota(numero),
foreign key(id_team) references team(id),
index idx_wr(id_weekend_reale),
index idx_team(id_team),
index idx_pilota(id_pilota),
primary key(id_weekend_reale,id_pilota)
)engine'InnoDB';