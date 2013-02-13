# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  title       :string(255)      not null
#  description :text             not null
#  the_role    :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, uniq: true
end
