# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'date'
class Cat < ApplicationRecord
    CAT_COLORS = ['brown', 'black', 'white', 'orange']

    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: {in: CAT_COLORS}
    validates :name, presence: true
    validates :sex, presence: true, inclusion: {in: %w(M F)}

    validate :valid_birth_date

    def valid_birth_date
        current_date = Date.today
        if Date.today < birth_date.to_date
            errors[:birth_date] << "cannot be in the future!"
        end
    end

    def age
        life = Date.today - birth_date.to_date
        (life / 365).to_i
    end
end




