class Comentario < ApplicationRecord
  belongs_to :user
  belongs_to :restaurante, optional: true
  belongs_to :plato, optional: true
  validates_numericality_of :puntaje, :on => :create, :less_than_or_equal_to => 5, :greater_than_or_equal_to => 0, :only_integer => true
end
