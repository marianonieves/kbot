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


    def calculateDiscount(pSubtotal)
        @descuentos.each do |hash| 
            # DEBUG :::: puts pSubtotal.to_s + " > " + hash["more_than"].to_s
            if pSubtotal > hash["more_than"]
                money  = (pSubtotal * taxes["more_than"] /100).to_f
                # DEBUG :::: puts "calcular discount, money = #{money}"
                hash["money"] = money
              return hash
            end 
        end 
        return { "more_than"=> 0, "discount"=> 0, "money"=>0 }
    end


    def calculateTaxes( pSubtotal, state )
        taxes = { "percentage"=>0, "money"=>0 }
        if !@impuestos[state].nil?
            imp_state = @impuestos[state]
            imp_percent = (pSubtotal * imp_state /100).to_f
            puts imp_state
            taxes = { "percentage"=>imp_state, "money"=> imp_percent }
        end
        return taxes
    end


    def formatedData()

        subtotal = @unit * @price
        taxes_object = calculateTaxes(  subtotal, @state  )
        taxes_percentage = taxes_object["percentage"]
        taxes_money =  taxes_object["money"]

        discount_object = calculateDiscount( subtotal )
        discount_percentage = discount_object["discount"]
        discount_more_than = discount_object["more_than"]

        # DEBUG :::: 
        puts "discount taxes_object =  #{taxes_percentage} // #{taxes_money}"
        puts "discount Object =  #{discount_percentage} // #{discount_more_than}"

        discount_money = subtotal*discount_percentage /100

        total = subtotal + taxes_money - discount_money

"       ------------------------
        #{@unit} * $#{@price} = $#{subtotal}
        #{@state}(%#{taxes_percentage}) = $#{taxes_money}
        DTO(%#{discount_percentage}) = $#{discount_more_than}
        Total = $#{total}"
    end 

end


myFactura = Factura.new(ARGV[0].to_i, ARGV[1].to_i, ARGV[2])
puts myFactura.formatedData()

