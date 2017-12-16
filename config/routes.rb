Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    match 'github/hook' => 'github#hook', via: [:get, :post]
    match 'telegram/hook' => 'telegram#hook', via: [:get, :post]
  end
  root to: 'home#index'
end
