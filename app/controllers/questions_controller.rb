class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.order(updated_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(updated_at: :desc)
    @user = User.all
  end

  def new
    @question = Question.new
    @users = User.all
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = 'Question was successfully created'
      redirect_to @question
    else
      @users = User.all
      flash[:alert] = 'Please fill out all forms properly'
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)

    if @question.save
      flash[:notice] = 'Question updated successfully'
      redirect_to @question
    else
      flash[:alert] = 'Please fill out all forms properly'
      redirect_to edit_question_path(@question)
    end
  end

  def destroy
    Question.find(params[:id]).destroy

    redirect_to :action => 'index'
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
