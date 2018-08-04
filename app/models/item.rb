class Item < ApplicationRecord
    belongs_to :bill, inverse_of: :items
end
