
## Nowe semantyczne znaczniki

Strony napisane w XHTML miały pewne problemy z tworzeniem semantycznej struktury. Wielu programistów nadużywało znaczników `div`, a także atrybutów `class`. Najczęściej objawiało się to bardzo podobny sposób.

```html
<div id="header">
    ...
</div>
<div id="nav">
    <ul>...</ul>
</div>
<div id="footer">
    ...
</div>
```

 HTML5 dostarcza nowe, semantyczne znaczniki, które pozwalają na ogranicznie podobnych sytuacji. Dzięki temu struktura dokumentu jest lżejsza i czytelniejsza. Jednocześnie pisanie stylów CSS staje się elastyczniesze.

```html
<header>
    ...
</header>
<nav>
    <ul>...</ul>
</nav>
<footer>
    ...
</footer>
```

Elementy grupujące `header`, `nav` oraz `footer` to tylko niektóre z nowych znaczników, które dostarcza HTML5. Najważniejsze, jest zrozumienie ich właściwego przeznacznia i stosowanie w odpowiednich przypadkach.
