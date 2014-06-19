# Homework Week 9 Day 1

## Pt 1 - Finish today's mail item assignment

## Pt 2 - Grade School

Write a small archiving program that stores students along with the grade that they are in.

Write tests first!!!

```
school = School.new("Hippy Dippy School")
```

If no students have been added, the db should be empty:

```
school.db
# => {}
```

When you add a student, they get added to the correct grade.

```
school.add("James", 2)
school.db
# => {2 => ["James"]}
```

You can add several students to the same grade, and students to different grades.

```
school.add("Phil", 2)
school.add("Jennifer", 3)
school.add("Little Billy", 1)
school.db
# => {2 => ["James", "Blair"], 3 => ["Jennifer"], 1 => ["Little Billy"]}
```

Also, you can ask for all the students in a single grade:

```
school.grade(2)
# => ["James", "Blair"]
```

You should be able to get a sorted list of all the students. Grades are sorted in descending order numerically, and the students within them are sorted in ascending order alphabetically.

```
school.sort
# => {1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"]}
```

## Pt 3 - Sign up for [Travis-CI](http://travis-ci.org)

## Bonus!

### Read through the [http://betterspecs.org/](http://betterspecs.org) site, and use what you learn to improve your tests for the mail items assignment.
