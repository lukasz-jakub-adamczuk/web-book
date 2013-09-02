
## Wartości domyślne

Często możliwe jest pominięcie wartości dla pewnych właściwości poprzez wykorzystanie wartości domyślnych. Ma to duże znaczenie, kiedy definujemy właściwości w sposób skrótowy. Wówczas jakiekolwiek nieustawione wartości zostaną ustawione przez wartości domyślne. Przykładowo `0` dla dopełnienia, `transparent` dla koloru tła.

Ponieważ istnieją różnice pomiędzy wartościami domyślnymi w przeglądarkach, dobrym rozwiązanie jest wyzerowanie wybranych właściwości, przykładowo marginesu i dopełnienia.

```css
* {
	margin: 0;
	padding: 0;
}
```
