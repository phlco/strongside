# Week 11 Day 2
## HW: Git Fit - Continued

### Create a New Workout Button

When you click New Workout, navigate the router's path to `/exercises/new`

Make a new Backbone view that has a form with: text inputs for the new Exercise's `name` and `calories`,  a select box for the difficulty level (with values between 1 and 3) and a button to submit the form with the text "Create New Exercise".

When you click `Create New Exercise` add a new model to your collection and navigate back to the index

The view should reflect your changes.

### Remove Exercises
Display x's next to each Exercise's name. When you click on an X, remove the Exercise from the view and your database.

### Create a new Random Workout Button
When you click on Random Workout navigate to `/exercises/workout` and display a Workout View that lists 3 random exercises and their total calories.

# Extra
### Create a workout
Clicking on Exercises adds them to a Workout. Click save to save a workout to your database.

### Workouts
Workouts have many exercises
Create a regular rails View to list workouts

Create capybara tests