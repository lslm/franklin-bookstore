class CoupomsController < ApplicationController
  def index
    @coupoms = current_user.coupoms.all
  end
end