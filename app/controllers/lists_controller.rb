class ListsController < ApplicationController
  def index
    @lists = List.all

  end

  def show

    # @bookmark = Bookmark.where(list_id: params[:id])

    # @bookmark = Movie.find(params[:id])
    @bookmark = Bookmark.new
    @list = List.find(params[:id])
    # @movie = Movie.
  end

  def new

  @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path, notice: '✅ List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def list_params
  params.require(:list).permit(:name, :photo)
  end
end
