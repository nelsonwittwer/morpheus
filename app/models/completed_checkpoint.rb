class CompletedCheckpoint < ActiveRecord::Base
  belongs_to :student
  belongs_to :checkpoint

  include Neoid::Relationship

  neoidable do |c|
    c.relationship :start_node => :student, :end_node => :checkpoint, :type  => :checkpoints
  end
end
