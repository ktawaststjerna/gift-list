class SessionsController < ApplicationController
  def new
  end

  def create
    return render json: {error: "Username not found"}, status: :unauthorized unless user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      render json: {Error: "Incorrect password silly!"}, status: :unauthorized
    end
  end
end
