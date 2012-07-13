# == Schema Information
#
# Table name: data_files
#
#  id           :integer         not null, primary key
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  filename     :string(255)
#  content_type :string(255)
#

class DataFile < ActiveRecord::Base
end
