Rails.application.routes.draw do

  get '/example_pages/:page' => 'example_pages#show', :as => 'example_pages_show'

  get '/:section'       => 'sections#show', :as => 'sections_show'
  get '/:section/:page' => 'pages#show',    :as => 'pages_show'

  get '/' => 'pages#show', :as => 'home', defaults: { page: 'home' }

end
