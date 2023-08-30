require './decorator.rb'

class TrimmerDecorator < BaseDecorator
  def correct_name
    super.slice(0, 10)
  end
end