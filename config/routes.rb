Birfday::Application.routes.draw do

  root :to => 'birthdays#index'

  resources :birthdays, only: [:index, :new, :create, :show]

end
