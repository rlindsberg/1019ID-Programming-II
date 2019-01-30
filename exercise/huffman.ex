defmodule Huffman do
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
        encode = encode_table(tree)
        decode = decode_table(tree)
        text = text()
        seq = encode(text, encode)
        decode(seq, decode)
    end

    # we represent a leaf with a single character and a node as a simple tuple
    # with two branches: {left, right}. node = {left = char, right = node}
    def tree(sample) do
        sample
        |> freq # returns [{"\n", 4}, {" ", 78}, {"a", 13}, {"b", 7},...]
        |> sortListByFreq # returns [{" ", 78}, {"e", 24}, {"t", 20},...]
        |> Enum.map(fn {key, value} -> {:leaf, key, value} end) # [{:leaf, " ", 78},...]
        |> buildRightLeaningTree

    end


    def encode_table(tree) do
        # To implement...
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

    def buildRightLeaningTree([leaf1, leaf2 | restLeaves]) do
        createNode(leaf1, leaf2, restLeaves)
    end
    def createNode({:leaf, key1, value1}, {:leaf, key2, value2}, list) do
        node = { :node, {:leaf, key1, value1}, {:leaf, key2, value2}, value1 + value2 } # {:node, {:leaf, "z", 1}, {:leaf, "v", 1}}
        List.insert_at(list, 0, node) # insert_at(list, index, value)
    end

end
