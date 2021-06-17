Rails.application.routes.draw do

  # get 'quiz/result'
  get 'question/home'
  # get 'question/quiz', to:'question#quiz'
  # get 'question/:id', to: 'question#question', as:"question"
  get 'question/result', to: 'quiz#result'
  post 'quiz/create', to: 'quiz#create'
  get 'quiz/question', to:'quiz#question'
  get 'quiz/question/:id', to: 'quiz#question', as:"question"
  post 'question/submit', to: 'quiz#submit'
  get 'quiz/result', to: 'quiz#result'
  root 'quiz#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
