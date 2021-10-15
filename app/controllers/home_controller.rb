class HomeController < ApplicationController
  def index
    @email = user_signed_in? ? current_user.email : 'undefine'
  end
end
