defmodule Huffman do
    def sample_xyz do
        "yx y z x x x f f e f e ff e fee xeef eee"
    end
    def sample do
      "the quick brown fox jumps over the lazy dog
      this is a sample text that we will use when we build
      up a table we will only handle lower case letters and
      no punctuation symbols the frequency will of course not
      represent english but it is probably not that far off"
    end
    def text()  do
        "this is something that we should encode"
    end
    def test do
        sample = sample()
        |> freq
        |> sortListByFreq
        |> Enum.map(fn {key, value} -> {:leaf, "NULL", key, value} end) # [{:leaf, empty, " ", 78},...]

    end

    # bench
    def buildTable do
        sample = sample()
        |> freq
        |> sortListByFreq
        |> Enum.map(fn {key, value} -> {:leaf, "NULL", key, value} end) # [{:leaf, empty, " ", 78},...]
        |> buildRightLeaningTree()
        |> encode_table([], "")
    end

    # we represent a leaf with a single character and a node as a simple tuple
    # with two branches: {left, right}. node = {left = char, right = node}
    def tree(sample) do
        sample
        |> freq # returns [{"\n", 4}, {" ", 78}, {"a", 13}, {"b", 7},...]
        |> sortListByFreq # returns [{" ", 78}, {"e", 24}, {"t", 20},...]
        |> Enum.map(fn {key, value} -> {:leaf, "NULL", key, value} end) # [{:leaf, empty, " ", 78},...]
        |> buildRightLeaningTree
        |> Enum.at(0) # remove []

    end

    # create encode table from Huffman tree, {node, leaf}
    def encode_table({:node, left, right, freq}, code_table, current_path) do
        left_code_table = encode_table(left, code_table, "#{current_path}#{0}")
        right_code_table = encode_table(right, code_table, "#{current_path}#{1}")
        left_code_table ++ right_code_table
    end
    def encode_table({:leaf, empty, key, value}, code_table, current_path) do
        code_table ++ [{key, "#{current_path}#{0}" }]
    end

    # # /3
    # def encode_table({:node, {:leaf, empty, char1, freq1}, {:leaf, empty, char2, freq2}, freq}, code_table, current_path) do
    #     code_table = [code_table ++ [{char2, "#{current_path}#{0}" }] ]
    #     code_table = [code_table ++ [{char1, "#{current_path}#{1}" }] ]
    #     |> List.flatten
    # end
    # # result [{" ", "0"}, {"e", "10"}, {"f", "110"}, {"x", "1110"}, {"y", "11110"}]
    # # makes y 11111, find disappeared z
    # # /5
    # def encode_table({:node, {:leaf, empty, char1, freq1}, {:leaf, empty, char2, freq2}, freq}, code_table, current_path, left_node, left_node_path) do
    #     code_table = [code_table ++ [{char2, "#{current_path}#{0}" }] ]
    #     code_table = [code_table ++ [{char1, "#{current_path}#{1}" }] ]
    #     encode_table(left_node, code_table, "#{left_node_path}#{0}", left_node, left_node_path)
    # end
    # # /5
    # def encode_table({:node, child_node, {:leaf, empty, child_leaf_key, child_leaf_value}, freq}, code_table, current_path, left_node, left_node_path) do
    #     code_table = [code_table ++ [{child_leaf_key, "#{current_path}#{0}"}] ]
    #     encode_table(child_node, code_table, "#{current_path}#{1}", left_node, left_node_path)
    # end
    # # /3
    # def encode_table({:node, child_node, {:leaf, empty, child_leaf_key, child_leaf_value}, freq}, code_table, current_path) do
    #     code_table = [code_table ++ [{child_leaf_key, "#{current_path}#{0}"}] ]
    #     encode_table(child_node, code_table, "#{current_path}#{1}")
    # end
    #
    # # /5
    # def encode_table({:node, left_child_node, right_child_node, freq}, code_table, current_path, left_node, left_node_path) do
    #     encode_table(right_child_node, code_table, "#{current_path}#{1}", left_node, left_node_path)
    # end
    # # /3
    # def encode_table({:node, left_child_node, right_child_node, freq}, code_table, current_path) do
    #     encode_table(right_child_node, code_table, "#{current_path}#{1}", left_child_node, current_path)
    # end


    # def decode_table(tree) do
    #     # encode_table(tree, [], "")
    #     3
    # end

    # seq:
    # ["110", "111111111110", "111111110", "11111110", "0", "111111110", "11111110",
    #  "0", "11111110", "11110", "111111111111111111110", "10", "110", "111111111110",
    #  "111111110", "1111110", "1111111111111111111110", "0", "110", "111111111110",
    #  "111110", "110", "0", "1111111111110", "10", "0", "11111110", "111111111110",
    #  "11110", "11111111110", "1110", "11111111111111111110", "0", "10", "1111110",
    #  "11111111111111110", "11110", "11111111111111111110", "10"]
    def encode(text, table) do
      text
      |> String.codepoints
      |> Enum.map(fn x -> find_code_in_table(x, table) end)
    end
    ## find the char in table and return its Huffman code
    def find_code_in_table(char, table) do
        {_, code} = table
        |> Enum.find(fn {c, _} -> c == char end)
        code # return Huffman code
    end


    def decode([], _, result) do
        result
    end
    def decode([code | rest], table, result) do
      found_char = code
      |> find_char_in_table(table)
      decode(rest, table, "#{result}#{found_char}")
    end


    # find the code in table and return the char
    def find_char_in_table(char, table) do
        {char, _} = table
        |> Enum.find(fn {_, c} -> c == char end)
        char # return the char
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

    # def buildRightLeaningTree([root_node | []]) do
    #     [root_node]
    #     # [left, right]
    # end
    # def buildRightLeaningTree([leaf1, leaf2 | restLeaves]) do
    #     createNode(leaf1, leaf2, restLeaves)
    # end

    def buildRightLeaningTree({:node, leaf1, leaf2, freq}) do
        {:node, leaf1, leaf2, freq}
    end
    def buildRightLeaningTree([thingy1, thingy2 | [] ]) do
        createNode(thingy1, thingy2, [])
    end
    # {:freq, leafOrNode, freq}
    def buildRightLeaningTree([thingy1, thingy2 | rest_thingies]) do
        # combines thingy1 and thingy2 and create new_node
        # then rebuild the node sequence with "new_node" and "rest_thingies"
        # by inserting the new node into right place
        createNode(thingy1, thingy2, rest_thingies)
        |> rebuildNodeSeq(rest_thingies)
        |> buildRightLeaningTree()
    end


    # end of the building
    def rebuildNodeSeq({nodeOrLeaf1, left1, right1, freq1}, [{nodeOrLeaf2, left2, right2, freq2}]) do
        thingy1 = {nodeOrLeaf1, left1, right1, freq1}
        thingy2 = {nodeOrLeaf2, left2, right2, freq2}
        createNode(thingy1, thingy2, [])

    end
    # insert built node {_, _, _, freq} into rest_thingies.
    def rebuildNodeSeq(new_node, rest_thingies) do
        {_, _, _, freq} = new_node
        index_to_insert = find_index(new_node, rest_thingies, 0)
        List.insert_at(rest_thingies, index_to_insert, new_node) # create new tree
        #|> buildRightLeaningTree()
    end

    # find node. "queue" is "rest_thingies", "n" is 0
    def find_index({_, _, _, freq}, queue, n) do
        # next node
        {_, _, _, next_freq} = Enum.at(queue, n)
        compare_freq(freq, next_freq, queue, n)
    end
    # only one element left in "queue"
    def compare_freq(freq, next_freq, [], n) do
        n
    end
    def compare_freq(freq, next_freq, queue, n) when freq <= next_freq do
        n
    end
    def compare_freq(freq, next_freq, queue, n) when length(queue) > n+1 do
        find_index({"compared", "left", "right", freq}, queue, n+1)
    end
    def compare_freq(freq, next_freq, queue, n) do
        n
    end


    # def createNode(thingy1, thingy2, []) do
    #     {thingy1, thingy2}
    # end
    def createNode({:leaf, empty, key1, value1}, {:leaf, empty, key2, value2}, list) do
        node = { :node, {:leaf, empty, key1, value1}, {:leaf, empty, key2, value2}, value1 + value2 } # {:node, {:leaf, empty, "z", 1}, {:leaf, empty, "v", 1}}
        # list = List.insert_at(list, 0, node) # insert_at(list, index, value)
        # buildRightLeaningTree(list)
    end
    def createNode({:node, left, right, value1},{:leaf, empty, key2, value2}, list) do
        node = {:node, {:node, left, right, value1},{:leaf, empty, key2, value2}, value1 + value2}
        # list = List.insert_at(list, 0, node) # insert_at(list, index, value)
        # buildRightLeaningTree(list)
    end
    def createNode({:leaf, empty, key2, value2},{:node, left, right, value1}, list) do
        node = {:node, {:node, left, right, value1},{:leaf, empty, key2, value2}, value1 + value2}
    end
    def createNode({:node, left1, right1, value1},{:node, left2, right2, value2}, list) do
        node = {:node, {:node, left1, right1, value1},{:node, left2, right2, value2}, value1 + value2}
    end






    # this is the public api which allows you to pass any binary representation
    def extract(str) when is_binary(str) do
      extract(str, "")
    end

    # this function does the heavy lifting by matching the input binary to
    # a single bit and sends the rest of the bits recursively back to itself
    defp extract(<<b :: size(1), bits :: bitstring>>, acc) when is_bitstring(bits) do
      extract(bits, "#{acc}#{b}")
    end

    # this is the terminal condition when we don't have anything more to extract
    defp extract(<<>>, acc), do: acc

    # convert binary to decimal
    def bin_to_dec() do

    end

end
