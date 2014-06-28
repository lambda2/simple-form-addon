class WelcomeController < ApplicationController

  def index
    @beer = Beer.new

  end
end
