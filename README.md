# Lokalna pohrana podataka u iOS-u

## Opis projekta

U ovom projektu obrađena je lokalna pohrana podataka na primjeru jednostavne aplikacije za vođenje bilješki. Aplikacija omogućuje pregled, dodavanje, ažuriranje i brisanje bilješki. Osim toga nudi i kategoriziranje prema mapama i dodavanje tagova.

## Tehnologije

1. **SwiftUI** – razvojni okvir za izradu korisničkog sučelja
2. **SwiftData** – razvojni okvir za rad s lokalnom bazom podataka (SQLite)
3. **Xcode** – razvojno okruženje

## Primjeri pohrane

1. **Kreiranje baze i tablica** – modeli `Note`, `Directory`, `Tag` i `ChecklistItem` označeni su s `@Model`. Svaki model postaje tablica u SQLite bazi, a baza se stvara pri pokretanju aplikacije pomoću `ModelContainer`.
2. **Upis, promjena, brisanje i dohvat** – bilješka se dodaje u pogledu za novu bilješku, mijenja se u prikazu za uređivanje, a briše se povlačenjem.
3. **Veze i normalizacija** – direktorij i bilješke povezani su vezom jedan-prema-više, a bilješke i oznake vezom više-prema-više, za koju SwiftData sam stvara međutablicu. Popis zadatka ne može postojati bez svoje bilješke pa se briše isto kad i bilješka.
5. **Verzioniranje i migracija baze** – modeli su organizirani u `SchemaV1` i `SchemaV2`. U drugoj verziji bilješka dobiva svojstvo `isPinned`.
6. **Izolirana pohrana** – na kartici *Files* tekst se sprema u datoteku `note.txt` u mapi `Documents` spremnika aplikacije.
7. **Korisničke postavke** – na kartici *Settings* korisničko ime i postavka tamnog načina rada spremaju se u UserDefaults pomoću `@AppStorage`.

