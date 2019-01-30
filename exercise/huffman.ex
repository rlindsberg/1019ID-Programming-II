defmodule Huffman do
    def sample do
        "yx y z x x x f f e f e ff e fee xeef eee"
    end
    def text()  do
        "this is something that we should encode"
    end
    # def test do
    #     sample = sample()
    #     tree = tree(sample)
    #     encode = encode_table(tree)
    #     decode = decode_table(tree)
    #     text = text()
    #     seq = encode(text, encode)
    #     decode(seq, decode)
    # end

    # we represent a leaf with a single character and a node as a simple tuple
    # with two branches: {left, right}. node = {left = char, right = node}
    def tree(sample) do
        sample
        |> freq # returns [{"\n", 4}, {" ", 78}, {"a", 13}, {"b", 7},...]
        |> sortListByFreq # returns [{" ", 78}, {"e", 24}, {"t", 20},...]
        |> Enum.map(fn {key, value} -> {:leaf, key, value} end) # [{:leaf, " ", 78},...]
        |> buildRightLeaningTree
        |> Enum.at(0) # remove []

    end

    # create encode table from Huffman tree, {node, leaf}

    # result [{" ", "0"}, {"e", "10"}, {"f", "110"}, {"x", "1110"}, {"y", "11110"}]
    # makes y 11111, find disappeared z
    def encode_table({:node, {:leaf, char1, freq1}, {:leaf, char2, freq2}, freq}, code_table, current_path) do
        code_table = [code_table ++ [{char2, "#{current_path}#{0}"}] ]
        code_table = [code_table ++ [{char1, (current_path |> String.slice(0..-1))<>"1" }] ]
        |> List.flatten
    end
    def encode_table({:node, child_node, {:leaf, child_leaf_key, child_leaf_value}, freq}, code_table, current_path) do
        code_table = [code_table ++ [{child_leaf_key, "#{current_path}#{0}"}] ]
        encode_table(child_node, code_table, "#{current_path}#{1}")
    end

    def decode_table(tree) do
        # To implement...
    end
    def encode(text, table) do
        # To implement...
    end
    def decode(seq, tree) do
        # To implement...
    end

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

    # sort tupples in a list by value, smallest first
    def sortListByFreq(freqList) do
        sortedLi = freqList
        |> Enum.sort(fn({key1, value1}, {key2, value2}) -> value1 < value2 end)
    end

    def buildRightLeaningTree([root_node | []]) do
        [root_node]
        # [left, right]
    end
    def buildRightLeaningTree([leaf1, leaf2 | restLeaves]) do
        createNode(leaf1, leaf2, restLeaves)
    end
    def createNode({:leaf, key1, value1}, {:leaf, key2, value2}, list) do
        node = { :node, {:leaf, key1, value1}, {:leaf, key2, value2}, value1 + value2 } # {:node, {:leaf, "z", 1}, {:leaf, "v", 1}}
        list = List.insert_at(list, 0, node) # insert_at(list, index, value)
        buildRightLeaningTree(list)
    end
    def createNode({:node, left, right, value1},{:leaf, key2, value2}, list) do
        node = {:node, {:node, left, right, value1},{:leaf, key2, value2}, value1 + value2}
        list = List.insert_at(list, 0, node) # insert_at(list, index, value)
        buildRightLeaningTree(list)
    end

end
