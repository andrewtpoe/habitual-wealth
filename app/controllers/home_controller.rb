class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
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
