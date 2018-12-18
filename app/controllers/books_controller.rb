class BooksController < ApplicationController
  before_action :load_book, only: %i[show update destroy]
  before_action :load_author, only: %i[index], unless: proc { params[:author_id].blank? }
  before_action :load_publisher, only: %i[index], unless: proc { params[:publisher_id].blank? }

  def index
    @books = if @publisher
               @publisher.books.includes(:author).order("authors.last_name asc, sorting desc")
             elsif @author
               @author.books.order("sorting desc")
             else
               Book.includes(:author).order("authors.last_name asc, sorting desc").all
             end
  end

  def show; end

  def create
    @book = Book.new(book_params)
    byebug
    @book.save!
  rescue
    render json: @book, status: :unprocessable_entity
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes!(book_params)
    render json: @book, status: :ok
  rescue ActiveRecord::RecordNotFound
    head :no_content
  rescue
    render json: @book, status: :unprocessable_entity
  end

  def destroy
    @book&.destroy
    head :no_content
  end

  private

  def load_book
    @book = Book.find(params[:id])
  end

  def load_publisher
    @publisher = Publisher.find(params[:publisher_id])
  end

  def load_author
    @author = Author.find(params[:author_id])
  end

  def book_params
    params.require(:data).require(:attributes)
          .permit(:title, :description, :author_id, :publisher_id,
                  :isbn, :visibility_status, :date_of_creation, :sorting)
  end

end
