class AuthorsController < ApplicationController
  before_action :load_author, only: %i[show update destroy]

  def index
    @authors = Author.includes(:books).all
  end

  def show
  end

  def create

  end

  def update

  end

  def destroy
    @author&.destroy
    head :no_content
  end

  private

  def load_author
    @author = Author.find(params[:id])
  end
end
