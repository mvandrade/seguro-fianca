class GroupBranch < ApplicationRecord

  has_many :branch, dependent: :restrict_with_error

  validates_presence_of :code, :description
  validates_uniqueness_of :code
  validates_numericality_of :code 
  validates_inclusion_of :code, :in => 1..20, :message => " deve ficar entre 1 e 20"
  validates_length_of :description, :in => 3..50

 end
