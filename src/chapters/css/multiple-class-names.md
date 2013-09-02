
## Klasy wielokrotne

You can assign multiple class names to an element. This allows you to write several rules that define different properties, and only apply them as needed. Let’s assume you’re marking up an image gallery that contains some images that are royalty free and some that are not. There may also be a special offer on some images. Here’s the markup for three images:

```html
<img src="foo.gif" class="special" alt="" />
<img src="bar.gif" class="royaltyfree" alt="" />
<img src="baz.gif" class="royaltyfree special" alt="" />
```

To style the images that are royalty free to make them differ from the others you can make a rule for elements that have a class name of royaltyfree, and if you want the images with a special offer to stand out a bit you can use the special class to make a CSS rule for that.

The CSS could then look something like this:

```css
.royaltyfree {
	border: 2px solid #666;
}
.special {
	padding: 2px;
	background: #ff0;
}
```

Any images that have a class name of special will have a padding and a yellow background. Images that have a class name of royaltyfree will have a border, and those that have both class names will have a border, a padding, and a yellow background.

You can take this much further – this is just a simple example. And do try to use semantic class names that describe what an element is or does rather than what it looks like.
