\newpage

# CSS

## Wprowadzenie

CSS został stworzony w celu odseparowania struktury dokumentu od formy jego prezentacji. Separacja ta zwiększa zakres dostępności witryny, zmniejsza zawiłość dokumentu, ułatwia wprowadzanie zmian w strukturze dokumentu. CSS ułatwia także zmiany w renderowaniu strony w zależności od obsługiwanego medium (ekran, palmtop, dokument w druku, czytnik ekranowy). Stosowanie zewnętrznych arkuszy CSS daje możliwość zmiany wyglądu wielu stron naraz bez ingerowania w sam kod (X)HTML, ponieważ arkusze mogą być wspólne dla wielu dokumentów.

## Rozmazany tekst

Hej, dziś krótko.
Poniżej macie prosty tip na to jak przy pomocy CSS zrobić rozmazany tekst.

```css
.class {
   color: transparent;
   text-shadow: 0 0 5px rgba(0,0,0,0.5);
}
```

Skalę rozmazania możecie zmienić manipulując wartością opactity kodu rgba, a także wartością rozmycia właściwości text-shadow. Proste.
Dodatkowo mam dla was bardzo ciekawy tester prezentacji fontów dla urządzeń mobilnych. Tutaj w wygodny sposób możecie sprawdzić jak wybrany przez was font prezentuje się na ekranach telefonów i tabletów. Opcjonalnie można zmienić rozmiar testowanego kroju a także jego rozmieszczenie względem ekranu.

## Clearfix

Prawdopodobnie najpolularniejszy trik jaki stosowano przy tworzeniu stron internetowych.

```css
.clearfix:after {
     visibility: hidden;
     display: block;
     font-size: 0;
     content: " ";
     clear: both;
     height: 0;
     }
.clearfix { display: inline-block; }
/* start commented backslash hack \*/
* html .clearfix { height: 1%; }
.clearfix { display: block; }
/* close commented backslash hack */
```

Nicolas Gallagher opisał dokładnie ["micro" clearfix](http://nicolasgallagher.com/micro-clearfix-hack/), który jest nowszym podejściem do tematu.

```css
.group:before,
.group:after {
    content: "";
    display: table;
} 
.group:after {
    clear: both;
}
.group {
    zoom: 1; /* For IE 6/7 (trigger hasLayout) */
}
```

Aktaulna wersja, jeśli potrzebujesz wsparcia w IE8 lub nowszych przeglądarkach.

```css
.group:after {
  content: "";
  display: table;
  clear: both;
}
```

## Krótsze kody kolorów

Używanie skróconych kodów kolorów nie jest niczym nowym, ale wiele osób zwyczajnie, o tym zapomina. Niektórzy użytkownicy pamiętają jeszcze 216 bezpiecznych kolorów w przeglądarkach, choć dostępne spektrum dla 3 składowych to 256^3, czyli 16777216 kolorów.

Tutaj pojawia się pewien dylemat. Ile kolorów odróżnia ludzkie oko? To zależy indywidualnie od każdego z nas, ale w przypadku 16^3, otrzymujemy dokładne 4096 różnych kolorów. Czy to wystarczy? Oceńcie sami.

```css
.white {
	color: #ffffff; /* use #fff */
}
.black {
	color: #000000; /* use #000 */
}
.test {
	color: #abc; /* use #aabbcc */
}
```

Powyższe przykłady są bardzo prozaiczne i zasadniczo możliwe jest zapisanie każdego z kolorów w formie 3 cyfrowego kodu. Kwestia jak duża będzie odległość pomiędzy odcieniami każdego koloru.

```css
div {
	background: #c54218; /* use #c41 */
}
```

Potrzebowaliśmy koloru `#c54218`, a otrzymaliśmy `#cc4411`, czy całkiem bliski naszym oczekiwaniom.

'Uwaga:' Nie wszystkie kolory tak równie łatwo interpoluje się do wartości skróconych.

Dla wyjaśnienia ciemniejszy i najbliższy białemu kolor to `#eee`, który jest dość ciemny.

## Połącz razem wiele skrótów i wartości definicji

Nieustanna optymalizacja naszych stylów, prowadzi czasami do trudnych w odnalezieniu błędów. Nadpisywanie właściwości skrótowych jest dobrym rozwiązanie, bo często zaoszczędzamy kilka znaków w naszych stylach.

Bardzo rzadko zdarza się, aby style wymagały czterech różnych kolorów obramowania, ale jeśli tak jest pozostaje tylko właściwe kodowanie.

```css
div {
	border-top: 1px solid #f00;
	border-right: 1px solid #0f0;
	border-bottom: 1px solid #00f;
	border-left: 1px solid #aaa;
}
```

W tym wypadku mamy również szerokie możliwości optymalizacji. Przykład o tyle niefortunny, bo domyślne wartości obramowania to szerokości 1 piksela i linia ciągła.

```css
div {
	border-color: #f00 #0f0 #00f #aaa;
}
```

Zatem wystarczyłoby samo zdefiniowanie samych kolorów. O ile mniej kodu. Szybko i czytelnie.

Jeśli nadpisujemy pojedyncze właściwości lub style, przeważnie lepsze jest zdefiniowanie tego samego raz i odpowiednie nadpisanie reguły.

## Krótsze definicje właściwości

Arkusze stylów kaskadowych zostały pomyślane w ten sposób, aby programiści tworzyli kod jak najszybciej. Poszczególne właściwości zawierają szereg skrótów, które w jednej linii definiują wiele właściwości.

```css
div {
	border: 1px solid #aaa;
}
```

Prosta definicja `border` umożliwia ustawienie zarównie wielkości obramowania, jego stylu jak i koloru. Tworzenie czterech reguł jest nieoptymalne z wielu powodów.

```css
.global {
	border-top: 1px solid #aaa;
	border-right: 1px solid #aaa;
	border-bottom: 1px solid #aaa;
	border-left: 1px solid #aaa;
}
```

Po pierwsze waga pliku CSS jest większa. Dodatkowo analiza takich stylów bywa kłopotliwa, bo zmiana w jednym miejscu, bywa nadpisywana kolejną regułą w dalszej części.

## Obrotowy link

HTML5 i CSS3 pojawiają się w aplikacjach i serwisach internetowych coraz częściej. Nie dziwi to ani trochę, skoro producenci przeglądarek wspierają coraz więcej standardów sieciowych w kolejnych wydaniach swoich produktów. Jak zwykle podczas poszukiwań inspiracji w sieci znalazłem ciekawy przykład wykorzystania nowych właściwości stylów kaskadowych.

Roll Link to przykład obrotowego linka, którego animacja opiera się na wykorzystaniu transformacji oraz atrybutów typu data. Serwis Webdesigner Depot prezentuje łącza w taki sposób w swoich artykułach.

### Analiza rozwiązania

Struktura takiego rozwiązania jest nieskomplikowana choć na pierwszy rzut oka, element span wydaje się nadmiarowy.

```html
<a href="some-url.html">
    <span data-title="Some text">Some text</span>
</a>
```

Nic bardziej mylnego. Wprawdzie do tego celu wykorzystać pseudo-elementy ::before i ::after, ale ich wsparcie jest dyskusyjne. Inna sprawa, że jak nie działa generated content to z dużą dozą prawdopodobieństwa nie działają także transformacje CSS.

Kształt całego rozwiązania stanowią odpowiednie style, podstawowe dla tagów a i span.

```css
/* ROLL LINKS */
.roll-link {
    color: #DD4D42;
    font-weight: bold;
    text-decoration: none;
    word-wrap: break-word;

    display: inline-block;
    overflow: hidden;

    vertical-align: top;

    -webkit-perspective: 600px;
       -moz-perspective: 600px;
       -ms-perspective: 600px;
       perspective: 600px;

    -webkit-perspective-origin: 50% 50%;
       -moz-perspective-origin: 50% 50%;
       -ms-perspective-origin: 50% 50%;
       perspective-origin: 50% 50%;
}

.roll-link:hover {
    text-decoration:none;
}
```

Klasa .roll-link stanowi zasady dla naszych obrotowych linków. Poza podstawowymi i bardzo dobrze znanymi, jak kolor, grubość tekstu określono kilka kilka innych. Sposób wyświetlania jako liniowo-blokowy oraz najważniejsze, perspective i perspective-origin.

Problem stanowi brak pełnego wsparcia dla tych właściwości CSS3, ale prefiksy działają. Poza tym obie właściwości wpierają tylko transformacje 3d, więc występują razem.

```css
.roll-link span {
    display: block;
    position: relative;
    padding: 0 2px;

    -webkit-transition: all 400ms ease;
       -moz-transition: all 400ms ease;
       -ms-transition: all 400ms ease;
       transition: all 400ms ease;

    -webkit-transform-origin: 50% 0%;
       -moz-transform-origin: 50% 0%;
       -ms-transform-origin: 50% 0%;
       transform-origin: 50% 0%;

    -webkit-transform-style: preserve-3d;
       -moz-transform-style: preserve-3d;
       -ms-transform-style: preserve-3d;
       transform-style: preserve-3d;
}
.roll-link:hover span {
    background: #DD4D42;

    -webkit-transform: translate3d( 0px, 0px, -30px ) rotateX( 90deg );
       -moz-transform: translate3d( 0px, 0px, -30px ) rotateX( 90deg );
       -ms-transform: translate3d( 0px, 0px, -30px ) rotateX( 90deg );
       transform: translate3d( 0px, 0px, -30px ) rotateX( 90deg );
}
```

Element span jest dzieckiem znacznika a, a jednocześnie pojemnikiem dla generowanego automatycznie pseudo elementu :after. Przejście ease elementu span następuje w momencie pojawienia się kursora myszy nad linkiem. Wówczas po 400ms zmienia się także kolor tła elementu.

```css
.roll-link span:after {
    content: attr(data-title);

    display: block;
    position: absolute;
    left: 0;
    top: 0;
    padding: 0 2px;

    color: #fff;
    background: #DD4D42;

    -webkit-transform-origin: 50% 0%;
       -moz-transform-origin: 50% 0%;
       -ms-transform-origin: 50% 0%;
       transform-origin: 50% 0%;

    -webkit-transform: translate3d( 0px, 105%, 0px ) rotateX( -90deg );
       -moz-transform: translate3d( 0px, 105%, 0px ) rotateX( -90deg );
       -ms-transform: translate3d( 0px, 105%, 0px ) rotateX( -90deg );
       transform: translate3d( 0px, 105%, 0px ) rotateX( -90deg );
}
```

Jeszcze większa magia dotyczy pseudo-elementu wstawianego po znaczniku span. Ten znowu pozycjonowany jest absolutnie względem rodzica, a jego zawartość wykorzystuje atrybut data-title.

### Podsumowanie

Oto prosty sposób wykorzystania transformacji 3d w celu osiągnięcia interesującego efektu. Pewien problem stanowi jeszcze odpowiednie wsparcie przez nowoczesne, nie mówiąc o wszystkich przeglądarkach. Jeśli taki efekt nie stanowi kluczowego mechanizmu strony ani uniemożliwia korzystania ze strony w starszych będzie traktowany jako dodatkowy krok w kierunku przyszłości i ukłon w stronę użytkowników korzystających z nowoczesnych przeglądarek.

## Skrótowe wartości właściwości

Używanie skróconych definicji niesie wiele korzyści. Jeśli w jednym momencie definiujemy zbiór wspólnych wartości zmniejszamy wielkość stylów. Dodatkowo dajemy sobie łatwą możliwość zmiany wyglądu w jednej linii, bez dopisywania kolejnych reguł.

```css
p {
	margin: 10px;
}
```

Nasza strona jest bardzo prosta i prezentuje paragrafy z marginesem wielkości `10px`. Jedna linia ustawia od razu wszystkie wartości

Jednak nie zawsze spotykamy równie banalne przykłady. Choć CSS pozwala na jednoczesne ustawienie wartości skrajnych.

```css
p {
	margin: 0 10px; /* padding: 0 10px 0 10px; */
}
```

Taki zapis odnosi się do zerowego marginesu w pionie i `10px` po bokach.

```css
p {
	margin: 0 10px 25px; /* margin: 0 10px 25px 10px */
}
```

Powyższa reguła ustawia dolny margines paragrafu na `25px`, co jest krótsze niż zdefiniowanie lewego marginesu przez kolejną liczbę.

Istnieją przypadki, kiedy konieczne jest podanie wszystkich czterech wartości. Jednak nawet wtedy bedzie to znacznie krótszy zapis niż 4 osobne reguły.

```css
p {
	margin: 10px 10px 25px 50px;
}
```

Analogicznie poza marginesem, ustawimy dopełnienie elementu, obramowanie.

VERIFY
\newpage

# JavaScript

## Wprowadzenie

Najczęściej spotykanym zastosowaniem języka JavaScript są strony WWW. Skrypty służą najczęściej do zapewnienia interaktywności poprzez reagowanie na zdarzenia, sprawdzania poprawności formularzy lub budowania elementów nawigacyjnych. Podczas wzbogacania funkcjonalności strony internetowej istotne jest, aby żaden element serwisu nie stał się niedostępny po wyłączeniu obsługi JavaScriptu w przeglądarce. Skrypt JavaScriptu ma znacznie ograniczony dostęp do komputera użytkownika (o ile nie zostanie podpisany cyfrowo). Niektóre strony WWW zbudowane są z wykorzystaniem JavaScriptu po stronie serwera, jednakże znacznie częściej korzysta się w tym przypadku z innych języków.

## Warunkowe logowanie

Dobrze wiemy, że JavaScript to bardzo elastyczny język. Nieraz potrzebujemy warunkowego
wykonania instrukcji. Dla łatwiejszego zrozumienia przykładu tworzymy prosty obiekt

```javascript
var user = {
	name: 'Luke',
	showName: function() {
		return 'Name: ' + this.name;
	}
};
```

Obiekt użytkownika zawiera nazwę i funkcję. Nasz cel to wyświetlenie `user.name`, jeśli
istnieje obiekt `user`.

```javascript
console.log(user && user.name);
```

W ten sposób wyświetlisz w konsoli właśność `name`, jeśli istnieje obiekt `user`.
Możliwości tego triku nie kończą się na przekazaniu właśności obiektu. A może funkcja?

```javascript
console.log(user && user.showName());
```

Zastowowanie tej sztuczki w naszych projektach nie sprawia wiele trudności.

## Liczenie elementów DOM

Optymalizacja kodu lub poszukiwanie błędów wymaga od programistów sprawnego poruszania się
w modelu obiektowym. Odnalezienie elementu od danym identyfikatorze czy klasie nie jest wcale trudne,
ale tak prozaiczne czynności często nie wystarczają do rozwiązania problemu.

Ile elementów zawiera nasza strona?

```javascript
var all = document.getElementsByTagName('*');
var script = document.getElementsByTagName('script');
var ids = 0, classes = 0, srcs = 0, async = 0;
for (var i = all.length; i--;) {
	if (all[i].id !== '') {
		ids++;
	}
	if (all[i].className !== '') {
		classes++;
	}
}
for (var i = script.length; i--;) {
	if (script[i].src !== '') {
		srcs++;
	}
	if (script[i].async) {
		async++;
	}
}
console.log('All elements:    ' + all.length);
console.log('  ids & classes: ' + ids + ', ' + classes);
console.log('All scripts:     ' + script.length);
console.log('  src & async:   ' + srcs + ', ' + async);
```

## Wzorzec modułu

Brak klas w JavaScript stanowi spory problem dla początkujących programistów. Często 

Tworzymy

```javascript
var aya = aya || {};

aya.framework = function() {

	// private property
	var version = '0.0.2';

	// private method
	var getVersion = function() {
		return version;
	}

	// all returned is a public
	return {

		// initialization
		init: function() {
			console.log('init successful...');
		},

		printModuleVersion: function() {
			console.log('Version: ' + getVersion());
		}
	}
}();
```

Przygotowany w ten sposób obiekt przechowuje wewnątrz pewne zmienne jako prywatne.
Natomiast kod zwracany jest traktowany jako publiczny. Ten prosty sposób pozwala
na ukrycie części implementacji i dostęp spoza samego obiektu.

```javascript
aya.framework.init();
```

Jak się spodziewamy w konsoli wyświetli się informacja o inicjalizacji obiektu.

```javascript
aya.framework.printModuleVersion();
```

Podobnie będzie, kiedy sprawdzimy wersję naszego obiektu, ale możliwe będzie to
jedynie poprzez publiczną metodę.

```javascript
aya.framework.printModuleVersion();
```

Próba uzyzkania wersji przy użyciu metody prywatnej poza obiektem, kończy się 
błędem, czyli dokładnie jak powinno.

```shell
> TypeError: Object #<Object> has no method 'getVersion'
```

```terminal
> TypeError: Object #<Object> has no method 'getVersion'
```

```sh
> TypeError: Object #<Object> has no method 'getVersion'
```

```shell
> TypeError: Object #<Object> has no method 'getVersion'
```


## Domyślne wartości zmiennych

Nie zawsze wiesz czy szukana zmienna istnieje lub została zainicjalizowana. Ponowne 
przypisanie wartości zatrze informacje o dotychczasowej zmiennej. Istnieje łatwe
sprzwdzenie czy istnieje dana zmienna lub przypisanie jej wartości domyślnej.

```javascript
var app = app || {};
```

Przykładowe użycie...

## Tak lub nie

???

```javascript
if (Math.round(Math.random())) {
	// do if true
} else {
	// do if false
}
```
Bardzo prosty sposób na symulowanie działania naszego skryptu.