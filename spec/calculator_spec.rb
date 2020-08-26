require './calculator'
# rspec ./spec/calculator_spec.rb

describe Calculator do

   it "Validar que el rspec funcione" do
       expect( "5" ).to match /5/
   end

   it "Validar que 1+2=3 " do
    expect( 1+2 ).to eq 3
    end

    it "Validar que el metodo calcular devuelve 3 cono la expresion 1+2 " do
        calculator = Calculator.new()
        expect( calculator.calcular("1+2") ).to eq 3
    end

    it "Validar que el metodo calcular devuelve resultado con tresr " do
        calculator = Calculator.new()
        expect( calculator.calcular("1+2+3") ).to eq 6
    end

end

