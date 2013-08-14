
## Przechowuj selektory

Dobrze wiesz, że operacje przeszukiwania DOM są wolne. Jeśli planujesz wykorzystanie danych selektorów więcej niż jeden raz, zapisz je do konkretnych zmiennych.

```javascript
document.getElementById('wrapper');
```

Zmienna `wrapper` ogranicza kosztowne operacje na drzewie DOM.

```javascript
var wrapper = document.getElementById('wrapper');
```

Teraz, gdy przyjdzie potrzeba modyfikacji lub ponownego znalezienia elementu `#wrapper` istnieje referencja do niego.