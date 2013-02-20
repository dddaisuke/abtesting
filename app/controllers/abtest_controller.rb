class AbtestController < ApplicationController
  def index
  end

  def click
    invoke :new_design_unit, :track_button_click
  end
end
