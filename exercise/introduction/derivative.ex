# Work with functions as symbolic expressions and compute the derivative of functions.
# Part of the problem is to understand how we can represent functions using the data structures that we have in Elixir.
defmodule Derivative do
    @type literal() :: {:const, number()} # 2.39, 1000, -1...
                | {:const, atom()} # π...
                | {:var, atom()} # x, y, z...
    @type expr() :: {:add, expr(), expr()}
                | {:mul, expr(), expr()}
                | literal()
    # 
    def deriv do

    end




end
