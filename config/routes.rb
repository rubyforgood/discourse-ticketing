Ticketing::Engine.routes.draw do
  resources :tickets, only: [:index, :show], constraints: { id: /(topic|post)-\d+/ }
  resource :tag_group_configuration
end
