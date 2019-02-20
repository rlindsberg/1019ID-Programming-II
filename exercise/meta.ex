defmodule Env do
    # list_of_ids_to_remove = [:y, :w, :z]
    # env = [x: 1, y: 3, z: 5, w: 7]
    def test(list_of_ids_to_remove, env) do
        List.foldr(list_of_ids_to_remove, env, fn x, acc ->
            IO.inspect(acc)
            {x,acc}
        end)
    end
    # return an empty environment
    def new() do
        []
    end

    # binds variable id to the structure str and returns the environment
    def add(id, str, env) do
        [{id, str}] ++ env
    end

    # return either {id, str}, if the variable id was bound, or nil
    def lookup(id, env) do
        List.keyfind(env, id, 0)
    end

    # removes all bindings for variables in the list ids and returns the environment
    def remove(ids, env) do
        List.foldr(ids, env, fn(ids, env) ->
            IO.puts("removing")
            IO.inspect(ids)
            List.keydelete(env, ids, 0)
        end)
    end
end
