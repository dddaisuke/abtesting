# coding: utf-8
module NewDesignUnit
  include Chanko::Unit

  active_if do |context, options|
    ab_test(:use_new_designs)
  end

  scope(:view) do
    function(:show_new_button) do
      case ab_test(:button_colors)
      when 'red' then
        render 'show_red_button'
      when 'green' then
        render 'show_green_button'
      when 'blue' then
        render 'show_blue_button'
      end
    end
  end

  scope('AbtestController') do
    function(:track_button_click) do
      track! :button_click
    end
  end
end
