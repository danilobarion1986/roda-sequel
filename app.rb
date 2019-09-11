# frozen_string_literal: true

# Roda's routing tree
class App < Roda
  # https://github.com/jeremyevans/roda/blob/master/lib/roda/plugins/environments.rb
  plugin :environments
  plugin :json, classes: [Array, Hash, Sequel::Model]
  plugin :symbol_matchers
  plugin :status_handler
  plugin :error_handler

  # https://github.com/jeremyevans/roda/blob/master/lib/roda/plugins/match_hook.rb
  # plugin :match_hook

  error do |e|
    { error: e.message }
  end
  status_handler(403) do
    'Forbiddend'
  end
  status_handler(404) do
    'Not found'
  end

  route do |r|
    require_relative './domain/domain'

    r.root do
      r.redirect '/healthcheck'
    end

    r.is 'healthcheck' do
      require_relative './domain/healthcheck'
      require_relative './models/beneficio'

      Domain::Healthcheck.call
    end

    r.on 'v1' do
      r.on 'beneficios' do
        require_relative './models/beneficio'

        r.get /(\d+)/ do |beneficio_id|
          require_relative './domain/beneficios/exibir'

          beneficio = Domain::Beneficios::Exibir.call(beneficio_id)
          response.status = 404 if beneficio.nil?
          beneficio
        end

        r.get do
          r.on /.*/ do
            response.status = 404
            ''
          end

          require_relative './domain/beneficios/listar'
          Domain::Beneficios::Listar.call
        end
      end
    end
  end
end
