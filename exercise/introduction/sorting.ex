defmodule Sorting do
    # Start by defining a function insert(element, list)
    # that inserts the element at the right place in the list.
    def isort(l) do isort(l, []) end

    # when l is empty, list is then sorted.
    def isort([], sortedList) do
        sortedList
    end

    def isort([firstElementInUnsortedList | rest], sortedList) do
        # recursively sort [firstElementInUnsortedList | rest]
        isort(rest, insertFirstElementIntoSortedList(firstElementInUnsortedList, sortedList) )
    end

    # initial, sortedList is empty
    def insertFirstElementIntoSortedList(element, []) do
        [element]
    end
    def insertFirstElementIntoSortedList(element, [head | body]) when element > head do
        [head | insertFirstElementIntoSortedList(element, body)]
    end
    # when element < head, element is then the smallest
    def insertFirstElementIntoSortedList(element, list) do
        [element | list]
    end

    def msort(l) do
        case ...  do
            ... ->
                ...
            ... ->
                {.., ...} = msplit(l, [], [])
                merge(msort(...), msort(...))
        end
    end

    def merge(..., ...) do ... end
    def merge(..., ...) do ... end
    def merge(..., ...) do
        if ...
            merge(.., ...)
        else
            merge(.., ...)
        end
    end

    def msplit(..., ..., ...) do
        case ... do
            ... ->
                {..., ...}
                ... ->
                    msplit(..., ..., ...)
        end
    end



end
