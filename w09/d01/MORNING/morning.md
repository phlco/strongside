Week 9

# Morning Exercise: My heart will go on

Let's learn about Nokogiri and Page Scraping

Nokogiri is a ruby gem that parses HTML and creates node elements, just like the DOM.  Scraping is useful for sites that don't offer APIs of their data.

To use

```
require 'nokogiri'
require 'httparty'
```

then 

```
url = 'https://generalassemb.ly/'
response = HTTParty.get(url)
doc = Nokogiri::HTML(response)
```

We can use CSS selectors to target nodes, just like jQuery.

```
#Select all the `p` tags and print out their text content
doc.css('p').each do |p|
  puts p.content
end
```

```
// equivalent in jQuery
$('p').each(function(i, el){
  console.log($(el).text())
})
```

```
# selects every anchor tag that's a child of the class .stacked-product-list
doc.css('.stacked-product-list a').each do |link|
    puts link.get_attribute('href')
end
```

```
// equivalent in jQuery
$('.stacked-product-list a').each(function(i, el){ 
  console.log($(e).attr('href'))
})

```

# What to do

Create a new rails app called `carpathia_app`

Create a new rake task inside of `lib/tasks` called `scrape.rake`

You're going to scrape the `encyclopedia-titanica` for the names, ages, and travel_classes of the passengers of the Titanic.

```
first_class = "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/"
second_class = "http://www.encyclopedia-titanica.org/titanic-second-class-passengers/"
third_class = "http://www.encyclopedia-titanica.org/titanic-third-class-passengers/"
```

Create a `users` table in your database to save `name`, `age` and `travel_class` of each passenger list.

__Drill down in the HTML__

__Be sure to correct the name formatting__

```
YOUNG, Miss Marie Grice
#=> Miss Marie Grice Young
```

When you're done, create a route to `welcome#index` that displays a `dropdown list` of the three `travel_classes` and a button.

When you select a travel class and click on the button, use `ajax` to append a random passenger from that `travel_class` to the DOM.

# resources
- [nokogiri gem](http://nokogiri.org/)
- [nokogiri cheatsheet](https://github.com/sparklemotion/nokogiri/wiki/Cheat-sheet)
- [css selectors](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started/Selectors)
- [attribute selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors)
- [rake tasks](http://jasonseifer.com/2010/04/06/rake-tutorial)