Rails.application.routes.draw do

  resources :topics do
     resources :posts, except: [:index]
     resources :sponsored_posts, except: [:index]
   end

  resources :advertisements
  
  resources :questions
  
  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'

  get 'about' => 'welcome#about'
  
  get 'contact' => 'welcome#contact'
  
  get 'faq' => 'welcome#faq'

  root 'welcome#index'
   
end
