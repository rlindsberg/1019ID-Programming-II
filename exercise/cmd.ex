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





[thingy1, thingy2 | rest_thingies] = Huffman.test
thingy1 = {:leaf, "NULL", "z", 13}
new_node = Huffman.createNode(thingy1, thingy2, rest_thingies)

# index_to_insert = Huffman.rebuildTree(new_node, rest_thingies)
# rest_thingies |> List.insert_at(index_to_insert, newNode)


{:node,
     {:node,
          {:node,
           {:leaf,
            {:node,
             {:leaf, {:leaf, {:leaf, "NULL", "x", 2}, {:leaf, "NULL", "q", 2}, 4},
              {:node, "NULL", "c", 5}, 9}, {:node, "NULL", "r", 10}, 19},
            {:node, {:leaf, "NULL", "h", 9}, {:leaf, "NULL", "u", 10}, 19}, 38},
           {:node, "NULL", " ", 70}, 108},
          {:node, {:node, {:leaf, "NULL", "n", 13}, {:leaf, "NULL", "a", 13}, 26},
           {:node,
            {:leaf, {:leaf, {:leaf, "NULL", "g", 2}, {:leaf, "NULL", "m", 3}, 5},
             {:node, "NULL", "p", 6}, 11}, {:node, "NULL", "s", 13}, 24}, 50}, 158
     },
     {:node,
          {:node,
           {:node,
            {:leaf,
             {:leaf, {:leaf, {:leaf, "NULL", "k", 1}, {:leaf, "NULL", "j", 1}, 2},
              {:node, "NULL", "d", 4}, 6}, {:node, "NULL", "w", 9}, 15},
            {:node, "NULL", "l", 17}, 32},
           {:node, {:leaf, {:leaf, "NULL", "f", 6}, {:leaf, "NULL", "b", 7}, 13},
            {:node, "NULL", "o", 15}, 28}, 60},
          {:node,
           {:node,
            {:leaf, {:node, {:leaf, "NULL", "\n", 4}, {:leaf, "NULL", "y", 5}, 9},
             {:leaf, "NULL", "i", 11}, 20}, {:node, "NULL", "e", 24}, 44},
           {:node, {:node, {:leaf, "NULL", "z", 13}, {:leaf, "NULL", "v", 1}, 14},
            {:leaf, "NULL", "t", 20}, 34}, 78}, 138
      }, 296
}




























...
