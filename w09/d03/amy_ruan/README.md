
###Write tests for the following methods:

When you initialize a new Scraper it takes a `url` as a parameter.

`get_hrefs` should use nokogiri to return an array of all the links on a page.

```
# example
["http://www.google.com", "http://www.aol.com"]
```

`get_images` should use nokogiri to return an array of all the images on a page.

```
# example
["http://www.cnn.com/images/logo.jpg", "http://www.cnn.com/images/breaking.png"]
```


###Create a `scraper_controller`

`scraper#index` renders a page with two buttons:

- list links
- list pictures

When you click on `list links` it should perform an ajax request to `scraper#links` and use `scraper.get_hrefs` to send back an array of links from the front page of the New York Times.

When you click on `list pictures` it should perform an ajax request to `scraper#pictures` and use `scraper.get_images` to send back an array of images from the front page of the New York Times.

### Initialize a new git repository and push to github