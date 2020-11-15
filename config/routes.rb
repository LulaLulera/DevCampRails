Rails.application.routes.draw do
  devise_for :users  #crea toda las rutas de devise
  resources :skills
	#para poder hacer nested routes es necesario que se encuentren en las carpetas correspondientes, en este caso
	#dashboard debe encontrarse dentro de una carpeta "admin", tanto el controlador como las vistas
  namespace :admin do
  	get 'dashboard/main'
	get 'dashboard/user'
	get 'dashboard/blog'
  end
  

  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :posts

  get 'posts/*missing', to: 'posts#missing' #globbing. IMportante que esté debajo de resources.

  resources :users
  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end

  get 'query/:something/:another_one', to: 'pages#something' #dinamic routes 

  root to: 'pages#home'  
end
