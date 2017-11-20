	class ArticleController < ApplicationController
		skip_before_action :verify_authenticity_token

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
			render :addarticle
		end


	    def findarticle

	    	title = params[:title]
	    	if title == "*" 
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
			else
			 article_db = Article.find_by(title: title)
	    	 unless article_db.nil?
	    		@results = Hash.new
	    		titles = Array.new
	    		titles << article_db.title
	    		@results[article_db.language] = titles
	    	end 
			end
			
	    	print @result
	        render :addarticle
	    end


		
		def showcontent
			title = params[:title]
			
			article_db = Article.find_by(title: title)
			unless article_db.nil?
				@content = article_db.content
				@title = article_db.title
				@language = article_db.language

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
			render :addarticle
		end


	end
