Rails.application.routes.draw do
  
  post 'user/login'

  post 'user/checkadduser'

  root 'user#adduser'

  get 'article/addarticle' => 'article#addarticle'

  post 'article/save'

  post 'user/logout'

  get 'article/showcontent' 

  get 'article/findarticle'

  resources  :user
  resources  :article

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
