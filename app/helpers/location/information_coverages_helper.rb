module Location::InformationCoveragesHelper

  OptionsForTypeCoverages = Struct.new(:id, :description)
  OptionsForTypeUses = Struct.new(:id, :description)
  OptionsForStatus = Struct.new(:id, :description)  


  def options_for_type_coverages

    options = []
    InformationCoverage.type_coverages_i18n.each do |key, value|
      options.push(OptionsForTypeCoverages.new(key, value))
    end
    options

  end

  def options_for_type_uses

    options = []
    InformationCoverage.type_uses_i18n.each do |key, value|
      options.push(OptionsForTypeUses.new(key, value))
    end
    options

  end

  def options_for_status

    options = []
    InformationCoverage.status_i18n.each do |key, value|
      options.push(OptionsForStatus.new(key, value))
    end
    options

  end

end
