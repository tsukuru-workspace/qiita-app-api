Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    resources :items, only: %i[index show], param: :page
  end
end
