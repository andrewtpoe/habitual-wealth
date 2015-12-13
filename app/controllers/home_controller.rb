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

  def robots
    robots = File.read(Rails.root + "config/robots.#{Rails.env}.txt")
    render text: robots, layout: false, content_type: 'text/plain'
  end

  def sitemap
    @static_pages = [
    ]
    @posts = Post.all
    respond_to do |format|
      format.xml
    end
  end

end
