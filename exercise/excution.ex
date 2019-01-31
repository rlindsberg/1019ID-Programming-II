defmodule ExecutionTime do
def time_of(function) do
    {time, result} = :timer.tc(function)
IO.puts "Time: #{time}ms"
IO.puts "Result: #{result}"
end

def foo(n) do
    123456780 + n
end

end
