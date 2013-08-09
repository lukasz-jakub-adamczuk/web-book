
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

