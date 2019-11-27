class Admin::PublishersController < ApplicationController
  before_action :find_publisher, only: [:edit, :update, :show, :destroy]

  def index
    @publishers = Publisher.all
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      redirect_to admin_publishers_path, notice: "新增出版社成功"
    else
     render :new
    end
  end

  def edit

  end

  def update
    if @publisher.update(publisher_params)
      redirect_to admin_publishers_path, notice: "更新成功"
    else
     render :edit
    end
  end
  
  def destroy
    @publisher.destroy if @publisher
    redirect_to admin_publishers_path, notice: "刪除成功"
  end

  def show

  end

  private
  def find_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params 
    params.require(:publisher).permit(:name, :tel, :address, :note, :online)
  end

end
