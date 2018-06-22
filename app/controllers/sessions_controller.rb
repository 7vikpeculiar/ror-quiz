class SessionsController < ApplicationController
  def new
  end

  def create
    pp "------------"
    @temp = params[:session][:email]
    pp @temp
    pp @temp.class

    @user = User.find_by_email(params[:session][:email])
    if @user.password == nil
      redirect_to 'login'
    else
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to 'login'
    end
  end
  end

  def destroy
    puts "went in"
    session[:user_id] = nil
    redirect_to '/login'
  end

end
