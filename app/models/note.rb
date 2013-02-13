# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag1       :string(255)
#  tag2       :string(255)
#  tag3       :string(255)
#

class Note < ActiveRecord::Base
  attr_accessible :content, :title, :tag1, :tag2, :tag3
  belongs_to :user

  validates :content, presence: true
  validates :user, presence: true
  validates :user_id, presence: true

  default_scope order: 'notes.updated_at DESC'

end
