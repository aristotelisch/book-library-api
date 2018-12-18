class PublishersController < ApplicationController
  before_action :load_publisher, only: %i[show update destroy]

  def index
    @publishers = Publisher.includes(:authors).all
  end

  def show; end

  def create
    @publisher = Publisher.new(publisher_params)
    @publisher.save!
  rescue
    render json: @publisher, status: :unprocessable_entity
  end

  def update
    @publisher = Publisher.find(params[:id])
    @publisher.update_attributes!(publisher_params)
    render json: @publisher, status: :ok
  rescue ActiveRecord::RecordNotFound
    head :no_content
  rescue
    render json: @publisher, status: :unprocessable_entity
  end

  def destroy
    @publisher&.destroy
    head :no_content
  end

  private

  def load_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:data).require(:attributes)
          .permit(:name, :telephone, :address)
  end
end
