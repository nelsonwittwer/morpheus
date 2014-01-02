class CompletedAssessment < ActiveRecord::Base
  include Lexster::Relationship

  ##
  # Associations
  #
  belongs_to :assessment
  belongs_to :student

  ##
  # Lexster Conversion
  #

  lexsterable do |c|
    c.relationship(:start_node => :student, :end_node => :assessment, :type => :completed_assessments)
  end
end
