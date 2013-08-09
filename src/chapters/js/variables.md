
## Zmienne

Brak instrukcji `var` przed nazwą zmiennej tworzy w JavaScript zmienną o zasięgu globalnym. Nie zawsze tego chcemy.

```javascript
var name     = "John";
var fullname = "Doe";
```

Jednak wielokrotne użyci instrukcji `var` wcale nie jest najlepszym sposobem na tworzenie zmiennych o mniejszym zasięgu. Możliwe jest zadeklarowanie wszystkich zmiennych, których potrzebujemy w danym momencie.

```javascript
var name = "John",
    fullname = "Doe";
```

Co lepsze. Dostępna jest także inicjalizacja zmiennych.


TODO compose with hoisting...

