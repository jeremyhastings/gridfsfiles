Rails.application.routes.draw do
  root to: 'grid_fs_files#index'
  resources :grid_fs_files
end
