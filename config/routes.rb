Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :calendar do
    resources :events, :only => [:index, :show, :new, :create]
  end

  # Admin routes
  namespace :calendar, :path => '' do
    namespace :admin, :path => 'refinery/calendar' do
      resources :events do
        collection do
          post :update_positions
        end
      end
    end
  end

  # Admin routes
  namespace :calendar, :path => '' do
    namespace :admin, :path => 'refinery/calendar' do
      resources :locations, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

  # Admin routes
  namespace :calendar, :path => '' do
    namespace :admin, :path => 'refinery/calendar' do
      resources :categories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
