class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  has_many :comments
  acts_as_taggable_on :tags
end
