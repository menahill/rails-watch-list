class ListsController < ApplicationController
  def index
    @lists = List.all

  end

  def show
    @bookmark= Bookmark.new
    @list = List.find(params[:id])
    # @movie = Movie.
  end

  def new

  @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
  params.require(:list).permit(:name)
  end
end
