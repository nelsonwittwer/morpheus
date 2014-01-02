class HasQuestion < ActiveRecord::Base
  include Lexster::Relationship

  ##
  # Associations
  #
  belongs_to :assessment
  belongs_to :question

  ##
  # Lexster Conversion
  #

  lexsterable do |c|
    c.relationship(:start_node => :assessment, :end_node => :question, :type => :has_answer)
  end
end
