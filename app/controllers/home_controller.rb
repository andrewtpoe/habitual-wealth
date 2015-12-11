class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def app
    unless current_user
      redirect_to root_path
    end
  end

  def about
  end

  def contact
  end

  def contribute
  end

  def terms
  end

  def privacy_policy
  end

end
