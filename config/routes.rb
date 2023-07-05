Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: "publicaciones#index"

  resources :publicaciones, path: 'publicaciones', only: [:index, :show, :new, :create, :edit, :destroy] do
    post 'create_comentario', on: :member
    resources :comentarios

  end

  patch '/comentarios/:id', to: 'comentarios#update', as: 'comentario'
  post '/publicaciones/:publicacion_id/comentarios', to: 'comentarios#create', as: 'publicacion_comentarios'
  get '/publicaciones/nueva', to: 'publicaciones#new', as: 'new_publicacion'
  get '/publicaciones', to: 'publicaciones#index', as: 'all_publicacion'
  patch '/publicaciones/:id', to: 'publicaciones#update', as: 'update_publicacion'
  patch '/publicaciones/:publicacion_id/comentarios/:id', to: 'comentarios#update', as: 'update_comentario'


end
