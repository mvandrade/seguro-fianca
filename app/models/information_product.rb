class InformationProduct < ApplicationRecord
  belongs_to :product

  validates :validity, :minimum_plot_value, :minimum_policy_value, :discount_limit, :commission_limit, presence: true 

  before_destroy :validate_delete
  validate :validate_validity

  private

  def validate_validity

    @information_product = InformationProduct.where(["product_id = :b", { b: product_id}]).order("validity DESC").limit(1)

    @information_product.each do |i|
      @validity = i.validity
    end

    if @information_product.present?
      if validity < Date.current
        errors.add(:validaty, "não pode ser menor que a data de hoje.")
      elsif validity <= @validity
        errors.add(:validaty, "não pode ser menor que a maior data cadastrada.")
      end
    end
  end

  def validate_delete

    @information_product = InformationProduct.where(["product_id = :b", { b: product_id}]).order("validity DESC").limit(1)

    @information_product.each do |i|
      @validity = i.validity
    end

    if @information_product.present?
      if validity <= Date.current
        errors.add(:validaty, "Exclusão não permitida, vigência deve ser superior a data de hoje.")
        throw :abort
      elsif validity < @validity
        errors.add(:validaty, "Exclusão não permitida, esta vigencia não é a mais recente.")
        throw :abort
      end
    end
  end
end
