class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]
	
  def index
  end
	
  def mypage
	  @user = current_user
  end
end
