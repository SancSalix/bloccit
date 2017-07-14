Rails.application.routes.draw do
  
  resources :topics do
     resources :posts, except: [:index]
   end

  resources :advertisements
  
  resources :questions

  get 'about' => 'welcome#about'
  
  get 'contact' => 'welcome#contact'
  
  get 'faq' => 'welcome#faq'

  root 'welcome#index'
   
end
