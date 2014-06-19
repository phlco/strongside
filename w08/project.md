# SECOND PROJECT OUTLINE

## PURPOSE

1. **Collaboration!**
   * Working as a member of a TEAM
   * Giving meaningful feedback on team members' work
   * Using Git for version control and GitHub for integrating work
   
2. **Agile Methodology**
	* Iterative development driven by meaningful User Stories
	* Integrating "user" (outside) advice into the development cycle
	* Working on ONE story at a time
	* Using a Scrum Board aka Pivotal Tracker to keep track of what work is being done and by whom
	* Daily Scrum / Stand up
	 
3. **Integrating the client-side and server-side of an application**
   * Working with multiple languages and libraries simultaneously
   * Learning about where to build logic (front-end or back-end)
   * Building software in an MVC manner that communicate via "interfaces" (ie, APIs)
   
## CORE REQUIREMENTS

These are the minimum requirements for your application. There is no getting around these, and you will not have approval to pitch a project that does not meet them. Meeting these requirements constitutes a Minimum Viable Product (MVP) for Friday.

#### 0. HEAVILY INCORPORATES RAILS & JAVASCRIPT

The application must have an API that will be consumed by your javascript app via ajax.

#### 1. THE APPLICATION IS DEPLOYED

The application will be deployed on Heroku and accessed on the Internet.

#### 2. THE APPLICATION HAS USER LOGIN AND AUTHORIZATION

The application needs to handle user login and sign up, and have more than one level of authorization (ie, roles). The simplest format for this is to implement both User and Admin roles for your application.

#### 3. THE APPLICATION PERSISTS DATA IN TABLES

There must be some form of data that is persisted on the server side. This need not be the focus of the application (for example, if the application pulls data from a third-party API or website and displays it), but it needs to both make sense for the purpose of the application AND not be stored in the user tables solely. There should be, at least, three tables for your application.

#### 4. THE APPLICATION HANDLES INVALID INPUT

Forms in your application should validate data on both the client-side with JavaScript and again on the back-end with Rails. Check data types, string lengths, formats, etc. Ensure that the data that is sent to the server or read from the server is meaningful and correctly formatted.

#### 5. THE APPLICATION IS DOCUMENTED

* ***README*** at the base of your GitHub repo for people looking at your code. Describe the project, the purpose, and an outline of how to read your repo.
* ***Splash Page*** and/or ***About Page(s)*** on your website, for users.

#### 6. WELL FORMATTED CODE

  * Best-practice Ruby style and JavaScript style (there are multiple style guides out there, but GitHub's is always good to follow: ([Ruby](https://github.com/styleguide/ruby), [JavaScript](https://github.com/airbnb/javascript))
  * INDENTATION!!!!!!!!!!!!!!!!!!
  * Comments where it will be useful to explain some bit of logic
  * Use `# TODO`s or `# FIXME`s to leave pertinent messages for team members or for future functionality

## TEAMS AND ROLES

You are a member of a team. We have created teams that we feel allow you to work with students you may not have had the chance to work with before, and in order to group students with complementary skill sets and approaches. Within your groups you should assign the following roles:

* **Project Manager**: Hosts the GitHub repo and deals with merging and deploying the team's codebase. Responsible for the README file and the consistency and formatting of the codebase (ie, for making each team member responsible for it :).
* **Design Lead**: Leads the wireframing and front-end development for your application. This person should not do ONLY front-end work. The "coding" should be evenly distributed among all teammates.

## TIMELINE

####This Weekend:

__Suggested Timeline__

##### Friday (D-8) 
- Teams meet in class to discuss their projects.
- The Project Manager should setup the Github repository add add the appropriate users to it.
- Create an empty rails application inside of your project
- Create a README.md file in the root of your repository
- Add the url of your github repository [to the Google spreadsheet with your group teams](https://docs.google.com/spreadsheet/ccc?key=0AggpMwEqzvVzdGs2eThHNmhidnJUVkc4NWhVczQ0Wmc&usp=drive_web#gid=10) in it.
	- You will be doing work in this Github repository over the weekend.
- Determine what project you are going to work on before you leave for class today and write a brief description in your README.md file.
- Star building out User Stories.
- # WRITE THE ABOVE OUT IN YOUR GROUP'S README.md



##### Saturday (D-7)
- Teams meet either in person or over Google Hangout / Skype to complete a *very granular* and *very specific* user stories. Write them down in your README.md as specified here:

```
Template:

	- As a Blank
	- I want to Blank
	- So that I can Blank
	
	[EMBED IMAGE HERE of SKETCH 1]
	
```

![image](http://i.d.cbsi.com/i/dl/media/dlimage/12/93/12/129312_large.jpeg)



```	
Example:
	
	1.
	- As an unauthenticated User
	- I want to go to yummy.com
	- So that I can see
		- a list of restaurants that I can eat in
		- a button to login
		- a button to signup
		
	[EMBED IMAGE HERE of SKETCH 1]
	![image](http://i.d.cbsi.com/i/dl/media/dlimage/12/93/12/129312_large.jpeg)

		
	2.
	- As an unauthenticated User
	- I want to click on the login button
	- so that I can see a signup form so that I can create an account and upon creation, it also automatically logs me in as well
	
	[EMBED IMAGE HERE of SKETCH 2]
	
	3.
	- As a now logged in User
	- I want to click on the restaurants button
	- so that I can see all the restaurants I bookmarked
	
	[EMBED IMAGE HERE of SKETCH 3]
```

- Write the above in your README.md

# WRITE THE ABOVE OUT IN YOUR GROUP'S README.md



##### Sunday (D-6)|
- Perhaps meeting with your group again either in person or on Google Hangout / Skype, using your FINISHED user stories and mockups as guides, determine:
- What your models are
- What your routes are
- Who is going to be doing what (very specifically, assign tasks to them)?
- What your super super minimal MVP is that will be deployed to Heroku on tuesday.
# WRITE THE ABOVE OUT IN YOUR GROUP'S README.md


####Next Week:
|Monday Morning (D-5)|Tuesday (D-4)|Wednesday (D-2) | Thursday (D-1) midnight | Friday (D-Day)
|:---|
|User stories, models, routes and all speced out. Tasks are assigned.|DEADLINE: MVP Initial website deployment to Heroku.||Focus on Styling.Coding ends.|Presentations and science fair.

#### Daily Schedule:

||Daily Schedule|
|:---|
|9 AM|SCRUM & SCRUM write-up
|Morning | Exercises & New Material
|Lunch
|Afternoon| Project Work


## Deliverables Summary

* **Proposal** (Due Monday Morning)
   * In your shared team github folder, create a README.md that has the following: 
   		* The description of the project
	    * User Stories
	   	* A list of libraries you expect to use.
   		* Defined team roles
   * User Stories (in Pivotal Tracker)
   * Data Model (simple [ERD](http://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model#Crow.27s_Foot_Notation) format)
   * Wireframes

* **SCRUM Notes** (From every morning M-Th)
	* What happened yesterday?
    * Which user stories are to be completed today?
    * Any obstacles/blocks for today's stories?

* **Final Deliverables** (Due Next Friday)
	* Link to Github Repo
	* Link to Heroku App


## PRESENTATION

* You will present, as a group. You will present to us, the instructors, and we may invite other GA staff or instructors to take part.
* Presentation will consisit of a 3 minute demo followed by 5 - 10 minutes of questions from the instructor panel. You will be asked about the software design and implementation decisions you made, so  be prepared to defend them : )!
* **You will not present on your computer. You will present on either a MacBook running Chrome ** Which of thee two platforms you present on will be random.

## GOOD EFFORT!
