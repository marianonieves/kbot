class Factura

    def initialize(unit, price, state)
        
        unit=0 if unit==nil
        price=0 if price==nil
        state="CA" if state==nil

        if ARGV.length < 2 || unit < 1 || price < 1
            raise "######## ERROR: missing parameter ######## \n \n $ ruby factura.rb <unit> <price> [state=CA]\n\n"
            return
        end

        @unit=unit
        @price=price
        @state=state.upcase

        @impuestos={ "UT"=> 6.85,  "NV"=> 8.0,  "TX"=> 6.25,  "AL"=> 4.00,  "CA"=> 8.25 }
        @descuentos=[ 
            { "more_than"=> 50000, "discount"=> 15 },
            { "more_than"=> 10000, "discount"=> 10 },
            { "more_than"=> 7000, "discount"=> 7 },
            { "more_than"=> 5000, "discount"=> 5 },
            { "more_than"=> 1000, "discount"=> 3 }
         ]
        
    end


    def calculateDiscount(subtotal)
        @descuentos.each do |hash| 
            # DEBUG :::: puts subtotal.to_s + " > " + hash["more_than"].to_s
            if subtotal > hash["more_than"]
              return hash
            end 
        end 
        return { "more_than"=> 0, "discount"=> 0 }
    end


    def formatedData()

        subtotal = @unit * @price

        taxes_percentage = @impuestos[@state]
        taxes_money = subtotal*taxes_percentage /100

        discount_object = calculateDiscount( subtotal )
        discount_percentage = discount_object["discount"]
        discount_more_than = discount_object["more_than"]

        # DEBUG :::: puts "discount Object =  #{discount_percentage} // #{discount_more_than}"

        discount_money = subtotal*discount_percentage /100

        total = subtotal + taxes_money - discount_money

"       ------------------------
        #{@unit} * $#{@price} = $#{subtotal}
        #{@state}(%#{taxes_percentage}) = $#{taxes_money}
        DTO(%#{discount_percentage}) = $#{discount_money}
        Total = $#{total}"
    end 

end


myFactura = Factura.new(ARGV[0].to_i, ARGV[1].to_i, ARGV[2])
puts myFactura.formatedData()

