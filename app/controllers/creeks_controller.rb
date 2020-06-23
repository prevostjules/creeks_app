class CreeksController < ApplicationController
  before_action :set_creek, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @creek = Creek.new
  end

  def create
    @creek = Creek.new(set_params)
    @creek.user = current_user
    if @creek.save!
      redirect_to creek_path(@creek)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @creek.update(set_params)
    if @creek.save!
      redirect_to creek_path(@creek)
    else
      render :edit
    end
  end

  def destroy
    @creek.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_params
    params.require(:creek).permit(:title, :description, :scheduledStartTime, :price)
  end

  def set_creek
    @creek = Creek.find(params[:id])
  end
end
