\newpage

# JavaScript

## Wprowadzenie

Najczęściej spotykanym zatosowaniem języka JavaScript są strony WWW. Skrypty służą najczęściej do zapewnienia interaktywności poprzez reagowanie na zdarzenia, sprawdzania poprawności formularzy lub budowania elementów nawigacyjnych. Podczas wzbogacania funkcjonalności strony internetowej istotne jest, aby żaden element serwisu nie stał się niedostępny po wyłączeniu obsługi JavaScriptu w przeglądarce. Skrypt JavaScriptu ma znacznie ograniczony dostęp do komputera użytkownika (o ile nie zostanie podpisany cyfrowo). Niektóre strony WWW zbudowane są z wykorzystaniem JavaScriptu po stronie serwera, jednakże znacznie częściej korzysta się w tym przypadku z innych języków.


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
aya.framework.getVersion();
```

Próba uzyskania wersji przy użyciu metody prywatnej poza obiektem, kończy się 
błędem, czyli dokładnie jak powinno.

```console
> TypeError: Object #<Object> has no method 'getVersion'
```


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

```
var x = 999999;
var time = new Date();

var idx = 0;
do { idx++; } while( x-- );

console.log(idx);
console.log((new Date() - time) + 'ms');
```

If you want to take loop performance to the next level, Zakas also provides a more advanced loop optimization technique, which runs through the loop asynchronously (so cool!).

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