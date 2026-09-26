fetch = fn id -> if id == 1, do: {:ok, %{active: false}}, else: {:error, :not_found} end
r = with {:ok, u} <- fetch.(1), true <- u.active, do: {:ok, u}
IO.inspect(r, label: "with, inactive user")
r2 = try do
  with {:ok, u} <- fetch.(1), true <- u.active do {:ok, u} else {:error, e} -> {:error, e} end
rescue e -> e.__struct__ end
IO.inspect(r2, label: "with + partial else")
IO.inspect(Integer.parse("12x"), label: "Integer.parse")
