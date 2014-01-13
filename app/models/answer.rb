class Answer < ActiveRecord::Base
  include Neoid::Node

  ##
  # Associations
  #
  belongs_to :answers_set

  ##
  # Neoid Conversion
  #
  neoidable do |c|
    c.field :english_text
    c.field :spanish_text
    c.field :posistion
    c.field :legacy_response_value
  end
end
