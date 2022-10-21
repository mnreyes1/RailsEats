class Order < ApplicationRecord
  has_many :plato, dependent: :destroy
  belongs_to :user
  belongs_to :restaurante
end
