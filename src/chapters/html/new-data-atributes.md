
## Nowe atrybuty `data-`

Bardzo często zdarzało się, że kod strony stawał się nie tylko nośnikiem struktury i treści. Czasami istniała potrzeba przeniesienia pewnych informacji, które były używane przez JavaScript. Najczęściej spotykanym zabiegiem było używanie atrybutu `class` niezgodnie z jego przeznaczeniem. Innym pomysłem były sztuczne atrybuty niezglodne, ze standardami i specifikacją.

```html
<div id="example" class="box" position="left" order="1"></div>
```
Jedna z nowych funkcji w HTML5 pozwala na tworzenie dowolnych atrybutów dla naszych elementów. Jedyna zasada to wymagany przedrostek `data-`, który definiuje takie pojedyncze parametry.

```html
<div id="example" class="box" data-position="left" data-order="1"></div>
```

Parametry `position` oraz `order` są dostępne dla elementu zarówno w JS, jak i CSS. Możliwości duże, przykłady użycia to tylko wyobraźnia.

TODO maybe join with getting atribute examples on JS and CSS

```
ar el = document.getElementById('wrapper');
undefined
el
<div id=​"wrapper" class=​"html5">​…​</div>​
el.setAttribute('data-order', 5)
undefined
el
<div id=​"wrapper" class=​"html5" data-order=​"5">​…​</div>​
el.getAttribute('data-order')
"5"
```
