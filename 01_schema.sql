-- ==================================
-- Tabela: staging_operacje_ecom
-- ==================================
CREATE TABLE staging_operacje_ecom (
id INTEGER PRIMARY KEY,
nr_zamowienia VARCHAR(50),
data_zamowienia DATE,
klient_nazwa VARCHAR(50),
klient_miasto VARCHAR(50),
produkt_nazwa VARCHAR(50),
produkt_kategoria VARCHAR(50),
cena_jednostkowa NUMERIC(10,2),
ilosc INTEGER,
sposob_dostawy VARCHAR(50),
koszt_wysylki NUMERIC(6,2));