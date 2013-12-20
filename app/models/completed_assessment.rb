class CompletedAssessment < ActiveRecord::Base
  include Neoid::Relationship

  ##
  # Associations
  #
  belongs_to :assessment
  belongs_to :student

  ##
  # Neoid Conversion
  #

  neoidable do |c|
    c.relationship(:start_node => :student, :end_node => :assessment, :type => :completed_assessment)
  end
end
