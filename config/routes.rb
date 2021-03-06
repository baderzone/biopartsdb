Biopartsdb::Application.routes.draw do

  get "organisms/index"

  get "organisms/show"

  get "organisms/new"

  get "organisms/edit"

  get "protocols/new"

  get "protocols/edit"

  get "devices/index"

  get "devices/show"

  get "devices/new"

  get "devices/edit"

  get "strains/index"

  get "strains/show"

  get "strains/new"

  get "strains/edit"

  get "plasmids/index"

  get "plasmids/show"

  get "plasmids/new"

  get "plasmids/edit"

  get "vendors/index"

  get "vendors/show"

  get "vendors/new"

  get "vendors/edit"

  get "groups/index"

  get "groups/show"

  get "groups/new"

  get "groups/edit"

  get "sequencings/index"

  get "sequencings/show"

  get "sequencings/new"

  get "sequencings/edit"

  get "cspcr_gels/index"

  get "cspcr_gels/show"

  get "cspcr_gels/new"

  get "cspcr_gels/edit"

  get "cspcrs/index"

  get "cspcrs/show"

  get "cspcrs/new"

  get "cspcrs/edit"

  get "clonings/index"

  get "clonings/show"

  get "clonings/new"

  get "clonings/edit"

  get "clonings/mass_update"

  get "clones/index"

  get "clones/show"

  get "clones/new"

  get "clones/edit"

  get "transformations/index"

  get "transformations/show"

  get "transformations/new"

  get "transformations/edit"

  get "plates/index"

  get "plates/show"

  get "ligations/index"

  get "ligations/show"

  get "ligations/edit"  

  get "pcr_gels/index"

  get "pcr_gels/show"

  get "pcr_gels/edit"

  get "tpcrs/index"

  get "tpcrs/show"

  get "tpcrs/create"

  get "tpcrs/new"

  get "parts/index"

  get "parts/show"

  get "protocols/index"

  get "protocols/show"

  get "users/index"

  get "users/show"

  get "users/edit"

  get "users/update"

  get "sessions/create"

  get "sessions/destroy"

  get "home/index"

  post "pcr_gels/:id/sort", :to => "pcr_gels#sort"
  post "cspcr_gels/:id/sort", :to => "cspcr_gels#sort"

  match "/parts/:id/fasta", :to => "parts#fasta"
  match "admin/parts/:id/fasta", :to => "admin/parts#fasta"
  match "/admin/sequencing_plates/:id/fasta", :to => "admin/sequencing_plates#fasta"
  match "/admin/sequencing_plates/csv", :to => "admin/sequencing_plates#csv"
  match "/admin/sequencing_plates/csv_create", :to => "admin/sequencing_plates#csv_create"

  match "/clonings/:id/update_picked_all", :to => "clonings#update_picked_all"

  match "/cspcrs/:id/update_all_qc_pass", :to => "cspcrs#update_all_qc_pass"
  match "/cspcrs/:id/update_all_qc_fail", :to => "cspcrs#update_all_qc_fail"

  match "/cspcr_gels/:id/update_all_qc_pass", :to => "cspcr_gels#update_all_qc_pass"
  match "/cspcr_gels/:id/update_all_qc_fail", :to => "cspcr_gels#update_all_qc_fail"

  match "/fpcrs/:id/update_all_qc_pass", :to => "fpcrs#update_all_qc_pass"
  match "/fpcrs/:id/update_all_qc_fail", :to => "fpcrs#update_all_qc_fail"

  match "/tpcrs/:id/update_all_qc_pass", :to => "tpcrs#update_all_qc_pass"
  match "/tpcrs/:id/update_all_qc_fail", :to => "tpcrs#update_all_qc_fail"

  match "/spcrs/:id/update_all_qc_pass", :to => "spcrs#update_all_qc_pass"
  match "/spcrs/:id/update_all_qc_fail", :to => "spcrs#update_all_qc_fail"

  match "/pcr_gels/:id/update_all_qc_pass", :to => "pcr_gels#update_all_qc_pass"
  match "/pcr_gels/:id/update_all_qc_fail", :to => "pcr_gels#update_all_qc_fail"

  match "/sequencings/:id/update_all_qc_pass", :to => "sequencings#update_all_qc_pass"
  match "/sequencings/:id/update_all_qc_fail", :to => "sequencings#update_all_qc_fail"

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  resources :home
  resources :users
  resources :protocols
  resources :parts
  resources :spcrs
  resources :tpcrs
  resources :fpcrs 
  resources :pcr_gels do
    resources :pcr_gel_images
  end
  resources :pcr_gel_images do
    resources :pcr_gel_image_annotations
  end 

  resources :ligations
  resources :transformations
  resources :clonings
  resources :cspcrs
  resources :cspcr_gels do 
    resources :cspcr_gel_images
  end
  resources :cspcr_gel_images do
    resources :cspcr_gel_image_annotations
  end 

  resources :sequencings

  namespace :admin do
    root :to => "home#index"
    resources :home, :users, :parts, :groups, :plasmids, :strains, :sequencing_plates, :vendors, :devices, :protocols, :organisms, :oligo_plates
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
