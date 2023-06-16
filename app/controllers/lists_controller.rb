class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  # def movie
  #   @list = List.find(params)
  #   @movie = @list.movies
  # end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @movie = @list.movies
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
