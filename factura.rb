class Factura

    def initialize(unit, price, state)
        
        unit=0 if unit==nil
        price=0 if price==nil
        state="CA" if state==nil

        if ARGV.length < 2
            raise "######## ERROR: missing parameter ######## \n \n $ ruby factura.rb [unit] [price] [state]\n\n"
            return
        end

        @unit=unit
        @price=price
        @state=state
    end

    def formatedData()
        " formated data "
    end 
end


unit = ARGV[0]
price = ARGV[1]
state = ARGV[2]
myFactura = Factura.new(unit, price, state)
puts myFactura.formatedData()




