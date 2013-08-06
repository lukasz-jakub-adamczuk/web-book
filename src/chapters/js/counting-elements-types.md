
## Liczenie elementów DOM według typu

...

Ile różnych zawiera nasza strona?

```javascript
var all = document.getElementsByTagName('*');
var types = {};
for (var i = all.length; i--;) {
	if (all[i].tagName in types) {
		types[all[i].tagName]++;
	} else {
		types[all[i].tagName] = 1;
	}
}
console.log('All elements:    ' + all.length);
console.log('  tags:          ' + types);

var sortable = [];
for (var tag in types) {
	sortable.push([tag, types[tag]]);
}
sortable.sort(function(a, b) {return a[1] - b[1]});
```
