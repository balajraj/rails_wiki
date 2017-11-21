  class UserController < ApplicationController
    skip_before_action :verify_authenticity_token

#logs in the user and sets the user session information
    def login
      email = params[:email]
      password = params[:password]
      user_db = User.find_by(email: email)
      if  user_db.nil? 
        @msg = "User does not exists"
        render :adduser
        return 
      end
      if  user_db.password != password 
        @msg = "Authentication failed"
        render :adduser
        return
      end
      session[:email] = email
      session[:firstname] = user_db.firstname
      session[:lastname] = user_db.lastname
      render "article/addarticle"
      
    end

#will logout the current user and set the session information to nil
    def logout
      session[:email] = nil
      session[:firstname] = nil
      session[:lastname] = nil 
      render :adduser 
    end

#check if the required fields are presend and create the new user
    def checkadduser
    	firstname = params[:firstname]
      lastname = params[:lastname]
      email = params[:email]
      password = params[:password]
      re_email = params[:retyped_email]
      if firstname.length == 0 or lastname.length == 0 or email.length == 0 or password.length == 0 or re_email.length == 0 
      	@msg = "Required fields cannot be empty"
      	render :adduser
      	return
      end
      if  password.length < 8 or password.length > 10  

       @msg = "Password length has to be min 8 chars max 10 chars"
       render :adduser
       return
      end
      if re_email != email 

       @msg = "Both emails has to match"
       render :adduser
       return
      end
      user_db = User.find_by(email: email)

      unless  user_db.nil? 

        @msg = "Failed to add user email already exists"
        render :adduser
      else 
        User.create(firstname: firstname,lastname: lastname,email: email,password: password)

        @msg = "Successfully added the user. Please login."
        render :adduser
      end
    end

end
