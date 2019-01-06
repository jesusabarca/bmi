Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Auth success
  get '/auth/success' => 'auth0#success'
  # Auth failure
  get '/auth/failure' => 'auth0#failure'
end
