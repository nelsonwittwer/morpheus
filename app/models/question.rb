{class Question < ActiveRecord::Base
  include Lexster::Node

  ##
  # Associations
  #
  belongs_to :assessment
  has_one :answer

  ##
  # Lexster Conversion
  #
  lexsterable do |c|
    c.field :text
  end
end
