class CompositionProduct < ApplicationRecord

  belongs_to :product
  belongs_to :cover

  has_many :information_coverage, dependent: :restrict_with_error

end
