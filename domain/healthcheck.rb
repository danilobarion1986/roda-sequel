# frozen_string_literal: true

module Domain
  class Healthcheck
    def self.call
      { status: Models::Beneficio.count }
    end
  end
end
