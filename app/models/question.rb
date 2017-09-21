class Question < ActiveRecord::Base
  belongs_to :block
  has_many :answers
end
