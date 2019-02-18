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




Seems working:
Huffman.buildRightLeaningTree([thingy1, thingy2 | rest_thingies])
{:node,
 {:node,
  {:node,
   {:node,
    {:leaf, {:leaf, {:leaf, "NULL", "c", 5}, {:leaf, "NULL", "p", 6}, 11},
     {:node, "NULL", "r", 10}, 21}, {:node, "NULL", "t", 20}, 41},
   {:node,
    {:node, {:leaf, {:leaf, "NULL", "f", 6}, {:leaf, "NULL", "b", 7}, 13},
     {:node, "NULL", "i", 11}, 24}, {:leaf, "NULL", "e", 24}, 48}, 89},
  {:node,
   {:node, {:node, {:leaf, "NULL", "s", 13}, {:leaf, "NULL", "n", 13}, 26},
    {:node, {:leaf, "NULL", "a", 13}, {:leaf, "NULL", "o", 15}, 28}, 54},
   {:node,
    {:node,
     {:node, {:node, {:leaf, "NULL", "d", 4}, {:leaf, "NULL", "\n", 4}, 8},
      {:node, {:node, {:leaf, "NULL", "x", 2}, {:leaf, "NULL", "q", 2}, 4},
       {:node, {:node, {:leaf, "NULL", "k", 1}, {:leaf, "NULL", "j", 1}, 2},
        {:node, {:leaf, "NULL", "z", 1}, {:leaf, "NULL", "v", 1}, 2}, 4}, 8},
      16}, {:leaf, "NULL", "l", 17}, 33},
    {:node, {:node, {:leaf, "NULL", "w", 9}, {:leaf, "NULL", "h", 9}, 18},
     {:node,
      {:node, {:node, {:leaf, "NULL", "g", 2}, {:leaf, "NULL", "m", 3}, 5},
       {:leaf, "NULL", "y", 5}, 10}, {:leaf, "NULL", "u", 10}, 20}, 38}, 71},
   125}, 214}, {:leaf, "NULL", " ", 70}, 284}

fixes bug #6
tree = Huffman.test
Huffman.buildRightLeaningTree(tree)
{:node,
 {:node,
  {:node,
   {:node,
    {:node, {:node, {:leaf, "NULL", "c", 5}, {:leaf, "NULL", "p", 6}, 11},
     {:leaf, "NULL", "r", 10}, 21}, {:leaf, "NULL", "t", 20}, 41},
   {:node,
    {:node, {:node, {:leaf, "NULL", "f", 6}, {:leaf, "NULL", "b", 7}, 13},
     {:leaf, "NULL", "i", 11}, 24}, {:leaf, "NULL", "e", 24}, 48}, 89},
  {:node,
   {:node, {:node, {:leaf, "NULL", "s", 13}, {:leaf, "NULL", "n", 13}, 26},
    {:node, {:leaf, "NULL", "a", 13}, {:leaf, "NULL", "o", 15}, 28}, 54},
   {:node,
    {:node,
     {:node, {:node, {:leaf, "NULL", "d", 4}, {:leaf, "NULL", "\n", 4}, 8},
      {:node, {:node, {:leaf, "NULL", "x", 2}, {:leaf, "NULL", "q", 2}, 4},
       {:node, {:node, {:leaf, "NULL", "k", 1}, {:leaf, "NULL", "j", 1}, 2},
        {:node, {:leaf, "NULL", "z", 1}, {:leaf, "NULL", "v", 1}, 2}, 4}, 8},
      16}, {:leaf, "NULL", "l", 17}, 33},
    {:node, {:node, {:leaf, "NULL", "w", 9}, {:leaf, "NULL", "h", 9}, 18},
     {:node,
      {:node, {:node, {:leaf, "NULL", "g", 2}, {:leaf, "NULL", "m", 3}, 5},
       {:leaf, "NULL", "y", 5}, 10}, {:leaf, "NULL", "u", 10}, 20}, 38}, 71},
   125}, 214}, {:leaf, "NULL", " ", 70}, 284}



node, node, leaf
[step001 , code_table , path] = Huffman.buildRightLeaningTree(tree) |> Huffman.encode_table([],"")
   iex(130)> step001
   {:node,
    {:node,
     {:node,
      {:node, {:node, {:leaf, "NULL", "c", 5}, {:leaf, "NULL", "p", 6}, 11},
       {:leaf, "NULL", "r", 10}, 21}, {:leaf, "NULL", "t", 20}, 41},
     {:node,
      {:node, {:node, {:leaf, "NULL", "f", 6}, {:leaf, "NULL", "b", 7}, 13},
       {:leaf, "NULL", "i", 11}, 24}, {:leaf, "NULL", "e", 24}, 48}, 89},
    {:node,
     {:node, {:node, {:leaf, "NULL", "s", 13}, {:leaf, "NULL", "n", 13}, 26},
      {:node, {:leaf, "NULL", "a", 13}, {:leaf, "NULL", "o", 15}, 28}, 54},
     {:node,
      {:node,
       {:node, {:node, {:leaf, "NULL", "d", 4}, {:leaf, "NULL", "\n", 4}, 8},
        {:node, {:node, {:leaf, "NULL", "x", 2}, {:leaf, "NULL", "q", 2}, 4},
         {:node, {:node, {:leaf, "NULL", "k", 1}, {:leaf, "NULL", "j", 1}, 2},
          {:node, {:leaf, "NULL", "z", 1}, {:leaf, "NULL", "v", 1}, 2}, 4}, 8},
        16}, {:leaf, "NULL", "l", 17}, 33},
      {:node, {:node, {:leaf, "NULL", "w", 9}, {:leaf, "NULL", "h", 9}, 18},
       {:node,
        {:node, {:node, {:leaf, "NULL", "g", 2}, {:leaf, "NULL", "m", 3}, 5},
         {:leaf, "NULL", "y", 5}, 10}, {:leaf, "NULL", "u", 10}, 20}, 38}, 71},
     125}, 214}
   iex(131)> code_table
   [[{" ", "0"}]]
   iex(132)> path
   "1"


node, node
   [step002 , code_table , path] = Huffman.buildRightLeaningTree(tree) |> Huffman.encode_table([],"")



table = Huffman.buildTable()
[
  {"c", "0000000"},
  {"p", "0000010"},
  {"r", "000010"},
  {"t", "00010"},
  {"f", "0010000"},
  {"b", "0010010"},
  {"i", "001010"},
  {"e", "00110"},
  {"s", "010000"},
  {"n", "010010"},
  {"a", "010100"},
  {"o", "010110"},
  {"d", "01100000"},
  {"\n", "01100010"},
  {"x", "011001000"},
  {"q", "011001010"},
  {"k", "0110011000"},
  {"j", "0110011010"},
  {"z", "0110011100"},
  {"v", "0110011110"},
  {"l", "011010"},
  {"w", "0111000"},
  {"h", "0111010"},
  {"g", "011110000"},
  {"m", "011110010"},
  {"y", "01111010"},
  {"u", "0111110"},
  {" ", "10"}
]

codes = Huffman.encode(Huffman.text, table)
["00010", "0111010", "001010", "010000", "10", "001010", "010000", "10",
 "010000", "010110", "011110010", "00110", "00010", "0111010", "001010",
 "010010", "011110000", "10", "00010", "0111010", "010100", "00010", "10",
 "0111000", "00110", "10", "010000", "0111010", "010110", "0111110", "011010",
 "01100000", "10", "00110", "010010", "0000000", "010110", "01100000", "00110"]

Huffman.decode(codes, table, "")
"this is something that we should encode"







...
