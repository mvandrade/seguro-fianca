class Cover < ApplicationRecord

  belongs_to :branch

  has_many :composition_products
  has_many :products, through: :composition_products

  validates_presence_of :code, :description
  validates_uniqueness_of :code
  validates_numericality_of :code 
  validates_inclusion_of :code, :in => 1..9999, :message => " deve ficar entre 1 e 9999"
  validates_length_of :name, :in => 3..50
  validates_length_of :name, :in => 3..255

end
