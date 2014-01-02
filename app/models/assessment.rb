class Assessment < ActiveRecord::Base
  include Lexster::Node

  ##
  # Associations
  #
  has_many :questions
  belongs_to :student

  ##
  # Lexster Conversion
  #
  lexsterable do |c|
    c.field :type
  end
end
