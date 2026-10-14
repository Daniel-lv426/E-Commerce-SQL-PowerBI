# Projekt Analityczny E-Commerce (SQL & Power BI)

Projekt przedstawiający proces inżynierii danych i analityki biznesowej: od oczyszczania surowych danych w bazie PostgreSQL, przez zaprojektowanie relacyjnego modelu gwiazdy, aż po stworzenie interaktywnego raportu w Power BI.

## Charakterystyka Raportu
Projekt ma charakter **raportu stanu**. 

Jego głównym celem jest dostarczenie stabilnego i spójnego źródła danych o bieżących operacjach e-commerce (sprzedaż, koszty logistyki itd.) w określonej ramie czasowej. Stanowi on fundament pod ewentualną dalszą analitykę udowadniającą poprawność przygotowania pipeline'u danych oraz architekturę modelu gwiazdy w Power BI.

## Technologie i Narzędzia
- **Baza danych / ETL:** PostgreSQL (czyszczenie, transformacja i modelowanie)
- **Wizualizacja i DAX:** Power BI (model gwiazdy, zaawansowane miary, interaktywne raporty)

## Przebieg Projektu
1. **Staging i Czyszczenie (SQL):**
   - Normalizacja i ujednolicenie surowych rekordów.
   - Poprawa tekstu (INITCAP, TRIM) oraz maskowanie danych poufnych w PostgreSQL.
2. **Modelowanie (Model Gwiazdy):**
   - **Tabela Faktów:** `zamowienia`
   - **Tabele Wymiarów:** `klienci`, `produkty`
3. **Analityka i DAX (Power BI):**
   - Wdrożenie modelu relacyjnego typu wiele-do-1.
   - Stworzenie kluczowych wskaźników biznesowych: suma wartości, średnia wartość koszyka, udziały procentowe z użyciem `REMOVEFILTERS` oraz dynamiczne karty łączące funkcję `TOPN` z formatowaniem tekstowym (`UNICHAR(10)`).

## Struktura Repozytorium
- `01_schema.sql` — Tworzenie schematu bazy danych.
- `02_seed_data.sql` — Wprowadzanie surowych danych testowych.
- `03_star_schema.sql` — Transformacje.
- `dashboard.pbix` — nteraktywny plik raportu Power BI.