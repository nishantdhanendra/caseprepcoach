class UserDataController < ApplicationController
  before_action :set_user_datum, only: %i[show edit update destroy]

  def index
    @user_data = UserDatum.page(params[:page]).per(10)
  end

  def show; end

  def new
    @user_datum = UserDatum.new
  end

  def edit; end

  def create
    @user_datum = UserDatum.new(user_datum_params)

    if @user_datum.save
      redirect_to @user_datum, notice: "User datum was successfully created."
    else
      render :new
    end
  end

  def update
    if @user_datum.update(user_datum_params)
      redirect_to @user_datum, notice: "User datum was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_datum.destroy
    redirect_to user_data_url, notice: "User datum was successfully destroyed."
  end

  private

  def set_user_datum
    @user_datum = UserDatum.find(params[:id])
  end

  def user_datum_params
    params.require(:user_datum).permit(:user_id, :user_name, :user_goal,
                                       :self_assessment_score)
  end
end
