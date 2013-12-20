class Answer < ActiveRecord::Base
  include Neoid::Node

  ##
  # Associations
  #
  belongs_to :question

  ##
  # Neoid Conversion
  #
  neoidable do |c|
    c.field :text
  end
end
