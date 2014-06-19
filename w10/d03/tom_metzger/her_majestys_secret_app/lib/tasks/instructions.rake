namespace :instructions do
  desc "Morning instructions"
  task :morning do
    puts <<-INSTRUCTIONS
    =====================================================================
    Good morning 007,

    First we're going to work on using underscore.js to solve some problems.

    Create a new branch called `underscore`
    Look in `spec/javascripts/underscore_films_spec.js`
    Write your passing code in `app/assets/javascripts/underscore_films.js`
    Commit and push the underscore branch and issue a pull request.

    Then we're going to transfer that to Backbone and note the changes.
    Create a new branch called `backbone`

    Look in `spec/javascripts/backbone_films_spec.js`
    Remove the `x` from `xdescribe` to activate the tests.
    Write your passing code in `app/assets/javascripts/collections/films.js`
    Commit and push the backbone branch and issue a pull request.

    =====================================================================
    INSTRUCTIONS
  end
end
