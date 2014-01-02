class Student < ActiveRecord::Base
  include Lexster::Node

  ##
  # Associations
  #
  has_many :assessments, :through => :completed_assessments
  has_many :completed_assessments

  ##
  # Lexster Conversion
  #
  lexsterable do |c|
    c.field :name
  end
end
