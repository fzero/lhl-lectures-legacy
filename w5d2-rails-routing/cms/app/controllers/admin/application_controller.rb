class Admin::ApplicationController < ApplicationController

  before_filter :check_admin

  private

  def check_admin
    Rails.logger.info("---- Ima checking for admin rights!")
  end

end
