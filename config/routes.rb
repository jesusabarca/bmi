Rails.application.routes.draw do
  root 'landing#show'

  # Auth success
  get '/auth/success' => 'auth0#success'
  # Auth failure
  get '/auth/failure' => 'auth0#failure'

  # User login
  get '/login', to: redirect('/auth/auth0')
  # User logout
  get '/logout' => 'auth0#logout'
end
