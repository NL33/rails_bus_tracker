Rails.application.routes.draw do
  root :to => 'stations#index'

  resources :stations
  resources :lines
  resources :stops
end

#notes:

#if any not required:
   #resources :contacts, :except => [:new, :show]

#nested (eg, phones belong to contacts)
  #written out: match('contacts/:contact_id/phones/new', {:via => :get, :to => 'phones#new'}), etc.. becomes
  #   resources :contacts do
  #      resources :phones
  #    end



