class Notification < ApplicationRecord
  belongs_to :product, optional: true
end
