op# HAML

- Templating mechanism
- Replacement for ERB
- Attempt to reduce template code
- Easier to see structure
- DRYer
- No closing tags!
- Nesting with whitespace (not tabs)

===

# ERB to HAML

```
 <section class="container">
    <h1><%= post.title %></h1>
    <h2><%= post.subtitle %></h2>
    <div class="content">
      <%= post.content %>
    </div>
  </section>
```

```
 %section.container
    %h1= post.title
    %h2= post.subtitle
    .content
      = post.content
```

===

# Create HTML Elements with %

```
%div
    %ul
      %li
        Apple
      %li
        Pear
      %li
        Strawberry
```

```
 <div>
    <ul>
      <li>Apple</li>
      <li>Pear</li>
      <li>Strawberry</li>
    </ul>
  </div>
```

# Attributes with a hash

```
%a{ href: 'http://www.generalassemb.ly',
    target: '_blank'}
  General Assembly
```

```
<a href="http://www.generalassemb.ly"
  target="_blank">
    General Assembly
  </a>
```

===

# Ruby attributes are mapped to data attributes automatically

```
 %a{:href=>"/posts",
     :data => {:author_id => 123}}
    Posts By Author
```

```
 <a data-author-id='123' href='/posts'>
    Posts By Author
  </a>
```

===

# CSS Selectors
<div> is the default element, CSS transferred through
```
 #content
    .section
      Cool beans!
```

```
  <div id='content'>
    <div class='section'>
      Cool beans!
    </div>
  </div>
```

===

# Ruby Evaluation

```
.example
    = ["turkey", "dinner"].join(" ").upcase
```

```
<div class="example">
  TURKEY DINNER
</div>
```

===

# Ruby Processing

Ruby code after the minus sign (-) is interpreted, but not put in the page

```
 - @fruits = %w(apple pear)
  %ul.example
    - @fruits.each do |fruit|
      %li=fruit
```

```
  <ul class='example'>
    <li>
      apple
    </li>
    <li>
      pear
    </li>
  </ul>
```

# String Interpolation

```
.posted-at
    Posted on #{ p.created_at }
```

```
  <div class="posted-at">
    Posted on 2013-05-27
  </div>
```

# Filters

```
 :javascript
    function doStuff() {
      // Something amazing
    }
```

```
  <script>
    function doStuff() {
      // Something amazing
    }
  </script>
```

===

# Resources

- [HAML](http://haml.info/)
- [Rails Apps Guides](http://railsapps.github.io/rails-haml.html)
