
## Referencje do obiektów DOM

Doskonale wiemy, że większość jeśli nie wszystkie operacje DOM są wolne. Zatem jeśli planujemy odwoływanie się do DOM więcej niż jeden raz, stwórzmy odpowiednią referecję.

```javascript
document.getElementById('nav').className = 'test';
document.getElementById('nav').setAttribute('display', 'block');
```

Nasz dodatkowy obiekt pozwoli na bezpośdernie odwołanie do elementu, bez konieczności szukania go w drzewie DOM.

```javascript
var obj = document.getElementById('nav');
	obj.className = 'test';
	obj.setAttribute('display', 'block');
```

Dodatkowa zmienna i określone instrukcje będą zawsze szybsze niż tuzin wywołań `getElementById`.

