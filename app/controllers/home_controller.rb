# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :redirect_current_user

  def index; end

  private def redirect_current_user
    redirect_to dashboard_path if current_user.present?
  end
end
