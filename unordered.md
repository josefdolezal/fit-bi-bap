# Architektura aplikace
Jako doporučenou architekturu aplikací pro platformu iOS (konkrétně iPhone a iPad) uvádí Apple MVC.
Tato architektura rozděluje aplikaci do tří vrstev: Model, View a Controller.

Model: perzistentní objekty, které aplikace využívá k pro vnitřní logiku a prezentaci dat uživateli.
Každý modelový objekt může být v relaci s libovolným počtem jiných modelových objektů.
Tato vrstva je často reprezentována databází, příkladem mohou být databáze CoreData, Realm nebo SQLite.

View: datový objekt viditelný uživatelem. View obsahuje logiku pro vykreslení a interakci s uživatelem.
Přestože se view standardně používá pro zobrazení modelových objektů nebo jejich úpravu, jsou od sebe tyto vrstvy striktně odstíněny.
Na platformě iOS tuto vrstvu reprezentuje framework UIKit vytvořený Applem.

Controller: vrstva, která na základě vstupů z view aktualizuje a mění model nebo překresluje view v případě, že zobrazovaná data už nejsou aktuální.
Jedním z úkolů controlleru je striktně zamezit interakci mezi view a modelem.
Toto oddělení je zavedeno proto, aby view nemuselo znát konkrétní strukturu modelu a aby model nemusel obsahovat logiku pro formátování dat (cena, čas, ...).
Dále se stará o navigaci mezi obrazovkami, síťování a interakci s uživatelem.
Při rozdělení do obrazovek platí pravidlo, že jeden controller obsluhuje jedno nebo více view za pomoci libovolného počtu modelových objektů.
O jednu obrazovku se typicky stará právě jeden controller, ale je možné jich použít více.

Shrneme-li vlastnosti vrstev, jejich klíčové role jsou:
Model udává, jakým způsobem jsou data uložena,
View udává, jak jsou data zobrazena
O zbylou logiku aplikace se stará controller.

MVC je v době psaní této práce nejpoužívanější architekturou a to především díky své jednoduchosti.
Při tvorbě větších aplikací nemusí být ale tato architektura vhodná.
Controller se při nestandradním grafickém návrhu může stát velmi složitým, což výrazně snižuje jeho čitelnost a testovatelnost.
Díky přímému napojení controlleru na view se při testování chování controlleru (behavioral testing) musí využít simulátoru operačního systému a aplikaci v něm automaticky "proklikat". To zvyšuje časovou náročnost testování, dokonce v některých případech znemožňuje testování úplně (controlleru nezle vnutit mock objekty).
Tento problém se snaží řešit architektura MVVM od společnosti Microsoft.

[appol]

[obrázek MVC]

* appol https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html

MVC - model view controller
Model
View
Controller
framework
user-stories
behavioral testing
mock
