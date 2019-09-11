# frozen_string_literal: true

module Db
  class Seeds
    def self.call
      Models::Beneficio.dataset.delete
      Models::Beneficio.create(id: 10, nome: 'Assistência médica')
      Models::Beneficio.create(id: 20, nome: 'Assistência odontológica')
      Models::Beneficio.create(id: 30, nome: 'Auxílio academia')
      Models::Beneficio.create(id: 40, nome: 'Auxílio combustível')
      Models::Beneficio.create(id: 50, nome: 'Auxílio creche')
      Models::Beneficio.create(id: 60, nome: 'Auxílio desenvolvimento')
      Models::Beneficio.create(id: 70, nome: 'Auxílio estacionamento')
      Models::Beneficio.create(id: 80, nome: 'Auxílio farmácia')
      Models::Beneficio.create(id: 90, nome: 'Auxílio fretado')
      Models::Beneficio.create(id: 100, nome: 'Bicicletário')
      Models::Beneficio.create(id: 110, nome: 'Bolsa auxílio')
      Models::Beneficio.create(id: 120, nome: 'Café da manhã')
      Models::Beneficio.create(id: 130, nome: 'Cesta básica')
      Models::Beneficio.create(id: 140, nome: 'Cesta de natal')
      Models::Beneficio.create(id: 150, nome: 'Consignado')
      Models::Beneficio.create(id: 160, nome: 'Convênio com empresas parceiras')
      Models::Beneficio.create(id: 170, nome: 'Cooperativa de crédito')
      Models::Beneficio.create(id: 180, nome: 'Desconto em produtos')
      Models::Beneficio.create(id: 190, nome: 'Ginástica laboral')
      Models::Beneficio.create(id: 200, nome: 'Home office')
      Models::Beneficio.create(id: 210, nome: 'Horário flexível')
      Models::Beneficio.create(id: 220, nome: 'Massoterapia')
      Models::Beneficio.create(id: 230, nome: 'Participação nos Lucros ou Resultados')
      Models::Beneficio.create(id: 240, nome: 'Plano de Aquisição de Ações')
      Models::Beneficio.create(id: 250, nome: 'Previdência privada')
      Models::Beneficio.create(id: 270, nome: 'Programa de remuneração variável')
      Models::Beneficio.create(id: 280, nome: 'Programa de treinamentos')
      Models::Beneficio.create(id: 290, nome: 'Refeitório')
      Models::Beneficio.create(id: 300, nome: 'Restaurante interno')
      Models::Beneficio.create(id: 310, nome: 'Sala de Jogos')
      Models::Beneficio.create(id: 320, nome: 'Seguro de vida')
      Models::Beneficio.create(id: 330, nome: 'Vale alimentação')
      Models::Beneficio.create(id: 340, nome: 'Vale-cultura')
      Models::Beneficio.create(id: 350, nome: 'Vale-refeição')
      Models::Beneficio.create(id: 360, nome: 'Vale-transporte')
    end
  end
end
