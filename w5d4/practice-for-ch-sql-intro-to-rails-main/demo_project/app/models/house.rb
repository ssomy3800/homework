# == Schema Information
#
# Table name: houses
#
#  id         :bigint           not null, primary key
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class House < ApplicationRecord
    has_many :person, class_name:"Person", foreign_key:"house_id"
    validates :address, presence: true
    
end
