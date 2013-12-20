class HasQuestion < ActiveRecord::Base
  include Neoid::Relationship

  ##
  # Associations
  #
  belongs_to :assessment
  belongs_to :question

  ##
  # Neoid Conversion
  #

  neoidable do |c|
    c.relationship(:start_node => :assessment, :end_node => :question, :type => :has_answer)
  end
end
