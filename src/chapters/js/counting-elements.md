
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

