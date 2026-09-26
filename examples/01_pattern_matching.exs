defmodule G do
  def kind(x) when map_size(x) > 0 or is_list(x), do: :ok
  def kind(_), do: :other
  def kind2(x) when is_map(x) and map_size(x) > 0, do: :ok
  def kind2(x) when is_list(x), do: :ok
  def kind2(_), do: :other
end
IO.inspect(G.kind([1]), label: "or-guard on list")
IO.inspect(G.kind2([1]), label: "split guards on list")

defmodule User do
  @enforce_keys [:email]
  defstruct [:email, :name]
end
IO.inspect(struct(User, name: "a"), label: "struct/2 ignores enforce_keys")
try do
  struct!(User, name: "a")
rescue e -> IO.inspect(e.__struct__, label: "struct!/2")
end

defaults = [timeout: 5000, retries: 3]
opts = [timeout: 100]
IO.inspect(Keyword.get(defaults ++ opts, :timeout), label: "defaults ++ opts")
IO.inspect(Keyword.get(Keyword.merge(defaults, opts), :timeout), label: "Keyword.merge")

expected = :ok
res = case :error do
  expected -> {:matched, expected}
end
IO.inspect(res, label: "unpinned case")

System.put_env("FEATURE_X", "false")
IO.inspect(if(System.get_env("FEATURE_X"), do: :on, else: :off), label: "env 'false'")
