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

  def create
    Joke.create(jokes_params)
    redirect_to jokes_path
  end

  private

  def jokes_params
    params.require(:joke).permit(:name, :content, :author)
  end
end
