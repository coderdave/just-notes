class Note < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  default_scope order: 'notes.created_at DESC'
end
