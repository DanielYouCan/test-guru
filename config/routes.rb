Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: %i[index]
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
