
## Używaj selektora potomka

Selektor potomka jest jednym z najpopularniejszych selektorów, jednak jego optymalne użycie wymaga nieco doświadczenia. Kod początkujących autorów CSS często jest mało wydajny i wygląda podobnie jak poniżej. Opowiednie zastosowanie selektora potomka ogranicza złożoność selektora, która wpływa na końcową szybkość dopoasowania reguły.

```html
<div id="subnav">
	<ul>
		<li class="subnavitem">
			<a href="#" class="subnavitem">Item 1</a>
		</li>
		<li class="subnavitemselected">
			<a href="#" class="subnavitemselected">Item 2</a>
		</li>
		<li class="subnavitem">
			<a href="#" class="subnavitem">Item 3</a>
		</li>
	</ul>
</div>
```

Dla powyższej stuktury zostały napisane takie style CSS:

```css
div#subnav ul { ... }
div#subnav ul li.subnavitem { ... }
div#subnav ul li.subnavitem a.subnavitem { ... }
div#subnav ul li.subnavitemselected { ... }
div#subnav ul li.subnavitemselected a.subnavitemselected { ... }
```

Omawiana struktura będzie bardziej przejrzysta, kiedy zrezygnujemy z niektórych znaczników i atrybutów.

```html
<ul id="subnav">
	<li>
		<a href="#">Item 1</a>
	</li>
	<li class="sel">
		<a href="#">Item 2</a>
	</li>
	<li>
		<a href="#">Item 3</a>
	</li>
</ul>
```

Poniżej odpowiednie, zmodyfikowane reguły:

```css
#subnav { ... }
#subnav li { ... }
#subnav a { ... }
#subnav .sel { ... }
#subnav .sel a { ... }
```

Utrzymywanie, zarówno struktury dokumentu jak i stylów w prostej formie, przekłada się na wydajniejszy i czytelniejszy kod.
