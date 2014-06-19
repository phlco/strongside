# After you finish watchin ght video

1. Partner up
2. Instead of relying on his heroku app, build a JSON api with rails that your application communicates with instead of using that guy's heroku application.

You will need to change this:

```
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :allow_cross_domain_access
  def allow_cross_domain_access
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "GET, PUT, POST, DELETE"
  end

end
```



3. Refactor your code i nto a rails application that looks like this: [link](https://github.com/ga-students/WDI_NYC_Hash_Work/tree/master/w10/d02/~INSTRUCTORS/users), specifially look at 
	a. application.html.erb
		- specfically note
	b. app/assets/javascripts
	
4. Refactor your templates into handlebars templates
	
4. Build a new backbone / rails application for the candy machine that mirrors the above application
[Things you may care about in a vending machine](https://github.com/ga-students/WDI_NYC_Hash_Work/blob/master/w09/d04/_ASSIGNMENT_FILES/candy.md)
	
- has the same 2 views
		- an index view for all the candy machines
		- a new / edit view for a single candy machine
	- add a couple more buttons
		- in both the index and edit views, add the buttons
			- that allow you to refill your candy machine
			- add a button to purchase candy
			- add a button to remove all the money from the candy machine
			- (NOTE: we do NOT care about the owner)
			- make sure that these buttons reflect the changes in the database
			- HINT:
				- it is easier to make these methods in the Rails model than it is to manually .set things in the javascript code.
