class JokesController < ApplicationController


  def index
    @jokes = Joke.all
  end

  def show
    @joke = Joke.find(params[:id])
  end

  def new
    @joke = Joke.new
  end

  def edit
    @joke = Joke.find(params[:id])
  end

  def create
    @joke = Joke.new(jokes_params)

    if @joke.save
      redirect_to jokes_path
    else
      render :new
    end
  end

  def update
  end

  private

  def jokes_params
    params.require(:joke).permit(:name, :content, :author)
  end
end
