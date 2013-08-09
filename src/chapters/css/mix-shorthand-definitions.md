
## Połącz razem wiele skrótów i wartości definicji

Nieustanna optymalizacja naszych stylów, prowadzi czasami do trudnych w odnalezieniu błędów. Nadpisywanie właściwości skrótowych jest dobrym rozwiązanie, bo często zaoszczędzamy kilka znaków w naszych stylach.

Bardzo rzadko zdarza się, aby style wymagały czterech różnych kolorów obramowania, ale jeśli tak jest pozostaje tylko właściwe kodowanie.

```css
div {
	border-top: 1px solid #f00;
	border-right: 1px solid #0f0;
	border-bottom: 1px solid #00f;
	border-left: 1px solid #aaa;
}
```

W tym wypadku mamy również szerokie możliwości optymalizacji. Przykład o tyle niefortunny, bo domyślne wartości obramowania to szerokości 1 piksela i linia ciągła.

```css
div {
	border-color: #f00 #0f0 #00f #aaa;
}
```

Zatem wystarczyłoby samo zdefiniowanie samych kolorów. O ile mniej kodu. Szybko i czytelnie.

Jeśli nadpisujemy pojedyncze właściwości lub style, przeważnie lepsze jest zdefiniowanie tego samego raz i odpowiednie nadpisanie reguły.

