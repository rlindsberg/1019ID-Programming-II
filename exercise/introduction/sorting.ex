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

    # In merge sort, you divide the list into two (as equal as possible) list. Then you merge sort each of these lists to obtain two sorted sub-lists. These sorted sub-lists are then merged into one final sorted list.
    # The two lists are merged by picking the smallest of the elements from each of the lists. Since each list is sorted, one need only to look at the first element of each list to determine which element is the smallest.

    # sort empty list.
    def msort([]) do [] end
    # sort simgle element list.
    def msort([element]) do [element] end
    # nu kör vi
    def msort(originalList) do
        # split originalList
        {l1, l2} = splitArrayToTwoEvenArrays(l, [], [])


    end

    # array is empty, returns.
    def splitArrayToTwoEvenArrays([], l1, l2) do {l1, l2} end


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
