class HomepageController < ApplicationController
  skip_before_action :ensure_current_user, only: :show

  def show
    @user = User.new
  end
end