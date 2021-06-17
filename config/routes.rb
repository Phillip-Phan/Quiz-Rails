Rails.application.routes.draw do
  get 'question/home'
  get 'question/quiz', to:'question#quiz'
  root 'question#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
