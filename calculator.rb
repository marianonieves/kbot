class Calculator

    def calcular(exp)
        res = exp.split("+")
        return res[0].to_i + res[1].to_i
    end
end