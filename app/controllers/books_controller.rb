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
  end

  def update
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

end
