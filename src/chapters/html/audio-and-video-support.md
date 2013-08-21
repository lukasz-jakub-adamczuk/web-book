
## Wsparcie dla mediów

Wcześniej, osadzanie materiałów audiowizualnych na stronach było skomplikowane. Często wymagało korzystania z zewnętrznych bibliotek, używania technologii Flash lub znaczników `<embed>`. Dostęp do takich mediów potrzebował wtyczek w przeglądarce, a te znowu uprawnień administratora, by zostały zainstalowane.

```html
<object width="400" height="300">
   <param name="movie" value="video.mp4" />
   ...
   <embed src="video.mp4" type="application/x-shockwave-flash" ... ></embed>
</object>
```

Nareszcie HTML5 pozwala na łatwe osadzenie mediów przez znaczniki `<audio>` i `<video>`. Przynajmniej pozbywamy się potrzeby instalowania wtyczki, choć inny problem to różne wsparcie opisanych znaczników przez przeglądarki.

```html
<audio controls="controls">
   <source src="audio.mp3" type="audio/mp3" />
   <source src="audio.ogg" type="audio/ogg" />
   Your browser does not support the <audio> tag.
</audio>
```

```html
<video controls="controls" width="400" height="300">
   <source src="movie.mp4" type="audio/mp4" />
   <source src="media.ogg" type="audio/ogg" />
   Your browser does not support the <video> tag.
</audio>
```

Wszystkie nowoczeszne przeglądarki wspierają elementy `audio` i `video`, w tym Internet Explorer 9+.
