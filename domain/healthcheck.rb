# frozen_string_literal: true

require 'benchmark'

module Domain
  class Healthcheck
    class << self
      def call
        {
          versao: 1,
          tag_versao: TAG_VERSAO,
          servicos: {
            banco: try { Models::Beneficio.select(:id).limit(1) }
          }
        }
      end

      private

      def try
        {
          status: :ok,
          time: response_time { yield }
        }
      rescue StandardError
        @fail = true
        { status: :not_ok }
      end

      def response_time
        tempo = Benchmark.realtime { yield }
        (tempo * 1000).round(2) # conversão do tempo para milisengundos
      end
    end
  end
end
