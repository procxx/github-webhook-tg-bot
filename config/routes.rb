Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'github/hook' => 'github#hook', via: [:get, :post]
  root to: 'home#index'
end
