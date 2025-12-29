# raportLSI
Zadanie testowe LSI - Piotr Duch

Repozytorium zawiera:
- projekt .dproj
- pliki .pas oraz .dfm
- 'formatkę' uMain z głównym widokiem grida
- moduł bazy danych 'umMain' do obsługi połączenia, zapytań etc.
- pliki .sql ze skryptami do utworzenia tabeli oraz do wstawienia do niej rekordów testowych
- plik wykonywalny .exe

Założenia:
- filtr Lokali został zrealizowany za pomocą listy DropDown (komponent TcxLookupComboBox) i pobiera istniejące nazwy Lokali z bazy
- do filtrów daty zostało dodane proste zabezpieczenie: 'Data od' nie może być większa od 'Data do' i odwrotnie


Do połączenia z bazą danych użyłem komponentów ADO (dbGO), ponieważ w środowisku nie miałem dostępnego drivera FireDAC MSSQL, które jest bardziej użyteczne, jednak funkcjonalnie spełnia to wymagania zadania.
