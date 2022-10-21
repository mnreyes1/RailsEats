class Plato < ApplicationRecord
  belongs_to :restaurante
  has_many :comentario
  belongs_to :order, optional: true
  has_one_attached :photo
end
