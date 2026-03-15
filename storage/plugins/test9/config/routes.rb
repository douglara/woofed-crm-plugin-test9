resources :accounts, module: :accounts, only: [] do
  resources :world_times, only: [:index]
end
