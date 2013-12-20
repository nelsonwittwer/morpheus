class Question < ActiveRecord::Base
  include Neoid::Node

  ##
  # Associations
  #
  belongs_to :assessment
  has_one :answer

  ##
  # Neoid Conversion
  #
  neoidable do |c|
    c.field :text
  end
end
