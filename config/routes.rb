Rails.application.routes.draw do

  get '/examples/:page' => 'examples#show', :as => 'examples_show'
  get '/:page'          => 'pages#show',    :as => 'pages_show'
  get '/'               => 'pages#home',    :as => 'home'

end
