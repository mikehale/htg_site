class HomeController < ApplicationController
  def index
    render :text => "Hello World!"
  end
  
  def error
    nil.some_method
  end
end
