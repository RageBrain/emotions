class UsersController < ApplicationController
  def show; end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: 'Information successfuly updated'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname)
  end
end
