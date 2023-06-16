class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to lists_path(@list)
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movies = Movie.all
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end


end
