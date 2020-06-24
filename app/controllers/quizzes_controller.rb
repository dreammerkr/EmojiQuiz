class QuizzesController < ApplicationController
    $quizzes = Quiz.order(Arel.sql('RANDOM()')).first(10)
    $score = 0
    
    
    def normal
        @quiz = Quiz.first
        @quizzes = Quiz.all
        
        @category = Quiz.distinct.pluck(:Category)
    end
    
    def random
        @quiz = $quizzes[params[:index].to_i]
        @index = params[:index].to_i
        
        if @index > 9
            redirect_to result_path
        end
    end
    
    def randomresult
        if session[:random].nil?
            session[:random] = $score
        else
            session[:random] += $score
        end
        
        @score = $score
        $quizzes = Quiz.order(Arel.sql('RANDOM()')).first(10)
        $score = 0
    end
    
    def like_toggle
        like = Like.find_by(user_id: current_user.id, quiz_id: params[:quiz_id])
        
        if like.nil?
            @like = Like.create(user_id: current_user.id, quiz_id: params[:quiz_id])
        else
            like.destroy
        end
        
        redirect_to :back
    end
    
    def checkanswer
        if params[:answer].gsub(/\s+/, "").downcase == Quiz.find(params[:quiz_id]).answer.gsub(/\s+/, "").downcase
            redirect_to '/quizzes/' + params[:quiz_id] + '/right'
        else
            redirect_to '/quizzes/' + params[:quiz_id] + '/wrong'
        end
    end
    
    def checkanswer_random
        if params[:answer].gsub(/\s+/, "") == $quizzes[params[:index].to_i].answer.gsub(/\s+/, "")
            redirect_to '/random/' + params[:index] + '/right'
        else
            redirect_to '/random/'+ params[:index] + '/wrong'
        end
    end
    
    def randomrightanswer
        @quiz = $quizzes[params[:index].to_i]
        @index = params[:index].to_i
        if $score >= 10
            $score = 10
        else
            $score += 1
        end
    end
    
    def randomwronganswer
        @quiz = $quizzes[params[:index].to_i] 
        @index = params[:index].to_i
        
    end
    
    def rightanswer
        @quiz = Quiz.find(params[:quiz_id]) 
        @nextquiz = @quiz.next
        @quizzes = Quiz.all
    end
    
    def wronganswer
        @quiz = Quiz.find(params[:quiz_id]) 
        @quizzes = Quiz.all
    end
    
    def quizanswer
        @quiz = Quiz.find(params[:quiz_id]) 
        @nextquiz = @quiz.next
        @quizzes = Quiz.all 
    end
    
    def randomquizanswer
        @quiz = $quizzes[params[:index].to_i] 
        @index = params[:index].to_i
    end
    
    def new
        @quiz = Quiz.new
    end
    
    def edit
        @quiz = Quiz.find(params[:id])
    end
    
    def update
        @quiz = Quiz.find(params[:id])
        
        if @quiz.update(quiz_params)
            redirect_to @quiz
        else
            render 'edit'
        end
    end
    
    def create
        @quiz = Quiz.new(quiz_params)
        @quiz.user = current_user
        
        if @quiz.save
            redirect_to @quiz
        else
            render 'new'
        end
    end
    
    def destroy
        @quiz = Quiz.find(params[:id])
        @quiz.destroy
        
        redirect_to normal_path
    end
    
    def show
        @quiz = Quiz.find(params[:id])
        @quizzes = Quiz.all
    end
    
private
    def quiz_params
        params.require(:quiz).permit(:answer, :Category, :content)
    end
end
