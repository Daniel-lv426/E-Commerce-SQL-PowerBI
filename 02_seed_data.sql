-- 
Wstawianie wartości

INSERT INTO staging_operacje_ecom (id, nr_zamowienia, data_zamowienia, klient_nazwa, klient_miasto, produkt_nazwa, produkt_kategoria, cena_jednostkowa, ilosc, sposob_dostawy, koszt_wysylki)
VALUES
(1, 'ORD-2026-001', '2026-10-01', 'Jan Kowalski', 'Warszawa', 'Wózek paletowy ręczny', 'Magazyn', 1200.00, 1, 'Kurier Standard', 150.00),
(2, 'ORD-2026-001', '2026-10-01', 'Jan Kowalski', 'Warszawa', 'Taśma pakowa 48mm', 'Pakowanie', 12.50, 10, 'Kurier Standard', 15.00),
(3, 'ORD-2026-002', '2026-10-02', 'Anna Nowak', 'Wrocław', 'Regał magazynowy metalowy', 'Magazyn', 850.00, 2, 'Paleta', 250.00),
(4, 'ORD-2026-003', '2026-10-03', 'Piotr Zieliński', 'Poznań', 'Folia stretch transparentna', 'Pakowanie', 45.00, 5, 'Paczkomat', 12.00),
(5, 'ORD-2026-004', '2026-10-04', 'Anna Nowak', 'Wrocław', 'Taśma pakowa 48mm', 'Pakowanie', 12.50, 20, 'Kurier Standard', 20.00),
(6, 'ORD-2026-005', '2026-10-05', 'Jan Kowalskii', 'warszawa', 'Folia stretch transparentna', 'Pakowanie', 45.00, 2, 'Kurier Standard', 15.00),
(7, 'ORD-2026-006', '2026-10-06', 'Katarzyna Wiśniewska', 'Gdańsk', 'Wózek paletowy ręczny', 'Magazyn', 1200.00, 1, 'Paleta', 220.00),
(8, 'ORD-2026-007', '2026-10-07', 'Piotr Zieliński', 'Poznań', 'Regał magazynowy metalowy', 'Magazyn', 850.00, 1, 'Paleta', 250.00),
(9, 'ORD-2026-008', '2026-10-08', 'Katarzyna Wiśniewska', 'Gdańsk', 'Etykiety termiczne 100x150', NULL, 25.00, 4, 'Paczkomat', 12.00),
(10, 'ORD-2026-009', '2026-10-09', 'Jan Kowalski', 'Warszawa', 'Etykiety termiczne 100x150', 'Pakowanie', 25.00, 10, NULL, 18.00),
(11, 'ORD-2026-010', '2026-10-10', 'Tomasz Wójcik', 'Kraków', 'Wózek paletowy ręczny', 'Magazyn', 1200.00, 2, 'Paleta', 300.00),
(12, 'ORD-2026-010', '2026-10-10', 'Tomasz Wójcik', 'Kraków', 'Folia stretch transparentna', 'pakowanie', 45.00, 6, 'kurier standard', 25.00),
(13, 'ORD-2026-011', '2026-10-10', 'Anna Nowak', 'wroclaw', 'Etykiety termiczne 100x150', 'Pakowanie', 25.00, 8, 'Paczkomat', 12.00),
(14, 'ORD-2026-012', '2026-10-11', 'Piotr Zieliński', 'Poznań', 'Taśma pakowa 48mm', NULL, 12.50, 15, 'Kurier Standard', 18.00),
(15, 'ORD-2026-013', '2026-10-11', 'Katarzyna Wiśniewska', 'Gdańsk', 'Regał magazynowy metalowy', 'Magazyn', 850.00, 1, 'Paleta', 250.00),
(16, 'ORD-2026-014', '2026-10-12', 'Marek Krajewski', 'Łódź', 'Wózek paletowy ręczny', 'Magazyn', 1200.00, 1, 'Paleta', 220.00),
(17, 'ORD-2026-014', '2026-10-12', 'Marek Krajewski', 'Łódź', 'Paleta drewniana jednorazowa', 'Magazyn', 35.00, 4, 'Paleta', 50.00),
(18, 'ORD-2026-015', '2026-10-13', 'Jan Kowalski', 'Warszawa', 'Regał magazynowy metalowy', 'Magazyn', 850.00, 1, 'Paleta', 250.00),
(19, 'ORD-2026-016', '2026-10-14', 'Anna Nowak', 'Wrocław', 'Wózek paletowy ręczny', 'Magazyn', 1200.00, 1, 'Paleta', 220.00),
(20, 'ORD-2026-017', '2026-10-15', 'Tomasz Wójcik', 'krakow', 'Taśma pakowa 48mm', 'Pakowanie', 12.50, 30, 'Kurier Standard', 35.00);
