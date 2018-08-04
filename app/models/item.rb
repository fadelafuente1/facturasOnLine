class Item < ApplicationRecord
    belongs_to :bill, inverse_of: :bills
end
