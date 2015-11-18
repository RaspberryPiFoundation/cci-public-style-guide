Rails.application.routes.draw do

  namespace :admin do
    resources :pages,    :except => [:show]
    resources :sections, :except => [:show]
  end

  get '/example_pages/:page' => 'example_pages#show', :as => 'example_page'

  get '/:section'       => 'sections#show', :as => 'section'
  get '/:section/:page' => 'pages#show',    :as => 'page'

  get '/' => 'pages#show', :as => 'home', defaults: { page: 'home' }

end
