class Student < ActiveRecord::Base
  include Neoid::Node

  ##
  # Associations
  #
  has_many :assessments

  ##
  # Neoid Conversion
  #
  neoidable do |c|
    c.field :name
  end
end
