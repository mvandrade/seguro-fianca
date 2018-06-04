class PercentDeadline < ApplicationRecord
  belongs_to :deadline_short_long

  validates_presence_of :quantity_days, :percentage_aplided
  validates_inclusion_of :quantity_days, :in => 1..999, :message => " deve ficar entre 1 e 999"
  validates_numericality_of :quantity_days

end
