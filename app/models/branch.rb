class Branch < ApplicationRecord

  belongs_to :group_branch

  has_many :cover, dependent: :restrict_with_error
  has_many :product, dependent: :restrict_with_error
  has_many :tax, dependent: :restrict_with_error

  validates_presence_of :code, :name, :description
  validates_uniqueness_of :code
  validates_numericality_of :code 
  validates_inclusion_of :code, :in => 1..99, :message => " deve ficar entre 1 e 99"
  validates_length_of :name, :in => 3..50
  validates_length_of :description, :in => 3..255

end
