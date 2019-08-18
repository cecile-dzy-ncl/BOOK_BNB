class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:show, :index]

def index
    if params[:query].present?
      @books = policy_scope(Book).order(created_at: :desc)
      @books = Book.where.not(latitude: nil, longitude: nil).search_books("%#{params[:query]}%")
    else
      @books = policy_scope(Book).order(created_at: :desc)
      @books = Book.where.not(latitude: nil, longitude: nil)
    end
    @markers = @books.map do |book|
      {
        lng: book.longitude,
        lat: book.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { book: book })
      }
    end
  end

  def show
    authorize @book
    @book = Book.find(params[:id])
    @reviews = @book.reviews # => array of reviews
    @user = current_user
    @booking = @book.bookings.new
    authorize @booking
    @marker = {
        lng: @book.longitude,
        lat: @book.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { book: @book })
    }
  end

  def new
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    authorize @book
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    authorize @book
  end

  def update
    authorize @book
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    authorize @book
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:author_fn, :author_ln, :title, :publishing, :grrade, :summary, :genre, :weekly_price, :address, :photo)
  end


end
