Usg::Application.routes.draw do

  devise_for :users
  
  mount Mercury::Engine => '/'
  namespace :mercury do
    resources :images
  end
  
  get "admin", :controller=>"admin/admin", :action=>"index"
  namespace :admin do 
    resources :pages do
      collection do
        get 'active'
        get 'archived'
      end
    end
    resources :users, :only => [:index, :show, :create, :destroy]
  end
  
  resources :pages
  %w[committee caucus generalassembly].each do |page|
    resources :pages, :path => page, :as => "page_#{page.pluralize}"
  end

  root :to => 'home#index'

end
