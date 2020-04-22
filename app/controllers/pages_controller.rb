# frozen_string_literal: true

# pages controller
class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about]

  def about; end

  def home; end

  def bestellen; end

  def assortiment; end
end
