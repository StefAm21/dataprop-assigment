class PropertiesController < ApplicationController
  include Pagy::Backend
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    @pagy, @properties = pagy(Property.all.order(created_at: :desc), items: 3)


    if params[:query].present?
      @pagy, @properties = pagy(@properties.where('title ILIKE ?', "%#{params[:query]}%"), items: 3)
    elsif params[:property_type].present?
      @pagy, @properties = pagy(@properties.where(property_type: params[:property_type]), items: 3)
    elsif params[:quantity].present?
      @pagy, @properties = pagy(Property.where(rooms: params[:quantity]).or(Property.where(bathrooms: params[:quantity])), items: 3)
    end
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
    redirect_to properties_path unless @property.user == current_user

    @types = Property.property_types.keys
  end

  def update
    redirect_to properties_path unless @property.user == current_user

    if @property.update(property_params)
      redirect_to property_path(@property)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy if @property.user == current_user
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
