class Note < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user

  default_scope order: 'notes.created_at DESC'
end
