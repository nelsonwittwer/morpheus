class HasQuestion < ActiveRecord::Base
  include Neoid::Relationship

  ##
  # Associations
  #
  belongs_to :checkpoint
  belongs_to :question

  ##
  # Neoid Conversion
  #

  neoidable do |c|
    c.relationship :start_node => :checkpoint, :end_node => :question, :type => :questions
  end
end
