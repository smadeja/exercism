defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    list |> do_keep(fun)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    list |> keep(&(!fun.(&1)))
  end

  @spec do_keep(
          list :: list(any),
          function :: (any -> boolean),
          accumulator :: list(any)
        ) ::
          list(any)
  defp do_keep(list, function, accumulator \\ [])

  defp do_keep([head | tail], function, accumulator) do
    if function.(head) do
      tail |> do_keep(function, [head | accumulator])
    else
      tail |> do_keep(function, accumulator)
    end
  end

  defp do_keep([], _function, accumulator), do: accumulator |> :lists.reverse()
end
