defmodule Assign3 do
    def product(m,n) do
        if m == 0 do
            0
        else
            n + product(m-1,n)
        end
    end

    def exp(x,n) do
        if n == 0 do
            1
        else
            #works the same as x * exp(x,n-1)
            product(x,exp(x,n-1))
        end
    end

    def exp_case(_,0) do 1 end
    def exp_case(x,n) do
        case rem(n,2) do
            0 ->
                temp = exp(x,n/2)
                temp * temp
            1 ->
                x * exp(x,n-1)
        end
    end

end
