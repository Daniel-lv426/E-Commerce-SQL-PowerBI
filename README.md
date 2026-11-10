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

### Zrzuty ekranu z projektu:

#### Podgląd raportu
<img width="1318" height="759" alt="zrzut_ekranu_podglad_raportu" src="https://github.com/user-attachments/assets/2da8b9de-7568-42fe-ab91-ae96a31cb2a3" />

#### Model danych (relacje)
<img width="1321" height="804" alt="zrzut_ekranu_relacje" src="https://github.com/user-attachments/assets/a2bc9485-9cf8-426b-b325-30d4e33fd21f" />
