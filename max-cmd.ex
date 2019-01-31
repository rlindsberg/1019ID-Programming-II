HuffmanMax.tree("yx y z x x x f f e f e ff e fee xeef eee")

"yx y z x x x f f e f e ff e fee xeef eee" |> HuffmanMax.freq
[{" ", 15}, {"e", 10}, {"f", 7}, {"x", 5}, {"y", 2}, {"z", 1}]

"yx y z x x x f f e f e ff e fee xeef eee" |> HuffmanMax.freq |> Enum.map(fn {char,freq} -> {:leaf, char, freq} end)
[
  {:leaf, " ", 15},
  {:leaf, "e", 10},
  {:leaf, "f", 7},
  {:leaf, "x", 5},
  {:leaf, "y", 2},
  {:leaf, "z", 1}
]

|> HuffmanMax.create_min_prio_queue
[
  {:leaf, "z", 1},
  {:leaf, "y", 2},
  {:leaf, "x", 5},
  {:leaf, "f", 7},
  {:leaf, "e", 10},
  {:leaf, " ", 15}
]

|> HuffmanMax.build_tree

|> Enum.at(0)
{:node,
 {:node,
  {:node,
   {:node, {:node, {:leaf, "z", 1}, {:leaf, "y", 2}, 3}, {:leaf, "x", 5}, 8},
   {:leaf, "f", 7}, 15}, {:leaf, "e", 10}, 25}, {:leaf, " ", 15}, 40}

# Sum:
tree = "yx y z x x x f f e f e ff e fee xeef eee" |> HuffmanMax.freq |> Enum.map(fn {char,freq} -> {:leaf, char, freq} end) |> HuffmanMax.create_min_prio_queue |> HuffmanMax.build_tree |> Enum.at(0)

tree = Huffman.sample |> HuffmanMax.freq |> Enum.map(fn {char,freq} -> {:leaf, char, freq} end) |> HuffmanMax.create_min_prio_queue |> HuffmanMax.build_tree |> Enum.at(0)
