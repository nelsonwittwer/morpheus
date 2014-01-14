class Checkpoint < ActiveRecord::Base
  include Neoid::Node

  ##
  # Associations
  #
  has_many :questions, :through => :has_questions
  has_many :has_questions
  belongs_to :student

  ##
  # Neoid Conversion
  #
  neoidable do |c|
    c.field :title
    c.field :actor
    c.field :version
  end
end
