# frozen_string_literal: true

class CoupomsController < ApplicationController
  def index
    @coupoms = current_user.coupoms.all
  end
end
