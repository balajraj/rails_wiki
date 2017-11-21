# Wiki like content editor

This is web application written on ruby on rails which lets the user to add user , login, and  
create content and edit contents . The contents are for various programming languages, the user
will have the ability to search the content using the wildcard search * and also with the title. 
Only the user who have created the article will have edit privileges on the article. The formatting
of the article using markdown language was thought about but not implemented, but can done.
The user while creating the content can use the markdown language and there is public rest api
that is available can be used to convert to the content from markdown to html for better formatting. 
Resetting the user password is not available in this version of the wiki web application. 

* Ruby version
 The code has been tested against ruby 2.4 and rails version 5.1.4.


* Configuration
The root of this application has been to set to user#adduser whick will be starting place for this application. 

* Database creation
The application has been tested against mysql,hence please install mysql locally. 
The mysql configuration that is present in database.yml has to be changed to local 
configuration present in the target user system. 
 Please execute the following rake db:create, and rake db:migrate which will 
create the database and the tables required for the application. 
Below is the configuration in database.yml file. 

```
default: &default
  adapter: mysql
  encoding: utf8
  pool: 5
  username: cmadmin
  password: cmadmin
  host: 127.0.0.1
  port: 3306 

development:
  <<: *default
  database: development_cm
```

Please create a user called as cmadmin in mysql
This is command to create the user and give priviledges in the mysql db, please change the
password later in your system. 

```
CREATE USER 'cmdadmin'@'localhost' IDENTIFIED BY 'cmdadmin';
GRANT ALL PRIVILEGES ON development_cm.* TO 'cmadmin'@'%' identified by 'cmadmin';
```

* Database initialization

These are the commands were used to create model it is not required for the user to create these model
since they are already created and it is only for your reference.

```
rails generate model user
rails generate model article
```

The user password is stored as simple plain text in db, the full security features are not
implemented in this current version. 

* How to run the application

The application can be stated by typing rails server in the top level directory.
Open the browser and root page can be accessed from http://localhost:3000

