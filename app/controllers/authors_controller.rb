class AuthorsController < ApplicationController
  before_action :load_author, only: %i[show update destroy]

  def index
    @authors = Author.includes(:books).all
  end

  def show
  end

  def create
    @author = Author.new(author_params)
    @author.save!
  rescue
    render json: @author, status: :unprocessable_entity
  end

  def update
    @author = Author.find(params[:id])
    @author.update_attributes!(author_params)
    render json: @author, status: :ok
  rescue ActiveRecord::RecordNotFound
    head :no_content
  rescue
    render json: @author, status: :unprocessable_entity
  end

  def destroy
    @author&.destroy
    head :no_content
  end

  private

  def load_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:data).require(:attributes)
          .permit(:first_name, :last_name, :email, :date_of_birth)
  end
end
