class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)#books_pathから変更
    else
      #newじゃなくてbooks(インデックスページ)へ移動すること
      @books = Book.all
      #@book = Book.new
      render 'books/index'
    end
  end

  #追加
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)#current_user.idから変更
    else
      #@book = Book.find(params[:id])
      render 'books/edit'
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    #追記
    @book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end


  def book_params
  params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
    redirect_to books_path
    end
  end





end

