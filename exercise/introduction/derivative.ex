# Work with functions as symbolic expressions and compute the derivative of functions.
# Part of the problem is to understand how we can represent functions using the data structures that we have in Elixir.
defmodule Derivative do
    @type literal() :: {:const, number()} # 2.39, 1000, -1...
                | {:const, atom()} # π...
                | {:var, atom()} # x, y, z...
    @type expr() :: {:add, expr(), expr()}
                | {:mul, expr(), expr()}
                | literal()

    # 2x + 3 = {:add, {:mul, {:const, 2}, {:var, :x}}, {:const, 3}}
    def deriv({:const, _}, _) do
        {:const, 0}
    end
    # d/dx (x) = 1
    def deriv({:var, v}, v) do
        {:const, 1}
    end
    # Partial derivative
    def deriv({:var, y}, _) do
        {:const, 0}
    end
    # derivative av multiplication
    def deriv({:mul, e1, e2}, v) do
        #f'x * gx + fx * g'x
        {:add, {:mul deriv(e1, v), e2}, {:mul, e1, deriv(e2, v)}}
    end
    # derivative of polynom
    def deriv({:add, e1, e2}, v) do
        # D(fx + gx) = D(fx) + D(gx)
        {:add, deriv(e1, v), deriv(e2, v)}
    end

end
