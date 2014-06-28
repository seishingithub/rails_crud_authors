class AuthorsController < ApplicationController

  def index
    @author = Author.new
    @authors = Author.all
  end

  def create
    @author = Author.create(author_params)
    if @author.save
      redirect_to authors_path
    else
      redirect_to :index
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update_attributes!(author_params)

    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:name, :title)
  end
end