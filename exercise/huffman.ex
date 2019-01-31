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
        tree = tree(sample)
        table = encode_table(tree, [], "")
        # table = decode_table(tree)
        text = text()
        seq = encode(text, table)
        decode(seq, table, "")
    end

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
        code_table = [code_table ++ [{char2, "#{current_path}#{0}" }] ]
        code_table = [code_table ++ [{char1, "#{current_path}#{1}" }] ]
        |> List.flatten
    end
    def encode_table({:node, child_node, {:leaf, child_leaf_key, child_leaf_value}, freq}, code_table, current_path) do
        code_table = [code_table ++ [{child_leaf_key, "#{current_path}#{0}"}] ]
        encode_table(child_node, code_table, "#{current_path}#{1}")
    end

    def decode_table(tree) do
        encode_table(tree, [], "")
    end

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

    # {:freq, leafOrNode, freq}
    def buildRightLeaningTree([thingy1, thingy2 | rest_thingies]) do
        # createNode(thingy1, thingy2)
        # |> rebuildTree(rest_thingies)
        # |> buildRightLeaningTree()
    end

    # insert built node {_, _, _, freq} into rest_thingies.
    def rebuildTree({_, _, _, freq}, rest_thingies, index_of_rest_thingies) do

    end

    # Find which index to insert node at in min prio queue
    def find_index(nod,queue,n) when n+1 >= length(queue) do
      n+1
    end
    def find_index(nod, queue, n) do
      nextNod = Enum.at(queue, n+1)

      case elem(nod,0) do
        :leaf ->
          {_,_, freq} = nod
        :node ->
          {_,_,_,freq} = nod
      end

      case elem(nextNod,0) do
        :leaf ->
          {_,_, nextfreq} = nextNod
        :node ->
          {_,_,_,nextfreq} = nextNod
      end

      # cond do
      #   freq >= nextfreq ->
      #     find_index(nod, queue, n+1)
      #   freq < nextfreq ->
      #     n+1
      # end
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
