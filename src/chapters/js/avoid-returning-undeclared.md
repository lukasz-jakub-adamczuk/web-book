
## Unikaj zwrcania niezdefiniowanych zmiennych w funkcji

Pamiętasz doskonale, że JavaScript przechowuje zmienne z określonym zasięgiem. Globalny zasięg zmiennych to ostatnia rzecz jakiej potrzebujemy.

```javascript
function sum(a, b) {
    r = a + b;
    return r;
}
```

Dokładnie to dzieje się w powyższym przykładzie. Funkcja zwraca sumę dwóch liczb, jednak nie deklaruje zmiennej. Jeśli użyjemy `var` w funkcji to zadeklarujemy dodatkową zmienną, ale przez to nie będzie ona przechowywana w zasięgu globalnym.

```javascript
function sum(a, b) {
    var r = a + b;
    return r;
}
```

Nie każdy przypadek jest równie prosty, jednak zmienne lokalne są bezpieczniejsze niż globalne. Nasz kod będzie jeszcze lepszy, gdy od razu zwrócimy sumę argumentów.

```javascript
function sum(a, b) {
    return a + b;
}
```
