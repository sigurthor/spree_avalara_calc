require 'avalara/version'
require 'avalara/errors'
require 'avalara/configuration'

require 'avalara/api'
require 'avalara'

require 'avalara/types'
require 'avalara/request'
require 'avalara/response'

module SpreeAvalaraCalc
  class Engine < ::Rails::Engine
    require 'spree/core'
    isolate_namespace SpreeAvalaraCalc

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate

      puts 'spree avalara calc'

      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Dir[File.join(File.dirname(__FILE__), "../../app/models/spree/calculator/*.rb")].sort.each do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    initializer 'spree.register.calculator' do |app|
      Dir[File.join(File.dirname(__FILE__), '../../app/models/spree/calculator/*.rb')].sort.each do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
      app.config.spree.calculators.tax_rates << Spree::Calculator::AvalaraTaxCalculator
    end

   # Avalara.geographical_tax('47.627935', '-122.51702', 100)

  end
end
