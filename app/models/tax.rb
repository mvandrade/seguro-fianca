class Tax < ApplicationRecord

  belongs_to :branch

  before_destroy :validate_delete
  before_create :log_tax

  validate :validate_validity

  validates :validity, :rate , presence: true
  # validates_numericality_of :rate

  private

  def validate_validity

    @tax = Tax.where(["branch_id = :b", { b: branch_id}]).order("validity DESC").limit(1)

    @tax.each do |i|
      @validity = i.validity
    end

    if @tax.present?
      if validity < Date.current
        errors.add(:validity, "não pode ser menor que a data de hoje.")
      elsif validity <= @validity
        errors.add(:validity, "não pode ser menor que a maior data cadastrada.")
      end
    end
  end

  def validate_delete

    @tax = Tax.where(["branch_id = :b", { b: branch_id}]).order("validity DESC").limit(1)

    @tax.each do |i|
      @validity = i.validity
    end

    if @tax.present?
      if validity < Date.current
        errors.add(:base, "Exclusão não permitida, vigência deve ser superior a data de hoje.")
        throw :abort
      elsif validity < @validity
        errors.add(:base, "Exclusão não permitida, esta vigencia não é a mais recente.")
        throw :abort
      end
    end
  end

  def log_tax

    logger.info("Valor da Taxa #{rate}".green)

  end

end
