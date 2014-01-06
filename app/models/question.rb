class Question < ActiveRecord::Base
  include Neoid::Node

  ##
  # Associations
  #
  belongs_to :checkpoint
  has_one :answer

  ##
  # Neoid Conversion
  #
  neoidable do |c|
    c.field :text
    c.field :answer_type
    c.field :name
    c.field :posistion
    c.field :language
  end
end
