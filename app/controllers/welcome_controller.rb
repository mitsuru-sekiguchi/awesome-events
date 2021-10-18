class WelcomeController < ApplicationController
  skip_before_action :autenticate
  def index
  end
end
