class ParentQuestion < ActiveRecord::Base
  include Neoid::Relationship

  ##
  # Associations
  #
  belongs_to :question

  ##
  # Neoid Conversion
  #

  neoidable do |c|
    c.relationship(:start_node => :question, :end_node => :question, :type => :parent_question)
  end
end
