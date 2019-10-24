# GitHub Profiler

The github profiler is a tool that allows you to visualize information about a github user.

After entering a valid github username, you will be able to see his avatar and some information about his profile (public information).
Then, his repositories sorted by watcher count in decreasing order.

## Project information

* Ruby 2.4.4
* Rails 4.2.10

Realised on MacOS Mojave 10.14.3

## Gem versions

* Bundler 1.17.3
* Bootstrap 3.3.6

## How to use it

First, download or clone the repository.
Open your terminal and enter the repository.

Run `gem install bundler` if you do not have bundler installed.
Then run `bundle install` to install all dependencies and packages.

You should now be able to run `rails server` and navigate to `localhost:3000/` to test the project.

## Project features

Available features:

* Display the user’s avatar.
* User’s repositories with “name”, “description” and “watcher count”. Must be sorted by watchers (in decreasing order here)

Bonus:
* Better UI/UX with Bootstrap.
* More information about the user (like biography, location, name, ...) (personal bonus)

Other bonuses (not done):

* Implement a signin/signup page.
* The logged user can star/unstar a repository.
* The logged user can see all previously starred repositories.
* Unit tests (Rspec, cucumber).
