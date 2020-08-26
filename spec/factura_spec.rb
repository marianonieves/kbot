require './factura'

describe Factura do

    it "verificar que el valor final " do
        testFacture = Factura.new( 1.to_i, 1001.to_i, "CA" )
        expect(testFacture.formatedData()).to match /DTO(%3) = $30/
    end 
    
   #  it "dado el precio 1001 el descuento deberá ser 3" do
     #    testFacture = Factura.new( 1, 5, "CA" )
      #   puts testFacture.calculateDiscount( 5 )["discount"]
     #    expect ( testFacture.calculateDiscount( 5 )["discount"]  ).to_s eq "3"
        
        
        # discount_object = calculateDiscount( 1*5 )
        # discount_percentage = discount_object["discount"]
        # discount_more_than = discount_object["more_than"]

    # end

 end
 