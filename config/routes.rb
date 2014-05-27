Sko::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
  }

  get "learnings/memo" => "learnings#memo"
  resources "learnings"

  resources "friends"

  resources "messages", :except => [:index, :show]

  get "faq/index"

  get 'contact/new' => 'contact#new', :as => 'contact'
  post 'contact/new' => 'contact#create'
  get 'contact:notice' => 'contact#index'

  get "lessons/new_lesson"
  get "lessons/ranking"
  get "lessons/category"
  get "lessons", :to => 'lessons#index', :as => 'lessons'
  get "lessons/learninginfo"
  post "learnings/check_lesson_info"

  get "grade3/index" => 'lessons#grade'
  get "grade2/index" => 'lessons#grade'
  get "grade1/index" => 'lessons#grade'
  match 'grade1/:type' => 'lessons#tangen', via: :get
  match 'grade1/:type/:lesson' => 'lessons#show', via: :get
  match 'grade2/:type' => 'lessons#tangen', via: :get
  match 'grade2/:type/:lesson' => 'lessons#show', via: :get
  match 'grade3/:type' => 'lessons#tangen', via: :get
  match 'grade3/:type/:lesson' => 'lessons#show', via: :get

  get 'agreement' => 'lessons#agreement'
  get 'privacy' => 'lessons#privacy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root :to => 'lessons#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
