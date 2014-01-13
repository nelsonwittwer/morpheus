class HasAnswer < ActiveRecord::Base
  include Neoid::Relationship

  ##
  # Associations
  #
  belongs_to :answers_set
  belongs_to :answer

  ##
  # Neoid Conversion
  #

  neoidable do |c|
    c.relationship(:start_node => :answers_set, :end_node => :answer, :type => :answers)
  end
end
