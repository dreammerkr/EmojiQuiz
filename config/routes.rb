Rails.application.routes.draw do
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root 'main#index'
  
  resources :quizzes 
    
  
  resources :users
  
  get '/index' => 'main#index'
  
  get '/profile' => 'users#profile'
  get '/signup' => 'users#new'
  get '/my_random' => 'users#myrandom'
  get '/my_quizzes' => 'users#myquizzes'
  
  get '/normal' => 'quizzes#normal'
  
  get '/random/:index' => 'quizzes#random', :as => :random_with_index
  post '/random/:index/check' => 'quizzes#checkanswer_random'
  get '/random/:index/wrong' => 'quizzes#randomwronganswer'
  get '/random/:index/right' => 'quizzes#randomrightanswer'
  get '/random/:index/answer' => 'quizzes#randomquizanswer'
  get '/result' => 'quizzes#randomresult'
  post 'quizzes/:quiz_id/like' => 'quizzes#like_toggle'
  post 'quizzes/:quiz_id/check' => 'quizzes#checkanswer'
  
  get 'quizzes/:quiz_id/answer' => 'quizzes#quizanswer'
  get 'quizzes/:quiz_id/right' => 'quizzes#rightanswer'
  get 'quizzes/:quiz_id/wrong' => 'quizzes#wronganswer'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
