class Employee < ApplicationRecord
    belongs_to :dog
    validates :alias, uniqueness: { case_sensitive: false }
    validates :title, uniqueness: { case_sensitive: false }

    def name
        "#{first_name} #{last_name}"
    end


end
