class ListsController < ApplicationController
  # before_action :find, only: [:show]

  def index
    @lists = List.all.sort_by { |list| list.name }
  end

  def create
    @list = list.new(list_params)
    @list.save!
    redirect_to list_path(@list)
  end

  def show
    # raise
    @list = list.find(params[:id])
  end

  def new
    @list = List.new
  end
end
