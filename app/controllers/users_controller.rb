class UsersController < ApplicationController
  def show
    @user = User.where(id: params['id'])[0]
  end

  def new
    @user = User.new
    @cities = []

    City.all.each do |city|
      @cities << [city.name, city.id]
    end

  end

  def create
    @user = User.new(post_params)

    if @user.save
      redirect_to '/?userRegistered:true'
    else
      render :new #ne renvoie pas les villes
    end
  end

  private

  def post_params
    return params.require(:user).permit(:first_name, :family_name, :mail, :city_id, :description, :age, :password, :password_confirmation)
  end
end
