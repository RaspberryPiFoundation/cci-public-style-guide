Rails.application.routes.draw do

  scope '/admin', :as => 'admin' do
    get '/'      => 'admin#index', :as => 'index'
    get '/login' => 'admin#login', :as => 'login'
  end

  namespace :admin do
    resources :pages,    :except => [:index, :show]
    resources :sections, :except => [:index, :show]
  end

  get '/:section/:page' => 'pages#show',    :as => 'page'
  get '/:section'       => 'sections#show', :as => 'section'

  get '/' => 'sections#show', :as => 'home', defaults: { section: 'home' }

end
