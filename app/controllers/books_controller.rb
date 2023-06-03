class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿が成功しました"
     redirect_to book_path(@book.id)
    else
     render :new
   end
  end

  def index
   @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "編集が成功しました"
       redirect_to book_path(book.id)
    end
  end

def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to '/books'
end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end