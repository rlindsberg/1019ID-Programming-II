defmodule Assign3 do
    def product(m,n) do
        if m == 0 do
            0
        else
            n + product(m-1,n)
        end
    end

end
