class Answer < ActiveRecord::Base
  include Lexster::Node

  ##
  # Associations
  #
  belongs_to :question

  ##
  # Lexster Conversion
  #
  lexsterable do |c|
    c.field :text
  end
end
