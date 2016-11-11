class SessionsController < ApplicationController
  def new
  end

  def create
    return render json: {error: "Username not found"}, status: :unauthorized unless user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      item = Item.where(user_id: user.id)
      log_in user
      redirect_to controller: 'items', action: 'index'
    else
      # Create an error message.
      render json: {Error: "Incorrect password silly!"}, status: :unauthorized
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
