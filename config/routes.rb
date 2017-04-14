Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#dashboard'
  get "notifications" => "welcome#notifications"
  get "chats" => "welcome#chats"
  get "get_classes" => "welcome#get_classes"
  get "panels" => "welcome#panels"
  get "single_panel" => "welcome#single_panel"
  get "area_chart" => "welcome#area_chart"
end
