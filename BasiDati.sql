-- Creazione database --
create database treni;
-- Creazione tabella passeggero --
DROP TABLE IF EXISTS treni.passeggero;
CREATE TABLE treni.passeggero(
IDpasseggero INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
N_bagagli INT
);

-- Record della tabella passeggero --
INSERT INTO treni.passeggero VALUES (1,3);
INSERT INTO treni.passeggero VALUES (2,4);
INSERT INTO treni.passeggero VALUES (3,1);
INSERT INTO treni.passeggero VALUES (4,2);
INSERT INTO treni.passeggero VALUES (5,5);
INSERT INTO treni.passeggero VALUES (6,1);
INSERT INTO treni.passeggero VALUES (7,2);
INSERT INTO treni.passeggero VALUES (8,2);
INSERT INTO treni.passeggero VALUES (9,4);
INSERT INTO treni.passeggero VALUES (10,3);
INSERT INTO treni.passeggero VALUES (11,1);
INSERT INTO treni.passeggero VALUES (12,2);
INSERT INTO treni.passeggero VALUES (13,2);

-- Creazione tabella treno --
DROP TABLE IF EXISTS treni.treno;
CREATE TABLE treni.treno(
IDtreno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tipo varchar(30),
capienza_persone_carrozza int,
capienza_bagagli_carrozza int,
capienza_totale_persone int,
capienza_totale_bagagli int
);

-- Record della tabella treno --
INSERT INTO treni.treno VALUES (1,'Regionale','35','15', 300, 150);
INSERT INTO treni.treno VALUES (2,'Intercity', '40','18', 299, 147);
INSERT INTO treni.treno VALUES (3,'FrecciaRossa','35','20', 298, 143);
INSERT INTO treni.treno VALUES (4,'ItaloTreno','30','25', 297, 142);
INSERT INTO treni.treno VALUES (5,'FrecciArgento','25','22', 296, 140);
INSERT INTO treni.treno VALUES (6,'FrecciaBianca','20','19', 295, 135);
INSERT INTO treni.treno VALUES (7,'Regionale','35','15', 294, 134);
INSERT INTO treni.treno VALUES (8,'Intercity', '40','18', 293, 132);
INSERT INTO treni.treno VALUES (9,'FrecciaRossa','35','20', 292, 130);
INSERT INTO treni.treno VALUES (10,'ItaloTreno','30','25', 291, 126);
INSERT INTO treni.treno VALUES (11,'FrecciArgento','25','22', 290, 123);
INSERT INTO treni.treno VALUES (12,'FrecciaBianca','20','19', 289, 122);
INSERT INTO treni.treno VALUES (13,'FrecciaBianca','20','19', 289, 122);

-- Creazione della tabella prenotazione --
DROP TABLE IF EXISTS treni.prenotazione;
CREATE TABLE treni.prenotazione(
IDprenotazione INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
posto varchar(10),
classe varchar(20),
PIdPasseggero int,
PIdTreno int,
CONSTRAINT FK_PIdPasseggero FOREIGN KEY (PIdPasseggero) REFERENCES treni.passeggero(IDpasseggero),
CONSTRAINT FK_PIdTreno FOREIGN KEY (PIdTreno) REFERENCES treni.treno(IDtreno)
);

-- Record della tabella prenotazione --
INSERT INTO treni.prenotazione VALUES (1,'2D','Economy', 1, 1);
INSERT INTO treni.prenotazione VALUES (2,'4E', 'Business', 2, 2);
INSERT INTO treni.prenotazione VALUES (3,'7C','Premium', 3, 3) ;
INSERT INTO treni.prenotazione VALUES (4,'1D','Business', 4, 4);
INSERT INTO treni.prenotazione VALUES (5,'6G','Standard', 5, 5);
INSERT INTO treni.prenotazione VALUES (6,'2A','Executive', 6, 6);
INSERT INTO treni.prenotazione VALUES (7,'6D','Economy', 7, 7);
INSERT INTO treni.prenotazione VALUES (8,'1B', 'Business', 8, 8);
INSERT INTO treni.prenotazione VALUES (9,'8C','Premium', 9, 9);
INSERT INTO treni.prenotazione VALUES (10,'10D','Business', 10, 10);
INSERT INTO treni.prenotazione VALUES (11,'2E','Standard', 11, 11);
INSERT INTO treni.prenotazione VALUES (12,'5F','Executive', 12, 12);


-- Creazione della tabella rotta --
DROP TABLE IF EXISTS treni.rotta;
CREATE TABLE treni.rotta(
IDrotta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Naz_inter varchar(15)
);

-- Record della tabella rotta --
INSERT INTO treni.rotta VALUES (1,'Nazionale');
INSERT INTO treni.rotta VALUES (2,'Nazionale');
INSERT INTO treni.rotta VALUES (3,'Internazionale');
INSERT INTO treni.rotta VALUES (4,'Internazionale');
INSERT INTO treni.rotta VALUES (5,'Nazionale');
INSERT INTO treni.rotta VALUES (6,'Nazionale');
INSERT INTO treni.rotta VALUES (7,'Nazionale');
INSERT INTO treni.rotta VALUES (8,'Nazionale');
INSERT INTO treni.rotta VALUES (9,'Nazionale');
INSERT INTO treni.rotta VALUES (10,'Nazionale');
INSERT INTO treni.rotta VALUES (11,'Nazionale');
INSERT INTO treni.rotta VALUES (12,'Nazionale');
INSERT INTO treni.rotta VALUES (13,'Nazionale');

-- Creazione della tabella dipendente --
DROP TABLE IF EXISTS treni.dipendente;
CREATE TABLE treni.dipendente(
IDdipendente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome varchar(20),
cognome varchar(20),
ruolo varchar(20),
rotta_preferita varchar(20),
giorni_consecutivi boolean, -- 0 = meno di due giorni, 1 = più di 2 giorni --
DIdrotta int,
CONSTRAINT FK_DIdrotta FOREIGN KEY (DIdrotta) REFERENCES treni.rotta(IDrotta) 
);

-- Record della tabella dipendente --
INSERT INTO treni.dipendente VALUES (1,'Franco','Rossi','Controllore','Roma-Milano',0, 1);
INSERT INTO treni.dipendente VALUES (2,'Luca','Aquila','Macchinista','Roma-Milano',1, 2) ;
INSERT INTO treni.dipendente VALUES (3,'Chiara','Romano','Hostess','Roma-Milano',1, 3);
INSERT INTO treni.dipendente VALUES (4,'Fabrizio','Zeno','CapoTreno','Roma-Milano',0, 4);
INSERT INTO treni.dipendente VALUES (5,'Silvio','Magnani','Controllore','Genova-Verona',1, 5);
INSERT INTO treni.dipendente VALUES (6,'Mauro','Compagnoni','Macchinista','Genova-Verona',1, 6);
INSERT INTO treni.dipendente VALUES (7,'Amelia','Daddario','Hostess','Genova-Verona',0, 7);
INSERT INTO treni.dipendente VALUES (8,'Manuel','Mulattieri','CapoTreno','Genova-Verona',1, 8) ;
INSERT INTO treni.dipendente VALUES (9,'Adriano','Diterlizzi','Controllore','Torino-Firenze',1, 9);
INSERT INTO treni.dipendente VALUES (10,'Giuseppe','Vicenti','Macchinista','Torino-Firenze',0, 10);
INSERT INTO treni.dipendente VALUES (11,'Lorenzo','Bianchi','Hostess','Torino-Firenze',0, 11);
INSERT INTO treni.dipendente VALUES (12,'Beatrice','Verdi','CapoTreno','Roma-Milano',1, 12);
INSERT INTO treni.dipendente VALUES (13,'Beatrice','Rossi','CapoTreno','Roma-Milano',1, 13);

-- Creazione della tabella storico --
DROP TABLE IF EXISTS treni.storico;
CREATE TABLE treni.storico(
anno int,
rotta varchar(20),
numero_passeggeri int,
SIdPrenotazione int,
SIdRotta int,
CONSTRAINT FK_SIdPrenotazione FOREIGN KEY (SIdPrenotazione) REFERENCES treni.prenotazione(IDprenotazione),
CONSTRAINT FK_SIdRotta FOREIGN KEY (SIdRotta) REFERENCES treni.rotta(IDrotta)
);

-- Record dello storico --
INSERT INTO treni.storico VALUES (2020, 'Roma-Napoli', 100, 1, 1);
INSERT INTO treni.storico VALUES (2018, 'Torino-Bologna', 150, 2, 2);
INSERT INTO treni.storico VALUES (2016, 'Zurigo-Milano', 170, 3, 3);
INSERT INTO treni.storico VALUES (2016, 'Lione-Torino', 210, 4, 4);
INSERT INTO treni.storico VALUES (2016, 'Bologna-Venezia', 210, 5, 5);
INSERT INTO treni.storico VALUES (2016, 'Genova-Verona', 210, 6, 6);
INSERT INTO treni.storico VALUES (2020, 'Mestre-Venezia', 200, 7, 7);
INSERT INTO treni.storico VALUES (2020, 'Torino-Milano', 150, 8, 8);
INSERT INTO treni.storico VALUES (2018, 'Roma-Milano', 90, 9, 9);
INSERT INTO treni.storico VALUES (2017, 'Napoli-Roma', 140, 10, 10);
INSERT INTO treni.storico VALUES (2019, 'Bologna-Venezia', 50, 11, 11);
INSERT INTO treni.storico VALUES (2020, 'Genova-Verona', 210, 12, 12);
