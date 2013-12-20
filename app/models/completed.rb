class Completed < ActiveRecord::Base
  include Neoid::Relationship

  ##
  # Associations
  #
  belongs_to :assessment
  # TODO - make polymorphic
  belongs_to :student

  ##
  # Neoid Conversion
  #

  neoidable do |c|
    c.relationship(:start_node => :student, :end_node => :assessment, :type => :completed)
  end
end
