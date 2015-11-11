Rails.application.routes.draw do

  get '/:page' => 'pages#show', :as => 'pages_show'
  get '/'      => 'pages#home', :as => 'home'

end
