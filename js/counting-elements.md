Liczenie elementów DOM

Optymalizacja kodu lub poszukiwanie błędów wymaga od programistów sprawnego poruszania się
w modelu obiektowym. Odnalezienie elementu od danym identyfikatorze czy klasie nie jest wcale trudne,
ale tak prozaiczne czynności często nie wystarczają do rozwiązania problemu.

Ile elementów zawiera nasza strona?

var all = document.getElementsByTagName("*");
var ids = 0, classes = 0;
for (var i = all.length; i--;) { if (all[i].id !== '') ids++; if (all[i].className !== '') classes++; }
'all: ' + all.length + ', ids: ' + ids + ', classes: ' + classes;
