
## Rzutowanie zmiennych

Zachowaujemy ostrożność podczas rzutowanie zmiennych poprzez funkcję `parseInt`. Funkcja nie wymaga podstawy systemu liczbowego na jaki przetwarzamy pierwszy argument. Dla naszej wygody stara się o określenie podstawy systemu na podstawie przetwarzanego ciągu.

```javascript
parseInt('010');
```

Pozostaje tylko pytanie, czym jest dla nas `'010'`, które rzutujemy na liczbę całkowitą. W systemie dzięsiętnym odpowiedź jest bardzo prosta, ale dla mnie ta liczba wygląda jak system ósemkowy.

```javascript
parseInt('010');
>>> 10
```

Jak się okazuje konsola Google Chrome przedstawia wynika jako `10`, jeśli nie określimy podstawy systemu liczbowego.

```javascript
parseInt('010', 10);
>>> 10
parseInt('010', 8);
>>> 8
```

Spodziewane wyniki dostaniemy podczas rzutowania z określonymi podstawami systemu.

```javascript
parseInt(010);
>>> 8
```

Jednak najciekawszy wynik mamy prze agumenci `010`, który w rzeczywiści jest wartością w systemie ósemkowym. Nasza sytuacja komplikuje się bardziej, gdyż `010` nie jest ciągiem znakowym, zatem także prawidłowym argumentem funkcji.

```javascript
> typeof 010
  "number"
```

