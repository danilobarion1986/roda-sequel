# frozen_string_literal: true

module Domain
  module Beneficios
    class Listar
      def self.call(params = {})
        { beneficios: Models::Beneficio.all }
      end
    end
  end
end
