class Bill < ApplicationRecord
    belongs_to :company
    has_many :items, inverse_of: :bill
    accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes[:name].blank? }
end
