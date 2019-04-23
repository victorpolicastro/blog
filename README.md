# blog
Blog for Liber Capital onboarding

# Technology
Ruby: 2.4.4
Rails: 5.0.7
PostgreSQL: 9.5.16

# How to run?
01. Clone the project repository;
02. Make sure that you have Ruby and Rails versions;
03. Access (via terminal) the project's directory;
04. Run "bundle" to install all Gems;
05. Run "rails db:reset" to to create, migrate and seed the database. This step will create the admin user;
06. Run "rails s" to start the Rails server;
07. Access localhost:3000;
08. Have fun :).

# How to test?
01. Access the project's directory (via terminal);
02. Run "rspec";
03. See the results.

# How to deploy in Heroku
01. Create a new project at heroku.com;
02. Via terminal, access your project using the command "heroku git:clone -a blog-coelho";
03. Run "git push heroku master" to send the code to your Heroku git;
04. Run "rake db:reset" to create database and to seed;
05. Via terminal, run the following comamands:
  "heroku config:set S3_BUCKET_NAME=your_bucket_name"
  "heroku config:set AWS_ACCESS_KEY_ID=your_access_key_id"
  "heroku config:set AWS_SECRET_ACCESS_KEY=your_secret_access_key"
  "heroku config:set AWS_REGION=your_aws_region"
06. Access your new Heroku's app and have fun :).