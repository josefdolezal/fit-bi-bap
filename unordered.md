# [Abstract CZ](abstract_cs.tex)

# [Abstract EN](abstract_en.tex)

# Úvod
V posledních letech můžeme být svědky velkého technologického rozmachu.
Nedílnou součástí tohoto rozmachu jsou mobilní aplikace a také 3D tiskárny.
V oblasti 3D tiskáren se popularita zvýšila za posledních pět let více než osmkrát (měřeno dle zájmu o téma v Google vyhledávání)[11. 4. 2017 https://trends.google.cz/trends/explore?q=3d%20print].
Mnohem většího úspěchu dosáhly mobilní zařízení, ktrá v září 2016 poprvé přesáhli využívání osobních počítačů [11. 4. 2017 http://www.telegraph.co.uk/technology/2016/11/01/mobile-web-usage-overtakes-desktop-for-first-time/].

I navzdory těmto faktům je v současné době využívání a ovládání 3D tiskáren doménou zejména počítačů.
O tom svědčí především rozšíření mobilních aplikací.
Ty jsou v současné době pouze dvě, jejich funkcionalita je navíc oproti desktopové verzi značně omezená.

Ve své bakalářské práci se zabývám návrhem mobilní aplikace pro ovládání 3D tiskáren prostřednictví rozhraní OctoPrint, její analýzou a implementací.
Práci uvádím kapitolou *3D tisk*, která čtenáře stručně uvede do problému.
V kapitole *Analýza* zkoumám možné technologie a paradigmata, z nichž vybrané zmiňuji následně v kapitole o implementaci.
V části věnující se návrhu popisuji jaké funkcionality implementovaná aplikace bude obsahovat a způsob jakým jsem je do aplikace zakomponoval.
O udržení kvality aplikace a využití automatizace v průběhu vývoje mluvím v kapitole *Testování*.

Výsledná aplikace je vedena jakou open source.
Její zdrojový kód je tedy volně dostupný s možností libovolných úprav.
Přestože aplikace není distribuována standardní cestou obchodem App Store, je na tuto formu distribuce plně připravena.
Jednotilivé verze aplikace jsou v tuto chvíli distribuovány pouze registrovaným vývojářům pomocí Fabric Beta.

# Klíčová slova
mobilní aplikace, 3d tisk, octoprint, iOS, Swift, open source

# 3D Tisk

V této kapitole stručně zmiňuji princip a technologii 3D tisku.
Čtenáře uvedu také do stávajícího stavu z pohledu ovládání 3D tiskáren a využití mobilních aplikací k tomuto účelu.

## Technologie 3D tisku

3D tisk je proces, při kterém lze z digitálního modelu vytvořit reálný objekt.
Tyto objekty vznikají postup nanášením jednotlivých vrstev modelu na sebe ve vertikálním směru.
Jedna z metod využívajících vrstvení materiálu se nazývá Fused deposition modeling (zkráceně FDM).
Princip FDM spočívá v tavení plastu (případně jiných materiálů) pomocí tiskové hlavy, která následně nanáší taveninu ve vrstvách na sebe[1].
Takto vytvořené plastové objekty mají velkou výhodu v nízkých nákladech na výrobu.
Jsou tedy ideálním prostředkem k výrobě prototypů nebo produkování omezeného množství výrobků [11. 4. http://www.efunda.com/processes/rapid_prototyping/intro.cfm].

## OctoPrint - Ovládání 3D tiskárny

V závislosti na typu tiskárny existuje více možností jak ji ovladát.
Mezi nejrozšířenější patří v tuto chvíli volně dostupné webové rozhraní OctoPrint [11. 4. http://octoprint.org].
Bohužel je ale toto rozhraní zcela zaměřeno na použití z počítače.
Ovládací prvky nejsou dostatečně veliké a manipulace s nimi přináší velmi špatnou uživatelskou zkušenost na mobilních zařízeních.
Pro lepší čitelnost ovládání je nutné stránku v prohlížeči přiblížit.
To ale z části omezuje funkcionalitu, protože některé prvky se při přiblížení vykreslí až za okraj stránky a není možné je využít. Možné alternativy v kapitole [Analýza] Mobilní klienti.

## Definice pojmů

Přestože se obvykle slovem tisk rozumí běžný papírový tisk pomocí inkoustové nebo laserové tiskárny,
ve své práci tento druh tisku vůbec neuvažuji a pojmem tisk rozumím 3D tisk.
Analogické předefinování si dovolím i u pojmů odvozených.

Přestože metod tisku existuje mnoho, ve své práci uvažuji pouze FDM, tedy metodu zmíněnou v kapitole [Technologie 3D tisku].

# Architektura aplikace
Jako doporučenou architekturu aplikací pro platformu iOS (konkrétně iPhone a iPad) uvádí Apple MVC.
Tato architektura rozděluje aplikaci do tří vrstev: Model, View a Controller. [15. 3. 2017 https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html]

**Model** perzistentní objekty, které aplikace využívá k pro vnitřní logiku a prezentaci dat uživateli.
Každý modelový objekt může být v relaci s libovolným počtem jiných modelových objektů.
Tato vrstva je často reprezentována databází, příkladem mohou být databáze CoreData, Realm nebo SQLite.

**View** datový objekt viditelný uživatelem. View obsahuje logiku pro vykreslení a interakci s uživatelem.
Přestože se view standardně používá pro zobrazení modelových objektů nebo jejich úpravu, jsou od sebe tyto vrstvy striktně odstíněny.
Na platformě iOS tuto vrstvu reprezentuje framework UIKit vytvořený Applem.

**Controller** vrstva, která na základě vstupů z view aktualizuje a mění model nebo překresluje view v případě, že zobrazovaná data už nejsou aktuální.
Jedním z úkolů controlleru je striktně zamezit přímé interakci mezi view a modelem.
Toto oddělení je zavedeno proto, aby view nemuselo znát konkrétní strukturu modelu a aby model nemusel obsahovat logiku pro formátování dat (cena, čas, ...).
Dále se stará o navigaci mezi obrazovkami, síťování a interakci s uživatelem.
Při rozdělení do obrazovek platí pravidlo, že jeden controller obsluhuje jedno nebo více view.
K tomu využívá libovoné množství modelových objektů.
O jednu obrazovku se typicky stará právě jeden controller, ale je možné jich použít více.

![Architektura MVC](illustrations/mvc-architecture.png)

Shrneme-li vlastnosti vrstev, jejich klíčové role jsou:
* Model udává, jakým způsobem jsou data uložena,
* View se stará o správné vykreslení dat,
* Controller se stará o ostatní logiku.

Z tohoto shrnutí vyplývá, že controller je velmi blízce spjat s view. Tuto skutečnost zachycuje obrázek 2.

![Massive View Cotnroller](illustrations/mvc-massive-view-controller.png)

Pro možné porovnání architektury jsem připravil scénář stažení libovolných dat na základě požadavku uživatele. V MVC by se architektura chovala takto:
* Uživatel v aplikaci klikne na tlačítko "Stáhnout data".
* Tuto interakci odchytí view a upozorní controller.
* Controller na základě upozornění stáhne data a předá je modelu k uložení.
* Model ukládá data a notifikuje controller o změně.
* Controller aktualizuje view.
* Nastane-li během stahování chyba, controller vytváří nové view a chybu prezentuje uživateli.

Pro zmíněné notifikace nabízí Apple řešení pomocí Delegate pattern.
Controller musí naimplementovat specifické rozhraní, čímž se stane delegátem.
Jako delegát se pak může zaregistrovat na notifikace obejktů, jejichž rozhraní implementoval.

MVC je v době psaní této práce nejpoužívanější architekturou a to především díky své jednoduchosti.
Při tvorbě větších aplikací ale nemusí být vhodné.
Controller se při nestandradním grafickém návrhu může stát velmi složitým, což výrazně snižuje jeho čitelnost a testovatelnost.
Z tohoto důvodu se MVC často přezdívá Massive View Controller.
Díky přímému napojení controlleru na *View* se při testování chování controlleru (behavioral testing) musí využít simulátoru mobilního operačního systému a aplikaci v něm automaticky "proklikat".
To zvyšuje časovou náročnost testování, dokonce v některých případech znemožňuje testování úplně (controlleru nezle podvrhnout mock objekty).
Tento problém se snaží řešit architektura MVVM od společnosti Microsoft. [zdroj: appol]

## MVVM
Z důvodu nárustu nároků na mobilní aplikace se v posledních letech rozmáhá architektura MVVM.
Tato architektura vychází ze zmíněného MVC a jejím základním úkolem je zjednodušit controller.
Za tímto účelem se ke stávajícím třem vrstvám přidává View Model, který se stará o přípravu dat z Modelu pro zobrazení a také o perzistenci změn.

**View Model** objekt vlastněný controllerem za pomoci kompozice.
Pro controller připravuje naformátované výstupy a poskytuje mu rozhraní pro vstupy.
Výstupem se rozumí veškerá data, která jsou potřebná pro sestavení View.
To může být např. datum ve specifickém formátu, cena včetně měny nebo informace o tom, kolik řádků bude obsahovat tabulka na obrazovce.
Oproti MVC tedy perzistentní data nejsou viditelná controlleru, ale pouze view modelu.
Ten je nejdříve připraví pro zobrazení.
Vstupem může být libovolná interakce uživatele.
Změna textu v textovém poli, stisknutí tlačítka, ale i fyzický pohyb telefonem (otočení obrazovky).
Na základě vstupů spouští view model svou vnitřní logiku a generuje výstupy.

Zodpovědnost controlleru se zavedením View Modelu dramaticky snižuje.
V ideálním případě je controller zodpovědný pouze za správné sestavení view a napojení zfromátovaných výstupů na něj.
Dále pak za odchycení uživatelských interakcí a jejich propagaci do view modelu.
Toto chování zachycuje obrázek 3.

![Architektura MVVM](illustrations/mvvm-architecture.png)

Vrstvy mají následující klíčové vlastnosti:
* Model definuje jakým způsobem jsou data uložena a při změně notifikuje view model,
* View vykresluje na obrazovku naformátované výstupy a upozorňuje controller při interakci uživatele,
* Controller sestavuje hierarchii view, napojuje zformátované výstupy view modelu na view a z uživatelské interakce vytváří vstupy pro view model,
* View model načítá data modelu, na základě vstupů z controlleru nebo změny modelu generuje výstupy pro controller.

Pro porovnání architektury s MVC lze opět využít scénář pro stažení dat. Pro tento scénář by se architektura MVVM chovala následovně:
* Controller napojuje výstupy view modelu na view a vytváří pravidla pro převod uživatelské interakce na vstupy view modelu.
* Uživatel v aplikaci klikne na tlačítko "Stáhnout data".
* View upozorňuje controller na interakci uživatele, ten automaticky vytváří vstup pro view model.
* View model na základě vstupu stahuje data a předává je modelu.
* Model po uložení notifikuje view model, ten vytváří výstup pro controller, který nechává překreslit view.
* V případě chyby vytvoří view model chybový výstup, ten se pomocí controlleru propaguje do view.

Oproti MVC je na tomto příkladu vidět snížení zodpovědnosti controlleru. Tato zodpovědnost se přesunula do view modelu.
Na první pohled nemusí být tato změna opodstatněná, protože logika aplikace nezmizela, jen se přesunula.
Právě to ale umožnilo (nebo minimálně zjednodušilo) způsob, jakým lze logiku testovat.
View model generuje výstupy na základě vstupů, v testech tedy lze uživatelskou interakci podvrhnout a testovat pouze výstupy (není potřeba vytvářet view ani controller).
Dodatečně lze otestovat i uživatelské rozhraní.
Protože logika aplikace je otestována pomocí view modelu, uživatelské rozhraní už stačí otestovat např. shodou s referenčním obrázkem.

Při pohledu na notifikace je vidět, že přibyl typ, který nebyl v MVC potřeba.
Jedná se o notifikace směrem z view modelu ke controlleru (view model nemá referenci na controller, nemůže ho notifikovat přímo).
Některé výstupy view modelu je tedy potřeba sledovat v čase a na jejich změny reagovat.
Toto lze vyřešit pomocí KVO, které nabízí Apple v základu.
KVO umožňuje zaregistrovat se na notifikace o změně stavu nějakého objektu.
V případě controlleru by se registroval na změny stavu výstupů view modelu.
Kdykoliv by se výstup změnil, controller by dostal notifikaci.
Tento přístup ale není běžný pro použití s jazykem Swift.
Místo KVO se nyní standardně používají reaktivní rozšíření, které popisuji v následujících kapitolách.

Přestože implementovaná aplikace není v ohledu na uživatelské scénáře nijak složitá, obsahuje mnoho obrazovek.
Obrazovky jsou vysoce interaktivní a více se k jejich implementaci hodí reaktivní přístup.
Z tohoto důvodu jsem jako architekturu vybral MVVM s použitím reaktivních rozšíření místo standardního MVC.

[zdroj: objcio]

# Testování
V kapitole o testování se podrobněji zabývám způsoby a postupy naznačenými v kapitolách [Architektura MVVM](#architektura-mvvm) a [Reaktivní programování](#reaktivni-programovani).

Testováním software se rozumí postupy a procesy, pomocí kterých lze měřit, zda testovaný software (či jeho části) splňuje požadované nároky či nikoliv.
Opakovaným aplikováním těchto postupů lze v softwaru nalézt chyby, nedostatky nebo chybějící vlastnosti oproti dodané specifikaci.
Výsledky testování následně vypovídají o kvalitě softwaru a o míře splnění specifikace.
[28. 3. 2017 https://www.tutorialspoint.com/software_testing/]

V této práci jsem využil tří typů testů.
Prvním typem jsou uživatelské testy, zkoumající chování uživatelů při používání aplikace.
Druhým typem jsou testy uživatelského rozhraní, které zjišťují, zda vlivem změn ve vzhledu aplikace nebyla omezena některá z vyžadovaných funkcionalit.
Posledním technika testování, kterou jsem využil jsou testy chování aplikace.
Ty ověřují zda aplikace na sadu vstupů produkuje odpovídající výstupy.
V následujícím shrnutí se těmto technikám věnuji podrobněji.

**Uživatelské testy** Slouží ke zjišťování problémů s návrhem vzhledu aplikace.
Na výsledcích těchto testů lze sledovat, jaké části aplikace jsou uživatelům nesrozumitelné či zda se v aplikaci orientují.
Obsahem testů jsou předpřipravené scénáře pokrývající vybrané funkce aplikace.
[29. 3. 2017 http://www.dobryweb.cz/uzivatelske-testovani]
Tyto testy se provádějí na vzorku vybraných uživatelů z cílové skupiny.
Uživatelé během testů prochází aplikaci a mají za úkol naplnit zadanané scénáře.
Během testů se podrobně sleduje, jakým způsobem uživatelé reagují a jak úspěšní jsou při plnění úkolů.
Vzhledem k vysoké časové (mnohdy také finanční) náročnosti se tyto testy provádějí obvykle pouze jednou a to v začátcích projektu.
[29. 3. 2017 http://www.h1.cz/pouzitelnost]

Ve své práci jsem prováděl testování na malé skupině uživatelů 3D tiskáren.
Na základě pozorování jsem následně změnil...[TODO]

**Testy uživatelského rozhraní** Dávají možnost intereagovat s komponentami uživatelského rozhraní za účelem jejich validace.
Na rozdíl od testů chování přistupují tyto testy k aplikaci jako k celku a zacházejí s ní obdobně jako by s ní zacházel uživatel. Tyto testy tedy nemají přístup k vnitřní implementaci aplikace.
Jelikož nevyžadují během chodu zásah člověk (test *nahrazuje* jeho přítomnost), mohou být pouštěny automaticky.
Standardně se tedy pouští při implementaci každé nové funkce, mnohdy až několikrát denně.
[29. 3. 2017 https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html]

Protože tyto testy z jsou v mém případě pouze nadstavbou nad *testy chování* vysvětlené níže, rozhodl jsem se je implementovat pomocí referenčních obrázků.
Testy tedy pro každý podstatný krok scénáře obsahují referenční obrázek, jak by obrazovka měla v dannou chvíli vypadat.
Pokud se vzhled s referenčním obrázkem shoduje, test projde.
Nevýhodou tohoto přístupu je nutnost přegenerování referenčních obrázků v momentě,
kdy se vzhled obrazovky (úmyslně) změní byť o jediný obrazový bod.
Podstatnou výhodou tohoto přístupu je ale nezávislost na implementaci.
Pokud se implementace změní, s velkou pravděpodobností to výsledky testů neovlivní.

**Testy chování aplikace** Testované objekty mají definované své rozhraní a závisloti.
Tím jsou deklarovány i závazky objektu.
Závazky určují, jakým způsobem by měl objekt působit na zbylé části aplikace, jaké schopnosti a funkce má - definují chování objektu.
Testovaným objektem může být libovolný modul aplikace.
Složitost a rozsah testů se odvíjí od počtu závazků objektu.
Testování probíhá tak, že vlastnosti objektu jsou pomocí rozhraní měněny a sleduje se, jestli se objekt na základě změn chová podle očekávání.
[29. 3. 2017 https://www.objc.io/issues/15-testing/behavior-driven-development/]

V reálném světě si lze jako objekt představit auto.
Jako změnu vlastnosti můžeme lze použít vyprázdnění nádrže.
Očekávaným chováním auta následně je, že přestane být pojízdné a rozsvítí kontrolku řidiči.
Auto projde testem chování, právě když při prázdné nádrži je nepojízdné a svítí kontrolka.

Tento princip testování využívám pro testování View Modelu a Modelu (viz. kapitola [Architektura MVVM](#MVVM)).
Díky úspěšnému otestování více než 70% [TODO] logiky aplikace, lze usuzovat, že při používání aplikace se chyb vyskytne jen nepatrné množství.
View vrstvu následně není samostatně nutné testovat, protože z testů View Modelu je jisté, že data jsou správně připravena k zobrazení.
Testy pomocí porovnání skutečného vzhledu s očekávaným (zmíněno v testech uživatelského rozhraní) jsou tedy dostačující.

Obdobně jako testy rozhraní i tyto testy se pouštějí při vývoji až několikrát denně.
Slouží také jako dobrý ukazatel kvality aplikace a dokáží určit její rozsah.

S pojmem *testování chování* je velmi blízce spjat **vývoj řízený testováním chování** (z anglického Behavior Driven Development, zkráceně BDD).
V tomto přístupu k vývoji se před konkrétní implementací nejdříve nadefinuje, jakým způsobem se mají testované komponenty chovat.
Následně se sestavují testy, které vyžadují úplné implementování vyžadovaného chování.
Tím má objekt definované, jaké rozhraní musí implementovat a jaké závislosti bude vyžadovat.
Testy jsou popisovány tkzv. DSL, který pomocí kombinace klíčových slov a textového popisu chování. [SHOW PREVIEW DSL]
Na základě definice objektu se následně přechází ke konkrétní implementaci.
[29. 3. 2017 https://www.objc.io/issues/15-testing/behavior-driven-development/]

[PREVIEW DSL]

## Zdroje
* appol https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html
* objcio https://www.objc.io/issues/13-architecture/mvvm/

## Tagy
* [TODO] - Potřeba doplnit
* [SHOW `ABC` `DEF`] - Link na prvek, který je v textu jinde
* [PREVIEW `XYZ`] - Nahradit ukázkou kódu `XYZ`

## Pojmy
* MVC - model view controller
* Model
* View
* Controller
* framework
* user-stories
* behavioral testing
* mock
* MVVM
* view model
* kompozice
* ui test
* delegate pattern
* KVO - key-value observing
* BDD - behavioral driven development
* TDD - test driven development
* DSL - Domain specific language (u testů BDD)
* App Store
* Fabric Beta
