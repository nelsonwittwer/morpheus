class Student < ActiveRecord::Base
  include Neoid::Node

  ##
  # Associations
  #
  has_many :assessments, :through => :completed_assessments
  has_many :completed_assessments

  ##
  # Neoid Conversion
  #
  neoidable do |c|
    c.field :name
  end
end
