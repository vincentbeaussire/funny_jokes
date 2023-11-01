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

  def destroy
    @joke = Joke.find(params[:id])
    @joke.destroy
    redirect_to jokes_path
  end

  def update
    @joke = Joke.find(params[:id])
    if @joke.update(jokes_params)
        redirect_to jokes_path
    else
      render :edit
    end
  end

  private

  def jokes_params
    params.require(:joke).permit(:name, :content, :author)
  end
end
