Rails.application.routes.draw do

  get '/admin' => 'admin#index', :as => 'admin'

  namespace :admin do
    resources :pages,    :except => [:index, :show]
    resources :sections, :except => [:index, :show]
  end

  get '/:section/:page' => 'pages#show',    :as => 'page'
  get '/:section'       => 'sections#show', :as => 'section'

  get '/' => 'sections#show', :as => 'home', defaults: { section: 'home' }

end
