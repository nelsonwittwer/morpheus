Morpheus::Application.routes.draw do
  resources :has_answers_sets

  resources :parent_questions

  resources :answers_sets

  resources :completed_checkpoints

  resources :checkpoints

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
  resources :questionsend
end
