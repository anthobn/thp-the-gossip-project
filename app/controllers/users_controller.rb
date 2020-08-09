class UsersController < ApplicationController
  def show
    @user = User.where(id: params['id'])[0]
  end

  def new
    @user = User.new
    @cities = list_cities

  end

  def create
    @user = User.new(post_params)

    if @user.save
      log_in(@user)
      redirect_to '/?userRegistered=true'
    else
      @cities = list_cities
      render :new
    end
  end

  private

  def post_params
    return params.require(:user).permit(:first_name, :family_name, :mail, :city_id, :description, :age, :password, :password_confirmation)
  end

  def list_cities
    cities = []
    City.all.each do |city|
      cities << [city.name, city.id]
    end
    return cities
  end
end
