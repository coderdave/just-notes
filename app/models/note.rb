class Note < ActiveRecord::Base
  attr_accessible :content, :title, :tag1, :tag2, :tag3
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  default_scope order: 'notes.updated_at DESC'

end
