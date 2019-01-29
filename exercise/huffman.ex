defmodule Huffman do
    # takes a sample and calculate frequencies for every letter
    def freq(sample) do
        sample
        |> String.codepoints
        |> freq(%{}) # list of letters, map %{}
    end
    # return a list of all letters and their f if empty list
    def freq([], map) do
        Map.to_list(map)
    end
    # calculate frequency of x
    def freq([x | body], map) do
        updatedMap = map
                     |> Map.update(x, 1, &(&1 +1))
        freq(body, updatedMap)
    end



end
