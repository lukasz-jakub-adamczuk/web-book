
## Opóźnienie

Nie każdy wie, że pierwszy argument funkcji `setTimeout`, ale także `setInterval` nie musi być ciągiem znakowym. Taka sytuacja pozwala na wiele elastyczniejsze użycie funkcji.

```javascript
setTimeout('loop()', 1000);
```

Jednak zamiast wywołania funkcji przekażemy jej ciało.

```javascript
setTimeout(loop, 1000);
```

Wyobraź sobie konieczność przesłania argumentu do naszej metody, czasem nawet wielokrotnego przesłania. Takie zmienne tracą zasięg (poza zmiennymi globalnymi).

```javascript
setTimeout('loop(counter)', 1000);
```

Istnieje dobry sposób rozwiązania tego problemu, czyli funkcja anonimowa.

```javascript
setTimeout(function() { loop(counter); }, 1000);
```
