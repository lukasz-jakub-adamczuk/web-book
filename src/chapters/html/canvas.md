
## Element `canvas`

Jedną z najciekawszych funkcji udostępnionych przez HTML5 jest znacznik `<canvas>`, który oferuje generowanie dwuwymiarowych kształtów lub grafiki przy wsparciu JavaScriptu. HTML5 Canvas pozwala praktycznie na tworzenie animacji.

Poniższy kod generuje płótno, na których rysowany jest zielony kwardrat.

```html
<canvas id="canvas" width="200" height="200"></canvas>
<script>
   var c=document.getElementById("canvas");
   var ctx=c.getContext("2d");
   ctx.fillStyle="#00ff00";
   ctx.fillRect(0,0,100,100);
</script>
```
