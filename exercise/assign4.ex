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

    def add(x, [x | body], l) do
        l
    end
    def add(x, [y | body], l) do
        add(x, body, l)
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

    #unique(l): return a list of unique elements in the list l, that is [:a, :b, :d] are the unique elements in the list [:a, :b, :a, :d, :a, :b, :b, :a]
    def returnUniqueList([]) do [] end
    def returnUniqueList([x | tail]) do
        [x | returnUniqueList(remove(x, tail))]
    end


    # pack(l): return a list containing lists of equal elements, [:a, :a, :b, :c, :b, :a, :c]shouldreturn[[:a, :a, :a], [:b, :b], [:c, :c]]
    # the function pack is called groupListByElement here
    def groupListByElement([]) do
        []
    end

    def groupListByElement([x | body]) do
        {all, rest} = matchElementInList(x, body, [x], [])
        [all | groupListByElement(rest)]
    end




    # @brief A help function for groupListByElement(x, list)
    # @param x, tail, all, rest
    # @return all, rest

    # base case: if list if empty
    def matchElementInList(_, [], all, rest ) do
        # return list of x, and a list of remaining element
        {all, rest}
    end

    # check if x matches the first element in the list "[x | body]"
    def matchElementInList(x, [x | body], all, rest) do
        # "all ++ [x]" put "x" from "[x | body]" in the list "all"
        # continue checking the rest of the list "body"
        matchElementInList(x, body, all ++ [x], rest)
    end

    # last pattern not matched, x is not equal to the first element in the list "[x | body]"
    def matchElementInList(x, [y | body], all, rest) do
        # "rest ++ [y]" put "y" in the list "rest"
        # continue checking the rest of the list "body"
        matchElementInList(x, body, all, rest ++ [y])
    end
    

end
