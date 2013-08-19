
## Wsparcie dla mediów

<audio> + <video>

Previously, to embed an audio or video file on web page we have to rely on third party plugin like Flash through <object> and <embed> tags. To view the media, user requires administrator privileges to install this plugin as well as the browser has to be able to support this plugin.

```html
<object width="400" height="300">
   <param name="movie" value="video.mp4" />
   ...
   <embed src="video.mp4" type="application/x-shockwave-flash" ... ></embed>
</object>
```

HTML5 now introduces a new way to embed media via the <audio> and <video> tags. With HTML5, at least we don’t have to worry about plugins problem. But for the time being, not all browsers but most recent version of browsers offer support for HTML5 <audio> and <video> tags.

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

translate
