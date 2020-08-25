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
        @descuentos={ 1000=> 3, 5000=>5, 7000=>7, 10000=>10, 50000=>15 }
        
    end

    def formatedData()
        subtotal = @unit * @price
        taxes_percentage = @impuestos[@state]
        taxes_money = subtotal*taxes_percentage /100

"       #{@unit} * $#{@price} = $#{subtotal}
        #{@state}(%#{taxes_percentage}) = $#{taxes_money}
        DTO(%0) = $0
        Total = $52"        
    end 

end


myFactura = Factura.new(ARGV[0].to_f, ARGV[1].to_f, ARGV[2])
puts myFactura.formatedData()




