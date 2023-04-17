# == Schema Information
#
# Table name: personels
#
#  id         :bigint           not null, primary key
#  name       :string
#  house_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Personel < ApplicationRecord
    belongs_to :house, class_name: "House", foreign_key: "house_id"
    validates :name, presence: true
end
