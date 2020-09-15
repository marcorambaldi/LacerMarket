class PagesController < ApplicationController
  
  def home
  	@contents = Content.all
  end

  def about
  end
  
end
