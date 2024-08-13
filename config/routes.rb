Rails.application.routes.draw do

  get '/index_notifications', to: 'notifications#index'
  post '/create_task_notification', to: 'notifications#create_task_notification'
  post '/create_product_notification', to: 'notifications#create_product_notification'
  
end
