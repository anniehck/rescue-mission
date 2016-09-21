class QuestionsController < ApplicationController

  def index
    @questions = Question.order(:created_at).reverse_order
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(:created_at).reverse_order

    # Add votes to answers;
    # Have link/button to increment votes if voted for
    
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
    edit_question_path(@question)
  end

  def create
    @question = Question.new(question_params)
    @user = User.find(1)

    if @question.save
      flash[:success] = 'Your question has been posted.'
      redirect_to question_path(@question)
    else
      flash[:errors] = @question.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:success] = 'Question has been updated.'
      redirect_to question_path(@question)
    else
      flash[:errors] = @question.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy

    @question = Question.find(params[:id])

    if @question.destroy
      flash[:success] = 'Question has been deleted.'
      redirect_to questions_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
