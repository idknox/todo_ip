class UsersController < ApplicationController
  skip_before_action :ensure_current_user, only: [:new, :create]


  def new

  end
end