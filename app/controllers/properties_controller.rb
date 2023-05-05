class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    @properties = Property.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @property = Property.new
    @types = Property.property_types.keys
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @types = Property.property_types.keys
  end

  def update
    if @property.update(property_params)
      redirect_to property_path(@property)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, status: :see_other
  end

  private

  def property_params
    params.require(:property).permit(:title, :description, :property_type, :price, :comuna, :area, :rooms, :bathrooms, photos: [])
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
