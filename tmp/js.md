\newpage

# JavaScript

## Wprowadzenie

Najczęściej spotykanym zatosowaniem języka JavaScript są strony WWW. Skrypty służą najczęściej do zapewnienia interaktywności poprzez reagowanie na zdarzenia, sprawdzania poprawności formularzy lub budowania elementów nawigacyjnych. Podczas wzbogacania funkcjonalności strony internetowej istotne jest, aby żaden element serwisu nie stał się niedostępny po wyłączeniu obsługi JavaScriptu w przeglądarce. Skrypt JavaScriptu ma znacznie ograniczony dostęp do komputera użytkownika (o ile nie zostanie podpisany cyfrowo). Niektóre strony WWW zbudowane są z wykorzystaniem JavaScriptu po stronie serwera, jednakże znacznie częściej korzysta się w tym przypadku z innych języków.


## Zmienne

Brak instrukcji `var` przed nazwą zmiennej tworzy w JavaScript zmienną o zasięgu globalnym. Nie zawsze tego chcemy.

```javascript
var name     = "John";
var fullname = "Doe";
```

Jednak wielokrotne użyci instrukcji `var` wcale nie jest najlepszym sposobem na tworzenie zmiennych o mniejszym zasięgu. Możliwe jest zadeklarowanie wszystkich zmiennych, których potrzebujemy w danym momencie.

```javascript
var name = "John",
    fullname = "Doe";
```

Co lepsze. Dostępna jest także inicjalizacja zmiennych.


TODO compose with hoisting...


## Domyślne wartości zmiennych

Nie zawsze wiesz czy szukana zmienna istnieje lub została zainicjalizowana. Ponowne 
przypisanie wartości zatrze informacje o dotychczasowej zmiennej. Istnieje łatwe
sprzwdzenie czy istnieje dana zmienna lub przypisanie jej wartości domyślnej.

```javascript
var app = app || {};
```

Przykładowe użycie...


## Średniki i nowe linie

JavaScript nie wymaga średników w pewnych miejscach naszego kodu. Jednak dla większej czytelności oraz pewności, że dostaniemy oczekiwany wynik stosujmy pewne zasady. Oczywiście poniższy kod jest w pełni poprawny składniowo.

```javascript
function getValue() {
	var a = 10;
	return
		a;
}
```

Zastanawiasz się czy ten kod jest błędny albo dostaniesz to czego oczekujesz. Nasza funkcja zwróci `undefined`, a nie spodziewanej liczby `10`.

TODO przyklad dla srednikow...


## Referencje do obiektów DOM

Doskonale wiemy, że większość jeśli nie wszystkie operacje DOM są wolne. Zatem jeśli planujemy odwoływanie się do DOM więcej niż jeden raz, stwórzmy odpowiednią referecję.

```javascript
document.getElementById('nav').className = 'test';
document.getElementById('nav').setAttribute('display', 'block');
```

Nasz dodatkowy obiekt pozwoli na bezpośdernie odwołanie do elementu, bez konieczności szukania go w drzewie DOM.

```javascript
var obj = document.getElementById('nav');
	obj.className = 'test';
	obj.setAttribute('display', 'block');
```

Dodatkowa zmienna i określone instrukcje będą zawsze szybsze niż tuzin wywołań `getElementById`.


## Przechowuj selektory

Dobrze wiesz, że operacje przeszukiwania DOM są wolne. Jeśli planujesz wykorzystanie danych selektorów więcej niż jeden raz, zapisz je do konkretnych zmiennych.

```javascript
document.getElementById('wrapper');
```

Zmienna `wrapper` ogranicza kosztowne operacje na drzewie DOM.

```javascript
var wrapper = document.getElementById('wrapper');
```

Teraz, gdy przyjdzie potrzeba modyfikacji lub ponownego znalezienia elementu `#wrapper` istnieje referencja do niego.
## Pętla `for`

Zawsze inicializujemy zmienne, których użyjemy.

```javascript
var text = "Hello, world!";
for (var i = 0; i < text.length; i++) {
	console.log(text.charAt(i));
}
```

Istnieją dwie możliwości na efektywniejszą pętlę.

```javascript
var len = text.length;
for (var i = 0; i < len; i++) { }
```

Teraz nasza pętla nie pobiera długości zmiennej `text` przy każdej iteracji, a tylko porównuje wartość `i` z ustaloną długością ciągu, przechowywaną w osobnej zmiennej `len`.

Zróbmy to jeszcze lepiej. Istnieją przypadki, kiedy określone zmienne są potrzebne tylko weenątrz pętli, zatem zdefiniujemy je w zasięgu pętli.

```javascript
var len = text.length;
for (var i = 0, len = text.length; i < len; i++) { }
```

Wszystko zależy od sytacji, ale nawet najprostsza instrukcje obniża wydajność kiedy powtarza się wielokrotnie.


## Combine control conditions and control variable changes when using loops

Whenever talking about performance, work avoidance in loops is a hot topic because, quite simply, loops run over and over again. So if there are any performance gains to be had, you will most likely see the largest boosts within your loops.
One way to take advantage of this is to combine your control condition and control variable when you define your loop. Here’s an example that doesn’t combine these controls:

```javascript
var time = new Date();
var idx = 0;

for ( var x = 0; x < 1000000; x++ ) { idx++; };

console.log(idx);
console.log((new Date() - time) + 'ms');
```

Before we add anything at all to this loop, there are a couple operations that will occur every iteration. The Javascript engine must #1 test if x exists, #2 test if x < 0 and #3 add the increment x++.
However if you're just iterating over some items in an array, you can cut out one of these operations by flipping this iteration around and using a while loop:

```javascript
var x = 999999;
var time = new Date();

var idx = 0;
do { idx++; } while( x-- );

console.log(idx);
console.log((new Date() - time) + 'ms');
```

If you want to take loop performance to the next level, Zakas also provides a more advanced loop optimization technique, which runs through the loop asynchronously (so cool!).


## Unikaj zwrcania niezdefiniowanych zmiennych w funkcji

Pamiętasz doskonale, że JavaScript przechowuje zmienne z określonym zasięgiem. Globalny zasięg zmiennych to ostatnia rzecz jakiej potrzebujemy.

```javascript
function sum(a, b) {
    r = a + b;
    return r;
}
```

Dokładnie to dzieje się w powyższym przykładzie. Funkcja zwraca sumę dwóch liczb, jednak nie deklaruje zmiennej. Jeśli użyjemy `var` w funkcji to zadeklarujemy dodatkową zmienną, ale przez to nie będzie ona przechowywana w zasięgu globalnym.

```javascript
function sum(a, b) {
    var r = a + b;
    return r;
}
```

Nie każdy przypadek jest równie prosty, jednak zmienne lokalne są bezpieczniejsze niż globalne. Nasz kod będzie jeszcze lepszy, gdy od razu zwrócimy sumę argumentów.

```javascript
function sum(a, b) {
    return a + b;
}
```

## Opóźnienie

Nie każdy wie, że pierwszy argument funkcji `setTimeout`, ale także `setInterval` nie musi być ciągiem znakowym. Taka sytuacja pozwala na wiele elastyczniejsze użycie funkcji.

```javascript
setTimeout('loop()', 1000);
```

Jednak zamiast wywołania funkcji przekażemy jej ciało.

```javascript
setTimeout(loop, 1000);
```

Wyobraź sobie konieczność przesłania argumentu do naszej metody, czasem nawet wielokrotnego przesłania. Takie zmienne tracą zasięg (poza zmiennymi globalnymi).

```javascript
setTimeout('loop(counter)', 1000);
```

Istnieje dobry sposób rozwiązania tego problemu, czyli funkcja anonimowa.

```javascript
setTimeout(function() { loop(counter); }, 1000);
```


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


## Liczenie elementów DOM według typu

Skomplikowanie stron internetowych bywa różne. Brak optymalizacji często widzimy gołym okiem.
Szybkość ładowania strony zależy od wielu czynników. Złożona struktura dokumentu czy nadmiarowe
znaczniki mają wpływ na generowanie kodu HTML. Jedyna kwestia to ocena naszej strony pod kątem
wykorzystania semantycznych znaczników.

```javascript
var all = document.getElementsByTagName('*');
var types = {};
for (var i = all.length; i--;) {
	if (all[i].tagName in types) {
		types[all[i].tagName]++;
	} else {
		types[all[i].tagName] = 1;
	}
}
console.log('*: ' + all.length);
```

Określenie liczby wszystkich elementów naszej strony to proste zadanie. Niewiele trudniej
uzyskamy inforamcje o liczbie różnych znaczników, a od tegu już prosta droga do optymalizacji.

```javascript
var sortable = [];
for (var tag in types) {
	sortable.push([tag, types[tag]]);
}
sortable.sort(function(a, b) {return a[1] - b[1]});

var i = sortable.length-1;
do {
    console.log(sortable[i][0] + ': ' + sortable[i][1]);
} while(i--);
```

Teraz dokładnie wiemy ile znaczników `<div>` lub `<span>` zawiera badana strona.
Sami wyciągamy wnioski czy każdy z nich jest konieczny.


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
aya.framework.getVersion();
```

Próba uzyskania wersji przy użyciu metody prywatnej poza obiektem, kończy się 
błędem, czyli dokładnie jak powinno.

```console
> TypeError: Object #<Object> has no method 'getVersion'
```


## Rzutowanie zmiennych

Zachowaujemy ostrożność podczas rzutowanie zmiennych poprzez funkcję `parseInt`. Funkcja nie wymaga podstawy systemu liczbowego na jaki przetwarzamy pierwszy argument. Dla naszej wygody stara się o określenie podstawy systemu na podstawie przetwarzanego ciągu.

```javascript
parseInt('010');
```

Pozostaje tylko pytanie, czym jest dla nas `'010'`, które rzutujemy na liczbę całkowitą. W systemie dzięsiętnym odpowiedź jest bardzo prosta, ale dla mnie ta liczba wygląda jak system ósemkowy.

```javascript
parseInt('010');
>>> 10
```

Jak się okazuje konsola Google Chrome przedstawia wynika jako `10`, jeśli nie określimy podstawy systemu liczbowego.

```javascript
parseInt('010', 10);
>>> 10
parseInt('010', 8);
>>> 8
```

Spodziewane wyniki dostaniemy podczas rzutowania z określonymi podstawami systemu.

```javascript
parseInt(010);
>>> 8
```

Jednak najciekawszy wynik mamy prze agumenci `010`, który w rzeczywiści jest wartością w systemie ósemkowym. Nasza sytuacja komplikuje się bardziej, gdyż `010` nie jest ciągiem znakowym, zatem także prawidłowym argumentem funkcji.

```javascript
> typeof 010
  "number"
```


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


## Tak lub nie

Czasami...

```javascript
if (Math.round(Math.random())) {
	// do if true
} else {
	// do if false
}
```

Bardzo prosty sposób na symulowanie działania naszego skryptu.

