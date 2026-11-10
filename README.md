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
  
### Utworzone miary DAX:

**% Udział w Liczbie Zamówień:**
```dax
% Udział w Liczbie Zamówień = 
VAR LiczbaZamowien = [Liczba zamówień]
VAR CalaLiczbaZamowien = CALCULATE([Liczba zamówień], REMOVEFILTERS(produkty), REMOVEFILTERS(klienci))
RETURN
IF(ISBLANK(LiczbaZamowien), 0, DIVIDE(LiczbaZamowien, CalaLiczbaZamowien, 0))
```
**% Udział Wydanej Sumy:**
```dax
% Udział Wydanej Sumy = 
VAR SumaWartosci = [Suma Wartości]
VAR CalkowitaSumaWartosci = CALCULATE([Suma Wartości], REMOVEFILTERS(klienci), REMOVEFILTERS(produkty))
RETURN
DIVIDE(SumaWartosci, CalkowitaSumaWartosci, 0)
```
**Liczba zamówień:**
```dax
Liczba zamówień = 
COUNTROWS(zamowienia)
```
**Suma Ilości Sprzedanych Produktów:**
```dax
Suma Ilości Sprzedanych Produktów = 
SUM(zamowienia[ilosc])
```
**Suma Kosztów Wysyłki:**
```dax
Suma Kosztów Wysyłki = 
SUM(zamowienia[koszt_wysylki])
```
**Suma Wartości:**
```dax
Suma Wartości = 
SUMX(zamowienia, zamowienia[ilosc] * RELATED(produkty[cena_jednostkowa]))
```
**Średni Koszt Wysyłki:**
```dax
Średni Koszt Wysyłki = 
AVERAGEX(zamowienia, [Suma Kosztów Wysyłki])
```
**Średnia Wartość Koszyka:**
```dax
Średnia Wartość Koszyka = 
AVERAGEX(zamowienia, [Suma Wartości])
```
**Top Klient:**
```dax
Top Klient = 
VAR TopIDKlient = TOPN(1, VALUES(klienci[id_klienta]), [Suma Wartości], DESC)
VAR TopKlient = TOPN(1, VALUES(klienci[imie_nazwisko]), [Suma Wartości], DESC)
VAR Ilosc = CALCULATE([% Udział w Liczbie Zamówień], TopKlient)
VAR Wartosc = CALCULATE([% Udział Wydanej Sumy] , TopKlient)
RETURN
TopKlient & UNICHAR(10) & "Numer ID: " & TopIDKlient & UNICHAR(10) & FORMAT(Wartosc, "#,##0.00%") & " zysku" & UNICHAR(10) & FORMAT(Ilosc, "#,##0%") & " ilości zamówień"
```
**Top Produkt:**
```dax
Top Produkt = 
VAR TopProdukt = TOPN(1, VALUES(produkty[nazwa_produktu]), [Suma Ilości Sprzedanych Produktów], DESC, [Suma Wartości], DESC)
VAR IloscSztuk = CALCULATE([Suma Ilości Sprzedanych Produktów], TopProdukt)
VAR Zysk = CALCULATE([Suma Wartości], TopProdukt)
RETURN
TopProdukt & UNICHAR(10) & "Ilość sztuk: " & IloscSztuk & " szt." & UNICHAR(10) & "Suma zysku: " & FORMAT(Zysk, "#,###0 zł")
```
**Kalendarz:**
```dax
Kalendarz = 
CALENDAR(MIN(zamowienia[data_zamowienia]), MAX(zamowienia[data_zamowienia]))
```
**Miesiąc i Rok:**
```dax
Miesiąc i Rok = 
FORMAT(Kalendarz[Date], "mmmm yyyy")
```


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
