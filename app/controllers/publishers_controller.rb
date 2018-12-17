class PublishersController < ApplicationController
  before_action :load_publisher, only: %i[show update destroy]

  def index
    @publishers = Publisher.includes(:authors).all
  end

  def show; end

  def create
  end

  def update
  end

  def destroy
    @publisher&.destroy
    head :no_content
  end

  private

  def load_publisher
    @publisher = Publisher.find(params[:id])
  end
end
