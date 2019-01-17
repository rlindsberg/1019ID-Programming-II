defmodule Assign4 do
    def nth(1, l) do
        [head | body] = l
        head
    end

    def nth(n,l) do
        if n > length(l) do
            'not valid input'
        else
            [head | body] = l
            if n == 0 do
                head
            else
                nth(n-1, body)
            end
        end
    end

    # return an array where all elements are duplicated
    def duplicateArray(l) do
        if length(l) > 0 do
            [head | body] = l
            [head, head] ++ duplicateArray(body)
        else []
        end
    end

    def add(x, []) do [x] end
    def add(x, l) do
        # first l is list, second l is original list
        add(x, l, l)
    end
    def add(x, [], l) do
        l ++ [x]
    end
    def add(x, [head | body], l) do
        if x != head do
            add(x, body, l)
        end
    end

    # will be covered in def remove(_, [], l) do
    def remove(x, []) do [] end
    def remove(x, l) do
        remove(x, l, [])
    end

    # x is not used, thus dont care
    def remove(_, [], l) do
        l
    end

    ## replacement for if-else
    def remove(x, [head | body], new) when x != head do

        remove(x, body, new ++ [head])
    end
    def remove(x, [head | body], new) do
        remove(x, body, new)

    end


end