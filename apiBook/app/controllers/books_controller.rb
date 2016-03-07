class BooksController < ApplicationController

  before_action :load_book, only: [:show,:destroy,:edit,:update]

  def index
    @books=Book.all.to_json
    render json: @books
  end

  def show
      render json: @book
  end

  def new
    @book=Book.new
  end

  def create
    @book=Book.create(book_params)
    if @book.persisted?
      render json: @books
    else
      render json: @book.errors
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      render json: @books
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      render json: @books
    else
      render :nothing => true
    end
  end


private
  def load_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name,:author,:isbn)
  end

end
