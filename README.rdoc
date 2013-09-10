Rails 3.2 example application shows how to manage set of article's permissions among different user roles.

### Requirements:

* Different user types: Admin, Editor, Reporter and Guest.
* Reporter can register via the app.
* Only Admin can create Editor.
* Reporter can draft an Article.
* Editor can publish any Article.
* Guest can read any published Article.
* Reporter can read only his/her drafts and any published Article.


### Gems Support -
* [Devise](https://github.com/plataformatec/devise): gives you ready-made authentication and user management.
* [CanCan](https://github.com/ryanb/cancan): provides authorization for administrator access.
* [Twitter Bootstrap](http://twitter.github.com/bootstrap/): is a front-end framework for CSS styling.
* [AASM](https://github.com/aasm/aasm): is a tool to manage states.
* [BetterErrors](https://github.com/charliesome/better_errors): is a tool to replace the standard Rails error page with a much better and more useful error page
* [Mailcatcher](https://github.com/sj26/mailcatcher): is a tool to catches mail and serves it through a dream.
* [Annotate](https://github.com/ctran/annotate_models) is a tool to summarize the current schema to the top or bottom of models, fixtures, routes etc.
* [WillPaginate-Bootstrap](https://github.com/mislav/will_paginate) for styled pagination.
* [ActiveAdmin]()
* [Turbolinks]()
* [Heroku]()
* [Rack-Mini-Profiler]()
* [RailRoady]()
* [RailsFootnotes]()
* [Bullet]()
* [QuietAssets]()
* [LolDba]()



### Assumptions

* A User can have only one role.
* An editor can create or publish any article.
* Guest is a visitor in logged out state.
* Any user who logins into the app will become the reporter.
* Only Admin can create an editor and the editor will have to forgot password to change the password and login. An editor can be notified via email.
* An article can have only two states - drafted and published
* Once an article gets published it cannot be ubpublished or converted to drafted state.

### Set up

Run the below commands to set up the project.
* Clone the repo - git clone https://github.com/Swati24/sample_app.git
* Install Gems - bundle install
* Create Database - rake db:create
* Migrate Database - rake db:migrate
* Add some dummy users to your database - rake db:seed. This will add 3 users in your database with following details
				Admin
					Name: Admin
					Email: admin@sample.com
					Password: testing
					Role:
				Editor
					Name: Editor
					Email: editor@sample.com
					Password: testing
					Role: editor
				Reporter
					Name: Reporter
					Email: reporter@sample.com
					Password: testing
					Role: reporter

* Run rails server - rails s