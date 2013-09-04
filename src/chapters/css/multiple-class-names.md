
## Klasy wielokrotne

Arkusze CSS umożliwiają ustawienie wielu klas w jednym elemencie. Taki sposób pozwala na określenie pojedynczych właściwości i aplikowanie tylko wybranych. Wyobraź sobie galerię obrazów, z których kilka ma prawa autorskie, a pozostałe są wolne:

```html
<img src="foo.gif" class="special" alt="" />
<img src="bar.gif" class="royaltyfree" alt="" />
<img src="baz.gif" class="royaltyfree special" alt="" />
```

Chcemy, aby obrazy wolne odróżniały się od pozostałych. Dlatego tworzymy klasę `royaltyfree` oraz `special` dla odróżnienia jednych od drugich.

Style CSS mają podstawowe reguły:

```css
.royaltyfree {
	border: 2px solid #666;
}
.special {
	padding: 2px;
	background: #ff0;
}
```

Każdy obrazek o klasie `special` bedzie miał dopełnienie i żółte tło, a obrazy wolne od praw autorskich obramowanie. Analogicznie obrazy z dwoma klasami aplikują reguły obydwu selektorów, zatem dopełnienie, tło i obramowanie i żółte tło.

Możliwości takiej techniki jest wiele - to tylko tylko prosty przykład. Ważne jest tworzenie nazw klas zgodnie z ich semantycznym przeznaczeniem, a nie opisem samego wyglądu. Nicole Sullivan zaproponowała [OOCSS](http://www.stubbornella.org/content/category/general/geek/css/oocss-css-geek-general/), który korzysta z tej metody.
