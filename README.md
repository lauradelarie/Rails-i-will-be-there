

I Will Be There -
-----------
is an app that uses the API of Meetup.com to provide an overview of a user's groups and upcoming events. A user is able to mark groups as 'favorite', creating a separate overview. This was an assignment of Codaisseur Traineeship, week 7.

Aim of this project has been to learn and practice with:
- working with an external API
- updating a page asynchronously using AJAX and jQuery
- models and associations and the PostgresQL database
- testing with Rspec and Capybara

Note: this project is not in it's final state but will keep serving me as practice- and playground for the time being.

The database currently consists of two tables:
- Users (has_many :favourites )
- Favourites (belong_to :user)

For the most part the data displayed in this app originates from the Meetup.com API and is not stored in a local database.
