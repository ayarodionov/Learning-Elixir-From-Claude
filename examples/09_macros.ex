defmodule Check do
  defmacro positive!(expr) do
    quote do
      if unquote(expr) > 0, do: unquote(expr), else: raise("not positive")
    end
  end
  defmacro positive_ok!(expr) do
    quote bind_quoted: [value: expr] do
      if value > 0, do: value, else: raise("not positive")
    end
  end
  defmacro set_x, do: quote(do: x = 1)
end
