class ArticleController < ApplicationController
		skip_before_action :verify_authenticity_token


#  The save method is used for saving the article that user just typed 
#  to the database. 
		def save
			title = params[:articletitle]
			content = params[:articlecontent]
			lang = params[:articlelang]

			if title.length == 0 or content.length == 0 or lang.length == 0
				print "error message is set"
				@msg = "Required field cannot be empty"
				render :addarticle
				return
			end
			email = session[:email]
			user_db = User.find_by(email: email)
			article_db = Article.find_by(title: title)
			if  article_db.nil?
				Article.create(title: title,content: content,language: lang,user_id: user_db.id)
			else
				article_db.content = content
				article_db.save
			end	
	        getallarticles
	        @msg =""
			render :addarticle
		end

# The find article supports wild card search to find all the articles
# Also it allows to search a article specifically on a known title
	    def findarticle

	    	title = params[:title]
	    	if title == "*" 
	    		getallarticles
			else
			 article_db = Article.find_by(title: title)
	    	 unless article_db.nil?
	    		@results = Hash.new
	    		titles = Array.new
	    		titles << article_db.title
	    		@results[article_db.language] = titles
	    	 end 
			end
			
	    	@msg=""
	        render :addarticle
	    end

#  This is helper method to find all the article and sets the class variable
# in the controller which becomes automatically availabel in the view        
        def getallarticles
        	    all_articles = Article.all
	            @results = Hash.new
	            all_articles.each do |article| 
	             titles = @results[article.language]
	             if titles.nil?
	          	  titles = Array.new
	             end
	          	 titles << article.title
	          	 @results[article.language] = titles
	            end
        end

# the showcontent is called when the user clicks on a particular article
# searched the article by title and displays the article to the user. 		
		def showcontent
			title = params[:title]
			
			article_db = Article.find_by(title: title)
			user_db = User.find_by(id: article_db.user_id)
			@email = user_db.email
			unless article_db.nil?
				@content = article_db.content
				@title = article_db.title
				@language = article_db.language		
			end
			getallarticles
			@msg=""
			render :addarticle
		end


end
