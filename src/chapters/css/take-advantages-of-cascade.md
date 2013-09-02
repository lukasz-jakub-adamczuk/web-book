
## Skorzystaj z zalet kaskady

Kaskada to jedna z wielu zalet CSS, która pozwala na określenie wielu reguł dla elementu. Możliwe jest ponowne definiowanie wartości stylów lub ustawienie tylko dodatkowych. Mamy przykładowy paragraf:

```html
<p class="update">Update: Lorem ipsum dolor set</p>
```

CSS umożliwia rozdzielenie właściwości wspólnych dla wszystkich paragrafów, ale także dla wybranych z klasą `update`.

```css
p {
	margin: 1em 0;
	font-size: 1em;
	color: #333;
}
.update {
	font-weight: bold;
	color: #600;
}
```

Przeglądarka określi wygląd elementu na podstawie obu reguł. Jednak kolor czcionki zostanie wykorzystany z drugiego zestawu reguł, ponieważ selektor klasy ma wyższy priorytet niż selektor elementu. Wartość marginesu i rozmiaru czcionki zostaną pobrane z definicji paragrafu.

Zrozumienie sposobu [obliczania ważności selektorów](http://www.w3.org/TR/CSS21/cascade.html#specificity) jest bardzo ważne dla pisania wydajnych arkuszy stylów kaskadowych.
