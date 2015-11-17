Rails.application.routes.draw do

  get '/example_pages/:page' => 'example_pages#show', :as => 'example_pages_show'
  get '/:section/:page'      => 'pages#show',         :as => 'pages_show'
  get '/'                    => 'pages#home',         :as => 'home'

end
