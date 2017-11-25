class MediumsController < ApplicationController
  def index
    @mediums = Medium.all
  end
end
