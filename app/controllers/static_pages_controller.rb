class StaticPagesController < ApplicationController
  def home
	render 'home' # renders the view app/views/static_pages/home.html.erb - default behavior
	p 'Hello'
  end

  def help
  end

  def about
  end

  def contact
  end
end
