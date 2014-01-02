class HasAnswer < ActiveRecord::Base
  include Lexster::Relationship

  ##
  # Associations
  #
  belongs_to :answer
  belongs_to :question

  ##
  # Lexster Conversion
  #

  lexsterable do |c|
    c.relationship(:start_node => :question, :end_node => :answer, :type => :has_answer)
  end
end
