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
* [Annotate](https://github.com/ctran/annotate_models): is a tool to summarize the current schema to the top or bottom of models, fixtures, routes etc.
* [WillPaginate-Bootstrap](https://github.com/nickpad/will_paginate-bootstrap) for styled pagination.
* [ActiveAdmin](https://github.com/gregbell/active_admin): for creating elegant backends for website administration.
* [Turbolinks](https://github.com/rails/turbolinks/): to intsruct browser not to recompile the JavaScript and CSS between each page change.
* [Heroku](https://github.com/heroku/heroku): For Server Hosting
* [Rack-Mini-Profiler](https://github.com/harleyttd/miniprofiler): to display speed badge for every html page.
* [RailRoady](https://github.com/SamSaffron/MiniProfiler/tree/master/Ruby): to generate model and controller UML class diagram generator.
* [RailsFootnotes](https://github.com/josevalim/rails-footnotes): to display footnotes in your application for easy debugging, such as sessions, request parameters, cookies, filter chain, routes, queries, etc.
* [Bullet](https://github.com/flyerhzm/bullet): to notify when one should add eager loading (N+1) queries
* [QuietAssets](https://github.com/evrone/quiet_assets): to turn off the Rails asset pipeline log
* [LolDba](https://github.com/plentz/lol_dba): to scan your application models and displays a list of columns that probably should be indexed.



### Assumptions

* A User can have only one role.
* An editor can create or publish any article.
* Guest is a visitor in logged out state.
* Any user who logins into the app will become the reporter.
* Only Admin can create an editor and the editor will have to forgot password to change the password and login. An editor can be notified via email.
* An article can have only two states - drafted and published.
* Once an article gets published it cannot be unpublished or converted to drafted state.
* Articles content will be visible as plain text. Markdown has not been implemented.

### Set up

Run the below commands to set up the project.

* Clone the repo -
```console
git clone https://github.com/Swati24/sample_app.git
```

* Install Gems -
```ruby
bundle install
```

* Create Database -
```ruby
rake db:create
```

* Migrate Database -
```ruby
rake db:migrate
```

* To add some dummy users to your database -
```ruby
rake db:seed
```
* This will populate your database with following 3 users:

```console
Admin
	Name: Admin
	Email: admin@sample.com
	Password: testing
	Role: admin
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
```

* Run rails server
```ruby
rails s
```

### Start using the application

Find this app on http://sampleapp24.herokuapp.com/

Login into the app as per the using the credentials of the desired role.

To access Admin - http://sampleapp24.herokuapp.com/admin

	Admin Login credentials

	email: admin@example.com
	password: password

### Useful Commands

* To find missing indexes:
```ruby
rake db:find_indexes
```

* To generate a railroday map for Models
```ruby
railroady -M | neato -Tpng > models.png
```
* To install rails footnotes
```ruby
rails generate rails_footnotes:install
```

