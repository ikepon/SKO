Sko::Application.routes.draw do
  get "faq/index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get "contact/index"
  # get "contact/new"
  # get "contact/create"
  get 'contact/new' => 'contact#new', :as => 'contact'
  post 'contact/new' => 'contact#create'
  get 'contact:notice' => 'contact#index'
  get "grade3/index"
  get "grade3/tangen"
  get "grade3/show"
  get "grade2/index"
  get "grade2/tangen"
  get "grade2/show"
  get "grade1/index"
  get "grade1/tangen"
  get "grade1/show"
  get "lessons/index"
  get "lessons/home"
  get "lessons/show"
  get "lessons/new_lesson"
  get "lessons/ranking"
  get "lessons/category"
  get "lessons/agreement"
  get "lessons/privacy"
  get "lessons", :to => 'lessons#index', :as => 'lessons'

  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
  }

  match 'grade1/:type' => 'grade1#tangen', via: :get
  match 'grade1/:type/:lesson' => 'grade1#show', via: :get
  match 'grade2/:type' => 'grade2#tangen', via: :get
  match 'grade2/:type/:lesson' => 'grade2#show', via: :get
  match 'grade3/:type' => 'grade3#tangen', via: :get
  match 'grade3/:type/:lesson' => 'grade3#show', via: :get

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
