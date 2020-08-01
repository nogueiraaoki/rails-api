class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all
    render json: CategorySerializer.new(@categories).serialized_json
  end

  # GET /categories/1
  def show
    render json: CategorySerializer.new(@category).serialized_json
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: CategorySerializer.new(@category).serialized_json
    else
      render json: CategorySerializer.serialize(@category.errors), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: CategorySerializer.new(@category).serialized_json
    else
      render json: CategorySerializer.serialize(@category.errors), status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, polymorphic: [:category])
    end
end
