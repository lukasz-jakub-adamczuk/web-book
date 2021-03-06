
## Obrotowy link

HTML5 i CSS3 pojawiają się w aplikacjach i serwisach internetowych coraz częściej. Nie dziwi to ani trochę, skoro producenci przeglądarek wspierają coraz więcej standardów sieciowych w kolejnych wydaniach swoich produktów. Jak zwykle podczas poszukiwań inspiracji w sieci znalazłem ciekawy przykład wykorzystania nowych właściwości stylów kaskadowych.

Roll Link to przykład obrotowego linka, którego animacja opiera się na wykorzystaniu transformacji oraz atrybutów typu data. Serwis Webdesigner Depot prezentuje łącza w taki sposób w swoich artykułach.

### Analiza rozwiązania

Struktura takiego rozwiązania jest nieskomplikowana choć na pierwszy rzut oka, element span wydaje się nadmiarowy.

```html
<a href="some-url.html">
    <span data-title="Some text">Some text</span>
</a>
```

Nic bardziej mylnego. Wprawdzie do tego celu wykorzystać pseudo-elementy ::before i ::after, ale ich wsparcie jest dyskusyjne. Inna sprawa, że jak nie działa generated content to z dużą dozą prawdopodobieństwa nie działają także transformacje CSS.

Kształt całego rozwiązania stanowią odpowiednie style, podstawowe dla tagów a i span.

```css
/* ROLL LINKS */
.roll-link {
    color: #DD4D42;
    font-weight: bold;
    text-decoration: none;
    word-wrap: break-word;

    display: inline-block;
    overflow: hidden;

    vertical-align: top;

    -webkit-perspective: 600px;
       -moz-perspective: 600px;
       -ms-perspective: 600px;
       perspective: 600px;

    -webkit-perspective-origin: 50% 50%;
       -moz-perspective-origin: 50% 50%;
       -ms-perspective-origin: 50% 50%;
       perspective-origin: 50% 50%;
}

.roll-link:hover {
    text-decoration:none;
}
```

Klasa `.roll-link` stanowi zasady dla naszych obrotowych linków. Poza podstawowymi i bardzo dobrze znanymi, jak kolor, grubość tekstu określono kilka kilka innych. Sposób wyświetlania jako liniowo-blokowy oraz najważniejsze, perspective i perspective-origin.

Problem stanowi brak pełnego wsparcia dla tych właściwości CSS3, ale prefiksy działają. Poza tym obie właściwości wpierają tylko transformacje 3d, więc występują razem.

```css
.roll-link span {
    display: block;
    position: relative;
    padding: 0 2px;

    -webkit-transition: all 400ms ease;
       -moz-transition: all 400ms ease;
       -ms-transition: all 400ms ease;
       transition: all 400ms ease;

    -webkit-transform-origin: 50% 0%;
       -moz-transform-origin: 50% 0%;
       -ms-transform-origin: 50% 0%;
       transform-origin: 50% 0%;

    -webkit-transform-style: preserve-3d;
       -moz-transform-style: preserve-3d;
       -ms-transform-style: preserve-3d;
       transform-style: preserve-3d;
}
.roll-link:hover span {
    background: #DD4D42;

    -webkit-transform: translate3d( 0px, 0px, -30px ) rotateX( 90deg );
       -moz-transform: translate3d( 0px, 0px, -30px ) rotateX( 90deg );
       -ms-transform: translate3d( 0px, 0px, -30px ) rotateX( 90deg );
       transform: translate3d( 0px, 0px, -30px ) rotateX( 90deg );
}
```

Element span jest dzieckiem znacznika a, a jednocześnie pojemnikiem dla generowanego automatycznie pseudo elementu `:after`. Przejście ease elementu span następuje w momencie pojawienia się kursora myszy nad linkiem. Wówczas po 400ms zmienia się także kolor tła elementu.

```css
.roll-link span:after {
    content: attr(data-title);

    display: block;
    position: absolute;
    left: 0;
    top: 0;
    padding: 0 2px;

    color: #fff;
    background: #DD4D42;

    -webkit-transform-origin: 50% 0%;
       -moz-transform-origin: 50% 0%;
       -ms-transform-origin: 50% 0%;
       transform-origin: 50% 0%;

    -webkit-transform: translate3d( 0px, 105%, 0px ) rotateX( -90deg );
       -moz-transform: translate3d( 0px, 105%, 0px ) rotateX( -90deg );
       -ms-transform: translate3d( 0px, 105%, 0px ) rotateX( -90deg );
       transform: translate3d( 0px, 105%, 0px ) rotateX( -90deg );
}
```

Jeszcze większa magia dotyczy pseudo-elementu wstawianego po znaczniku span. Ten znowu pozycjonowany jest absolutnie względem rodzica, a jego zawartość wykorzystuje atrybut data-title.

### Podsumowanie

Oto prosty sposób wykorzystania transformacji 3d w celu osiągnięcia interesującego efektu. Pewien problem stanowi jeszcze odpowiednie wsparcie przez nowoczesne, nie mówiąc o wszystkich przeglądarkach. Jeśli taki efekt nie stanowi kluczowego mechanizmu strony ani uniemożliwia korzystania ze strony w starszych będzie traktowany jako dodatkowy krok w kierunku przyszłości i ukłon w stronę użytkowników korzystających z nowoczesnych przeglądarek.

