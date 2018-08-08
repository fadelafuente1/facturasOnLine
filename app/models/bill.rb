class Bill < ApplicationRecord
    belongs_to :company
    has_many :items, inverse_of: :bill, dependent: :destroy
    accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes[:description].blank? && attributes[:type].blank? && attributes[:amount].blank? }, allow_destroy: true
    before_create :change_date_format

    def change_date_format
        self.date = Date.parse(self.date.to_s).strftime("%m/%d/%Y")
    end
end
