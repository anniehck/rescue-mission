class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answer
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @user = User.find(1)
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Answer submitted successfully"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to submit answer."
      render :new
    end
  end

  def answer_params
    params.require(:answer).permit(:description)
  end
end
