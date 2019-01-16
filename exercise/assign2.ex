defmodule Assign2 do
    def double(n) do
        2 * n
    end

    def convertFromFahrenheitToCelsius(f) do
        (f - 32) / 1.8
    end

    def calculateAreaOfRectangle(a, b) do
        a * b
    end

    def calculateAreaOfSquare(x) do
        calculateAreaOfRectangle(x,x)
    end

    def calculateAreaOfCircle(r) do
        r * r * :math.pi
    end
end
