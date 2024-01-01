-- OPERAZIONI SU DATABASE TRENI

-- Operazione 1
-- trovare la rotta con il maggior numero di prenotazioni nell’ultimo anno
SELECT 
    anno,
    rotta,
    numero_passeggeri
FROM 
    treni.storico
WHERE 
    numero_passeggeri = (
        SELECT 
            MAX(numero_passeggeri)
        FROM
            treni.storico)
and anno = 2020;
    
-- Operazione 2
-- calcolare la capienza totale, suddivisa per carrozza, per un viaggio
select distinct rotta as Rotta, capienza_persone_carrozza as CapienzaPerCarrozza
	from treni.prenotazione as P
    inner join treni.storico as S
    on P.IDprenotazione = S.SIdPrenotazione
    inner join treni.treno as T
    on S.SIdPrenotazione = T.IdTreno;
    
-- Operazione 3
-- - comporre un equipaggio per uno specifico viaggio con tutti i ruoli previsti considerando possibilmente le rotte preferite

-- esempio per la rotta Roma-Milano
SELECT ruolo, nome, cognome, rotta_preferita FROM treni.dipendente WHERE IDdipendente IN 
(
    SELECT MIN(IDdipendente) 
    FROM treni.dipendente
    GROUP BY ruolo
);
    
-- Operazione 4
-- effettuare una prenotazione per persone e bagagli dopo averne calcolato la fattibilità

-- esempio con un passeggero (primo record della tabella passeggero)
-- bagagli
select N_bagagli
	from treni.passeggero
    where IDpasseggero = 1;
    
select capienza_totale_bagagli
	from treni.treno
    where IDtreno = 1;

-- passeggeri
select capienza_totale_persone
	from treni.treno
    where IDtreno = 1;
    
-- Aggiorniamo il primo record nella tabella treno dopo aver effettuato studio di fattibilità 
-- (attributi = capienza_totale_bagagli e capienza_totale_persone)
UPDATE 
	treni.treno
    SET capienza_totale_bagagli = 150 - 3
    where IDtreno = 1;

UPDATE 
	treni.treno
    SET capienza_totale_persone = 300 - 1
    where IDtreno = 1;

-- Aggiunta di una prenotazione 
INSERT INTO treni.prenotazione VALUES (13,'11A','Executive', 13, 13);
       
-- Operazione 5
-- calcolare il numero medio di persone trasportate complessivamente per ogni rotta 
select avg(numero_passeggeri) as Media_Passeggeri, rotta as Rotta
	from treni.storico
	group by rotta;
    
-- Operazione 6
-- trovare i nomi dei dipendenti che non hanno mai lavorato per due giorni consecutivi sulla stessa rotta 
select nome as Nome, cognome as Cognome
	 from treni.dipendente 
     where giorni_consecutivi = 0;
     
-- Operazione 7
-- trovare le rotte su cui non sono mai stati trasportati più di 100 passeggeri
select rotta as Rotta, numero_passeggeri as N_passeggeri
	from treni.storico 
	where numero_passeggeri <= 100;
    
-- Operazione 8
-- trovare i viaggi con il maggior numero di passeggeri trasportati
SELECT 
    anno,
    rotta,
    numero_passeggeri
FROM 
    treni.storico
WHERE 
    numero_passeggeri = (
        SELECT 
            MAX(numero_passeggeri)
        FROM
            treni.storico);
    
    
    
    