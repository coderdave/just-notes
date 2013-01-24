# == Schema Information
#
# Table name: notes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  title        :string(255)
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tag1         :string(255)
#  tag2         :string(255)
#  tag3         :string(255)
#  total_amount :decimal(, )
#

require 'spec_helper'

describe Note do
  pending "add some examples to (or delete) #{__FILE__}"
end
