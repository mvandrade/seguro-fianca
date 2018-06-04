class DeadlineShortLong < ApplicationRecord

    has_many :percent_deadlines, inverse_of: :deadline_short_long, dependent: :destroy
    # COMENTÁRIOS: Aqui declaramos a associação entre os models e adicionamos o dependent: :destroy para eliminar as experiencias caso o usuário seja deletado 
  
    accepts_nested_attributes_for :percent_deadlines, reject_if: :all_blank, allow_destroy: true
    # COMENTÁRIO: O reject_if: :all blank faz com que não seja salvo um record caso o usuário tente adicionar uma experiência com todos os campos vazios
    
    validates_presence_of :code, :description
    validates_inclusion_of :code, :in => 1..9999, :message => " deve ficar entre 1 e 9999"
    validates_uniqueness_of :code
    validates_numericality_of :code

    STATUS = {
        :pendent => 1,
        :approved => 2
      }
    
      enum status: STATUS

end
