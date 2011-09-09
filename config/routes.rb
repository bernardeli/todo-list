Todo::Application.routes.draw do
  devise_for :users
  resources :overview, :only => :index
  resources :watches, :only => [:index, :create, :destroy]
  resources :users, :only => [] do
    resources :lists, :only => [:index, :show], :controller => 'users/lists'
  end
  resources :lists do
    resources :tasks, :controller => 'lists/tasks', :only => [] do
      member do
        put :done
        put :undone
      end
    end
  end
  root :to => "overview#index"
end
