# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
GroupBranch.create(code: 7, description: 'Riscos Financeiros')


InformationCoverage.create(validity: '01/01/2018', final_term: '31/12/2099', multiplier_importance_value: 30, minimum_importance_value: 3000, maximum_importance_value: 300000, minimum_reference: 0, maximum_reference: 0, minimum_premium_reference: 30, compulsory_coverage: true, type_coverage: 1, type_use: 1, rate_pure: 28, fixed_value: 0, description_franchise: 'teste 0', status: 1, date_status: '01/01/2018', composition_product_id: 1 )
InformationCoverage.create(validity: '01/02/2018', final_term: '31/12/2099', multiplier_importance_value: 30, minimum_importance_value: 4000, maximum_importance_value: 400000, minimum_reference: 0, maximum_reference: 0, minimum_premium_reference: 40, compulsory_coverage: true, type_coverage: 1, type_use: 1, rate_pure: 29, fixed_value: 0, description_franchise: 'teste 1', status: 1, date_status: '01/02/2018', composition_product_id: 1 )
InformationCoverage.create(validity: '01/03/2018', final_term: '31/12/2099', multiplier_importance_value: 30, minimum_importance_value: 5000, maximum_importance_value: 500000, minimum_reference: 0, maximum_reference: 0, minimum_premium_reference: 50, compulsory_coverage: true, type_coverage: 1, type_use: 1, rate_pure: 30, fixed_value: 0, description_franchise: 'teste 2', status: 1, date_status: '01/03/2018', composition_product_id: 1 )
InformationCoverage.create(validity: '01/04/2018', final_term: '31/12/2099', multiplier_importance_value: 30, minimum_importance_value: 6000, maximum_importance_value: 600000, minimum_reference: 0, maximum_reference: 0, minimum_premium_reference: 60, compulsory_coverage: true, type_coverage: 1, type_use: 1, rate_pure: 31, fixed_value: 0, description_franchise: 'teste 3', status: 1, date_status: '01/04/2018', composition_product_id: 1 )
