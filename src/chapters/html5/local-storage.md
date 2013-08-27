
## Local Storage

Protokół HTTP jest bezstanowy, dlatego przechowywanie określonych informacji pomiędzy kolejnymi żądaniami jest kłopotliwe. Dostępny jest mechanizm sesji, który przez określony czas pamięta dane. Możliwe jest zachowanie informacji w plikach Cookie, których rozmiar jest jednak ograniczony do 4kB.

HTML5 daję o wiele szersze możliwości poprzez implamentację Storage. Taki lokalny pojemnik przechowuje dane nawet po odświeżeniu lub zamknięciu przeglądarki, a dodatkowo jego wielkość wynosi do 5MB dla domeny.

Mechanizm localStorage w odróżnieniu od Cookies nie przesyła danych z każdym żądaniem do serwera. Niestety nie działa każdej przegądarce, ale w większości nowoczesnych. Internet Explorer wspiera localStorage od wersji ósmej.

Zanim zdecydujesz się na używanie localStoarage sprawdź czy Twoja przeglądarka wspiera daną funkcjonalność.

```js
if !!('localStorage' in window) {
	// localStorage available
}
```
