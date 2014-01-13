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
    c.field :text
  end
end
