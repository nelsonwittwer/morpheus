Morpheus::Application.routes.draw do
  resources :parents
  resources :instructional_coaches
  resources :principals
  resources :districts
  resources :schools
  resources :teachers
  resources :courses
  resources :students
  resources :sections
  resources :answers
  resources :questions
  resources :assessments
end
