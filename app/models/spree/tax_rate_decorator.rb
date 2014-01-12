module Spree
  TaxRate.class_eval do

    puts 'tax rate'
    private

    def create_label
      puts 'tax rate label'
      'Tax'
    end
  end
end