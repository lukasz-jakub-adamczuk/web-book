
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