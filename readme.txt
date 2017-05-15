V tomto adresáři se nachází implementační a rešeršní část bakalářské práce nazvané "iOS aplikace k ovládání 3D tiskáren".

Implementační část se nachází ve složce `src/impl`.
Aplikace je implementována v jazyce Swift 3 a pro její správné fungování je potřeba nainstalovat Xcode verze 8.3.
Dále je potřeba nainstalovat tyto nástroje:
1. SwiftLint - nástroj na analýzu kódu, dostupné z https://github.com/realm/SwiftLint
2. Carthage - Správce závislostí, dostupný z https://github.com/Carthage/Carthage
3. SwiftGen - Generátor překladů, dostupný z https://github.com/SwiftGen/SwiftGen

Po nainstalování je potřeba doinstalovat potřebné závislosti, to lze udělat z terminálu příkazem `carthage bootstrap --platform iOS`.
Projekt lze nyní spustit ze souboru OctoPhone.xcodeproj a přeložit.

Pro spuštění testů je potřeba spusti Xcode prostředí.
Zde se testy spustí klávesovou zkratkou `cmd + u`.

Pro přeložení rešeršní části je potřeba nainstalovat potřebné závislosti.
Ukázkový skript pro instalaci závislostí pro Ubuntu 14.04 je v souboru `src/text/.travis.yml`.

Pro přeložení stačí z terminálu spustit příkaz `latexmk -pdf` v adresáři práce.
Po spuštění se vytvoří PDF soubor `thesis.pdf` s textem práce.
