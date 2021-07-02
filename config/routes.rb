Rails.application.routes.draw do
  get '/' => 'dojos#index'
  get 'dojos/new' => 'dojos#new'
  post 'dojos/create' => 'dojos#create'
  get 'dojos/:id' => 'dojos#show', as: 'dojos_show'
  get 'dojos/:id/edit' => 'dojos#edit', as: 'dojos_edit'
  patch 'dojos/:id/edit' => 'dojos#update', as: 'dojos_update'
  delete 'dojos/:id/delete' => 'dojos#delete', as: 'dojos_delete'
  get 'dojos/:dojo_id/students/new' => 'students#new', as: 'students_new'
  post 'dojos/:dojo_id/students/create' => 'students#create', as: 'students_create'
  get 'dojos/:dojo_id/students/:student_id' => 'students#show', as: 'students_show'
  get 'dojos/:dojo_id/students/:student_id/edit' => 'students#edit', as: 'students_edit'
  patch 'dojos/:dojo_id/students/:student_id/edit' => 'students#update', as: 'students_update'
  delete 'dojos/:dojo_id/students/:student_id/delete' => 'students#delete', as: 'students_delete'
end