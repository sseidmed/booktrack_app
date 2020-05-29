Rails.application.routes.draw do
  get 'homes/:id' => 'homes#show'
  get 'home/index'
  root 'home#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tracks
  resources :readers do
    resources :books, controller: 'readers/books'
    # get 'books/:id' => 'books#show_track'
    # post 'books' => 'books#create_track'
    # put 'books/:id' => 'books#update_track'
    # delete 'books/:id' => 'books#delete_track'
  end
end
