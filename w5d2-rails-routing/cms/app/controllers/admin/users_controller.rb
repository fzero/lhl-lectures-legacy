class Admin::UsersController < ApplicationController

  # before_action :check_admin

  def index
    render text: 'An admin is you'
  end

  def show
    render text: 'An admin is you'
  end

end


