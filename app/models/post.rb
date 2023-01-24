class Post < ApplicationRecord
  has_many :comments
  acts_as_taggable_on :tags
end
