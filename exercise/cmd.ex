[{"d", 4}, {"e", 2}, {"f", 3}, {"i", 1}, {"o", 1}, {"s", 4}, {"w", 1}] |> Enum.sort(fn({_, value1}, {_, value2}) -> value2 < value1 end)

Huffman.buildRightLeaningTree([ {:leaf, "z", 1}, {:leaf, "v", 1}, {:leaf, "k", 1}, {:leaf, "j", 1}, {:leaf, "x", 2}, {:leaf, "q", 2}, {:leaf, "g", 2}, {:leaf, "e", 24}, {:leaf, " ", 78} ])
