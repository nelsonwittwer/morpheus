class Student < ActiveRecord::Base
  include Neoid::Node

  ##
  # Associations
  #
  has_many :checkpoints, :through => :completed_checkpoints
  has_many :completed_checkpoints

  ##
  # Neoid Conversion
  #
  neoidable do |c|
    c.field :name
  end
end
