# Homework Week 10 Day 1

## Backbone Todo List

## Work in your personal folder

- Create an index.html file
- create an app.js file
- download the jQuery, underscore.js and backbone.js libraries and include the scripts in your index.html in this order:
  1. jQuery
  2. underscore
  3. backbone
  4. app.js

  ### index.html

```html
 <section id="todoapp">
    <header id="header">
      <h1>Todos</h1>
      <input id="new-todo" placeholder="What needs to be done?">
    </header>
    <section id="main">
      <ul id="todo-list"></ul>
    </section>
  </section>
```

### AppView
In your app.js file, create a new Backbone view, called `AppView`.

AppView's `el` property should be `#todoapp`

Add an `events` property within AppView, to listen for a `keypress` on the `#new-todo` element, and call the function `createNewTodo`

Define AppView's createNewTodo function, and within this function:

- You're going to need access to the event within the function, so define it like so: `createNewTodo: function(e)`
- find out which key was pressed using `e.which`
    - Use a conditional statement to check if it is the enter key that was pressed (google the keyCode for enter key!), and if `#new-todo` is not blank:
        - Grab the value of the `#new-todo` input
        - create a new `<li>` tag, set its text value to the text from `#new-todo`, and append it to `#todo-list`.

### After defining AppView, you will need to create an instance of it to initialize

```js
var appView = new AppView();
```






