[{"d", 4}, {"e", 2}, {"f", 3}, {"i", 1}, {"o", 1}, {"s", 4}, {"w", 1}] |> Enum.sort(fn({_, value1}, {_, value2}) -> value2 < value1 end)

# [
#   {:node, {:leaf, "z", 1}, {:leaf, "y", 2}, 3},
#   {:leaf, "x", 5},
#   {:leaf, "f", 7},
#   {:leaf, "e", 10},
#   {:leaf, " ", 15}
# ]
Huffman.buildRightLeaningTree([ {:leaf, "z", 1}, {:leaf, "y", 2}, {:leaf, "x", 5}, {:leaf, "f", 7}, {:leaf, "e", 10}, {:leaf, " ", 15} ])

# [
#   {:node, {:leaf, "z", 1}, {:leaf, "y", 2}, 3},
#   {:leaf, "x", 5},
#   {:leaf, "f", 7},
#   {:leaf, "e", 10},
#   {:leaf, " ", 15}
# ]
Huffman.tree(Huffman.sample)


# demo result of
Huffman.tree(Huffman.sample)

[
  {:node,
   {:node,
    {:node, {:node, {:leaf, "z", 1}, {:leaf, "y", 2}, 3}, {:leaf, "x", 5}, 8},
    {:leaf, "f", 7}, 15}, {:leaf, "e", 10}, 25},
  {:leaf, " ", 15}
]

[
  {:node,
   {:node,
    {:node,
     {:node, {:node, {:leaf, "z", 1}, {:leaf, "y", 2}, 3}, {:leaf, "x", 5}, 8},
     {:leaf, "f", 7}, 15}, {:leaf, "e", 10}, 25}, {:leaf, " ", 15}, 40}
]


{:leaf, " ", 15}                 node, 25
                                     {:node,
                                      {:node, {:node, {:leaf, "z", 1}, {:leaf, "y", 2}, 3}, {:leaf, "x", 5}, 8},
                                      {:leaf, "f", 7}, 15}, {:leaf, "e", 10}

            {:leaf, "e", 10}                  node, 15
                                                {:node, {:node, {:leaf, "z", 1}, {:leaf, "y", 2}, 3}, {:leaf, "x", 5}, 8},
                                                {:leaf, "f", 7}

                        {:leaf, "f", 7}                 node, 8
                                                            {:node, {:node, {:leaf, "z", 1}, {:leaf, "y", 2}, 3}, {:leaf, "x", 5}

                                    {:leaf, "x", 5}         node, 3
                                                                {:node, {:leaf, "z", 1}, {:leaf, "y", 2}


                                        {:leaf, "y", 2}             node, 1
                                                                        {:leaf, "z", 1}




[  {"z", [0, 0, 0, 0, 0]}, {"y", [0, 0, 0, 0, 1]}, {"x", [0, 0, 0, 1]}, {"f", [0, 0, 1]}, {"e", [0, 1]}, {" ", [1]}]
