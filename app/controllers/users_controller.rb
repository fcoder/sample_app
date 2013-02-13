class UsersController < ApplicationController
  ## before_filter callback is called before a given action (here the
  ## action is edit or update
  ## L9.46 adds destroy
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]

  # L9.48 A special callback to make sure only admin can destry
  # The callback name used in the tutorial is admin_user as follows
  # before_filter :admin_user,     only: :destroy
  # but I would rather use reject_if_not_admin
  before_filter :reject_if_not_admin,     only: :destroy

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  ## edit is to bring up the page for editing. update below is to submit
  ## update request AFTER we have edited
  def edit
    ## No need to do the following assignment for @user because before
    ## action "edit", we have a callback function correct_user which
    ## has done the following line already (See the private correct_user
    ## function at the end of this file)
    ## @user = User.find(params[:id])
  end

  def update
    ## no need to to assign to @user because it has been done in callback current_user
    ## @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  ## index is for showing all users with pagenate Listing9.35
  def index
    @users = User.paginate(page: params[:page])
  end

  #L9.46
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private
    ## signed_in_user used as by callback "before_filter" above
    ## Before edit or update, will do signin first
    ## Listing9.19  For friendly forwarding
    def signed_in_user
      unless signed_in?  ## equivalent to !signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    # def admin_user   This is the callback func name used in tutorial
    def reject_if_not_admin #This is the callback func name I prefer
      redirect_to(root_path) unless current_user.admin?
    end
end
