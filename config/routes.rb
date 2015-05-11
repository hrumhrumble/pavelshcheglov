Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, :path => 'admin', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

end
