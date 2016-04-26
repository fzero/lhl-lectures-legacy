class Admin::UsersController < Admin::ApplicationController

  def index
    # Renders /views/admin/index.html.erb
  end

  def show
    render text: 'An admin is you'
  end

end


