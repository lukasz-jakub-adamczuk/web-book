
## Znajdź element na stronie

Czasami szukamy danego elementu na stronie, której kodu nie znamy. Ręczne przeszukiwanie całego drzewa DOM jest długotrwałe, ale z pomocą przychodzi nam jQuery.

```javascript
$('body').animate({
	'scrollTop': $('article').offset().top - 100
});
```

Jeśli używamy jQuery w danym projekcie to wywołanie takiego kodu przewinie nas do szukanego elementu na stronie.
