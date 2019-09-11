# frozen_string_literal: true

module Domain
  module Beneficios
    class Exibir
      def self.call(beneficio_id)
        Models::Beneficio.where(id: beneficio_id).first
      end
    end
  end
end
