class Bill < ApplicationRecord
    belongs_to :company
    has_many :items, inverse_of: :bill, dependent: :destroy
    accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes[:description, :type, :amount].blank? }, allow_destroy: true
end
