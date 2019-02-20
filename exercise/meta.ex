defmodule Env do
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
        List.keydelete(env, ids, 0)
        end)
    end
end
