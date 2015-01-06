class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if password_changed_valid?
      update_password
    elsif @user.update user_params
      flash[:notice] = 'Profil mise à jour'
    else
      flash[:error] = 'Erreur lors de la mise à jour du profil'
    end
    redirect_to edit_user_path(current_user)
  end

  private

  def update_password
    @user.update!(user_params_with_password)
    sign_in @user, bypass: true
    flash[:notice] = 'Profil mise à jour'
    rescue StandardError => e
      flash[:error] = e.message
  end

  def password_changed_valid?
    params[:user] && params[:user][:password].present? &&
      params[:user][:password_confirmation].present? &&
      password_confirmation_match?
  end

  def password_confirmation_match?
    params[:user] && params[:user][:password] ==
      params[:user][:password_confirmation]
  end

  def user_params_with_password
    params.require(:user).permit(
      :email, :password, :password_confirmation,
      :firstname, :lastname, :description, :birthday, :city
    )
  end

  def user_params
    params.require(:user).permit(
      :email, :firstname, :lastname, :description, :birthday, :city
    )
  end
end
