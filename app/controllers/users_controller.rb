class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

   

  # GET /users
  def index
     @users = User.all

     render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def login
    # payload = JSON.parse(request.body.read).symbolize_keys
      #for login

      puts "=================="
      puts "THIS IS PAYLOAD"
      puts payload
      puts "================="

      @pw = payload[:password]
      @user = User.find_by(username: payload[:username])

      puts "=================="
      puts "THIS IS @pw"
      puts @pw
      puts "================="

      puts "=================="
      puts "THIS IS @user"
      puts @user
      puts "================="

      # auth = @user.authenticate



      if @user && @user.authenticate(@pw)
        session[:username] = @user.username
        # session[:user_id] = @user.id
        session[:logged_in] = true
        session[:message] = "Logged in as #{@user.username}"
        response = {
          status: 200, 
          message: session[:message], 
          session: session,
          user: @user
        }
        render json: response
      else
        session[:message] = "Invalid username or password."
        response = {
          message: session[:message],
          status: 404
        }
        render json: response
      end
  end

    


  # POST /users
  def create
    
    puts "the create in registers route is working"
      @user = User.new(payload)
    puts "=================="
    puts "THIS IS PAYLOAD in /users CREATE"
    puts payload
    puts "================="
    puts "THIS IS USER.ID"
    puts @user.id
    puts "================="
    
    puts @user 
      if @user.save
       
        
        session[:logged_in] = true
        session[:user_id] = @user.id
        session[:username] = @user.username
        session[:message] = "Thank you for registering (as #{@user.username}).  Enjoy the site!"
        response = {
          json: @user, 
          status: 200, 
          message: session[:message], 
          logged_in: session[:logged_in],
          session: session
        }
        render json: response
      else
        response = {error: @user.errors, status: :unprocessable_entity}
        render json: response, status: 404
      end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

   
    def portfolio_params
      params.require(:users).permit(:user_name, :user_id)
    end

end
