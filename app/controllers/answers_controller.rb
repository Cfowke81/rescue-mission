class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    @users = User.all
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user_id = current_user.id

    if @answer.save
      flash[:notice] = 'Answer saved successfully'
      redirect_to question_path(@question)
    else
      flash[:alert] = 'Failed to save answer'
      render :new
    end
  end

  def update
    @answer = Answer.find(params[:id])
    @all_answers = @answer.question.answers

    @all_answers.update_all(best_answer: false)

    if @answer.update_attributes(best_answer: true)
      flash[:notice] = 'Best answer chosen'
      redirect_to question_path(@answer.question)
    end
  end

  def upvote
    @answer = Answer.find(params[:id])
    @vote = Vote.create(answer_id: params[:id])

    if @vote.save
      flash[:notice] = 'Thank you for upvoting!'
      redirect_to question_path(@answer.question)
    else
      flash[:alert] = 'You have already upvoted this!'
      redirect_to question_path(@answer.question)
    end
  end

  def answer_params
    params.require(:answer).permit(:question_id, :answer, :user_id)
  end
end
