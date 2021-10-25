class BookmarksController < ApplicationController
  # before_action :find, only: [:show]
  before_action :set_bookmark, only: [:show, :destroy]

  def index
    @bookmarks = Bookmark.all.where(list_id: params['list_id'].to_i).sort_by { |bm| bm.comment }
  end

  def show
    # @bookmark = Bookmark.find(params[:id])
  end

  def create
    raise
    @bookmark = bookmark.new(bookmark_params)
    if @bookmark.valid? @bookmark.save
    else raise
    end
    redirect_to list_bookmark_path(@bookmark)
  end

  def destroy
    # @bookmark = bookmark.find(params[:id])
    raise
    @bookmark.destroy
    redirect_to lists_path
  end

  def new
    @bookmark = Bookmark.new
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
