
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

