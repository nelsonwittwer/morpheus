class Assessment < ActiveRecord::Base
  include Neoid::Node

  ##
  # Associations
  #
  has_many :questions
  belongs_to :student

  ##
  # Neoid Conversion
  #
  neoidable do |c|
    c.field :type
  end
end
