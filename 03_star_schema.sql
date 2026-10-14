-- ===========================================================================
Tabela: Klienci (Wymiar)
-- ===========================================================================
-- Cel: Utworzenie tabeli wymiaru (klientów) z tabeli staging_operacje_ecom.

CREATE TABLE klienci AS
WITH klienci_czyste AS (SELECT 
CASE
WHEN INITCAP(TRIM(klient_nazwa)) = 'Jan Kowalskii' THEN 'Jan Kowalski'
ELSE INITCAP(TRIM(klient_nazwa))
END AS imie_naziwsko,
CASE
WHEN INITCAP(TRIM(klient_miasto)) = 'Wroclaw' THEN 'Wrocław'
WHEN INITCAP(TRIM(klient_miasto)) = 'Krakow' THEN 'Kraków'
ELSE INITCAP(TRIM(klient_miasto))
END AS miasto
FROM staging_operacje_ecom
GROUP BY klient_nazwa, klient_miasto)
SELECT
ROW_NUMBER() OVER(ORDER BY imie_naziwsko) AS id_klienta, CONCAT(SUBSTRING(imie_naziwsko, 1, POSITION(' ' IN imie_naziwsko)), '******') AS imie_nazwisko, miasto
FROM klienci_czyste
GROUP BY imie_naziwsko, miasto;

-- ===========================================================================
Tabela: Produkty (Wymiar)
-- ===========================================================================
-- Cel: Utworzenie tabeli wymiaru (produkty) z tabeli staging_operacje_ecom.

CREATE TABLE produkty AS
WITH produkty_czyste AS (SELECT
INITCAP(TRIM(produkt_nazwa)) AS nazwa_produktu, 
CASE
WHEN INITCAP(TRIM(produkt_nazwa)) = 'Taśma Pakowa 48mm' THEN 'Pakowanie'
WHEN INITCAP(TRIM(produkt_nazwa)) = 'Etykiety Termiczne 100x150' THEN 'Pakowanie'
ELSE INITCAP(TRIM(produkt_kategoria))
END AS kategoria,
cena_jednostkowa
FROM staging_operacje_ecom
GROUP BY produkt_nazwa, produkt_kategoria, cena_jednostkowa)
SELECT
ROW_NUMBER() OVER(ORDER BY nazwa_produktu) AS id_produktu,
nazwa_produktu, kategoria, cena_jednostkowa
FROM produkty_czyste
GROUP BY nazwa_produktu, kategoria, cena_jednostkowa;

-- ===========================================================================
Tabela: Zamówienia (Fakt)
-- ===========================================================================
-- Cel: Utworzenie tabeli faktu (zamówienia) z tabeli staging_operacje_ecom

CREATE TABLE zamowienia AS
WITH czyste_dane AS (SELECT
id AS id_zamowienia,
nr_zamowienia,
data_zamowienia,
CASE
WHEN INITCAP(TRIM(klient_nazwa)) = 'Jan Kowalskii' THEN 'Jan Kowalski'
ELSE INITCAP(TRIM(klient_nazwa))
END AS imie_nazwisko,
CASE
WHEN INITCAP(TRIM(klient_miasto)) = 'Wroclaw' THEN 'Wrocław'
WHEN INITCAP(TRIM(klient_miasto)) = 'Krakow'
THEN 'Kraków'
ELSE INITCAP(TRIM(klient_miasto))
END AS miasto,
INITCAP(TRIM(produkt_nazwa)) AS nazwa_produktu,
ilosc,
COALESCE(sposob_dostawy,'Brak informacji') AS forma_dostawy,
koszt_wysylki
FROM staging_operacje_ecom),
czyste_dane_2 AS (SELECT
id_zamowienia, 
nr_zamowienia, 
data_zamowienia, 
CONCAT(SUBSTRING(imie_nazwisko, 1, POSITION(' ' IN imie_nazwisko)), '******') AS imie_nazwisko,
miasto, 
nazwa_produktu, 
ilosc, 
forma_dostawy, 
koszt_wysylki
FROM czyste_dane),
czyste_dane_3 AS (SELECT
cz.id_zamowienia,
cz.nr_zamowienia,
cz.data_zamowienia,
k.id_klienta,
cz.nazwa_produktu,
cz.ilosc,
cz.forma_dostawy,
cz.koszt_wysylki
FROM czyste_dane_2 cz
LEFT JOIN klienci k
ON cz.imie_nazwisko = k.imie_nazwisko
AND cz.miasto = k.miasto)
SELECT
cz3.id_zamowienia,
cz3.nr_zamowienia,
cz3.data_zamowienia,
cz3.id_klienta,
p.id_produktu,
cz3.ilosc,
cz3.forma_dostawy,
cz3.koszt_wysylki
FROM czyste_dane_3 cz3
LEFT JOIN produkty p
ON cz3.nazwa_produktu = p.nazwa_produktu;