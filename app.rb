# frozen_string_literal: true

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
    r.root do
      r.redirect '/healthcheck'
    end

    r.is 'healthcheck' do
      Domain::Healthcheck.call
    end

    r.on 'v1' do
      r.on 'beneficios' do
        r.get :d do |beneficio_id|
          beneficio = Domain::Beneficios::Exibir.call(beneficio_id)
          response.status = 404 if beneficio.nil?
          beneficio
        end

        r.is do
          r.get do
            Domain::Beneficios::Listar.call
          end
        end
      end
    end
  end
end
