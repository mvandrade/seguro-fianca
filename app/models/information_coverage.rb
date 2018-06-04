class InformationCoverage < ApplicationRecord
  belongs_to :composition_product

  before_destroy :validate_delete
  before_update :validate_validity

  validates :minimum_reference, :maximum_reference, :multiplier_importance_value, :minimum_importance_value, :maximum_importance_value, :minimum_premium_reference, :validity, presence: true

  TYPE_COVERAGES = {
    :basic => 1,
    :additional  =>  2,
    :service  =>  3,
    :clause => 4}

  enum type_coverage: TYPE_COVERAGES

  TYPE_USES = {
    :rate => 1,
    :value => 2
  }

  enum type_use: TYPE_USES

  STATUS = {
    :pendent => 1,
    :approved => 2,
    :locked_up => 3
  }

  enum status: STATUS

  scope :with_basic, -> {where(type_coverage: TYPE_COVERAGES[:basic])}
  scope :with_additional, -> {where(type_coverage: TYPE_COVERAGES[:additional])}
  scope :with_service, -> {where(type_coverage: TYPE_COVERAGES[:service])}
  scope :with_clause, -> {where(type_coverage: TYPE_COVERAGES[:clause])}

  def compulsory_coverage?
    compulsory_coverage = true
  end

  def compulsory
    if compulsory_coverage?
      @compulsory = 'Sim'
    else
      @compulsory = 'Não'
    end
  end

  private

  def validate_validity
    # InformationCoverage.where(["composition_product_id = :b", {b: 1}]).where.not(["status = :c", {c: 3}]).where.not(["id = :a", {a: 7}]).order("validity DESC")
    @information_coverage = InformationCoverage.where(["composition_product_id = :b", { b: composition_product_id}]).order("validity DESC").limit(1)

    @information_coverage.each do |i|
      @validity = i.validity
    end

    if @information_coverage.present?
      if validity < Date.current
        errors.add(:validaty, "não pode ser menor que a data de hoje.")
      elsif validity <= @validity
        errors.add(:validaty, "não pode ser menor que a maior data cadastrada.")
      end
    end
  end

  def validate_delete

    @information_coverage = InformationCoverage.where(["composition_product_id = :b", { b: composition_product_id}]).order("validity DESC").limit(1)

    @information_coverage.each do |i|
      @validity = i.validity
    end

    if @information_coverage.present?
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
