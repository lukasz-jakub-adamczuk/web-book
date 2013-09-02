
## Pomiń znacznik dla selektorów identyfikatora i klasy

Pisanie selektorów, które wskazują na elementy z atrybutem klasy lub identyfikatora nie wymagają określenia znacznika elementu. Zatem zamiast pisania

```css
div#content { ... }
fieldset.details { ... }
```

napisz po poprostu

```css
#content { ... }
.details { ... }
```

Plusem takiego rozwiązania są lżejsze arkusze. Dodatkowo w przypadku zmiany samego elementu w strukturze, reguły będą działały dalej, a ich dopasywanie będzie szybsze. Szczególnie ważne jest to dla selektora identyfikatora, który jest unikalny w dokumencie. Klasy są używane wielokrotnie, dając określony wygląd elementom. Nadanie tej samej klasy innemu elementowi będzie niemożliwe przy określeniu znacznika w regułach CSS.

Zachowaj ostrożność przy pisaniu reguł, ponieważ ich aplikowanie działa według określonego priorytetu.
