s = "👍🏽"
IO.inspect({String.length(s), byte_size(s)}, label: "thumbs-up with skin tone {graphemes, bytes}")
name = String.duplicate("é", 200)
cut = String.slice(name, 0, 150)
IO.inspect({String.length(cut), byte_size(cut)}, label: "slice 150 graphemes {graphemes, bytes}")
IO.inspect(binary_part(name, 0, 151) |> String.valid?(), label: "binary_part at odd byte valid?")
composed = "café"; decomposed = "café"
IO.inspect({composed == decomposed, String.equivalent?(composed, decomposed)}, label: "{==, equivalent?}")
IO.inspect(Regex.match?(~r/^\w+$/, "café"), label: "~r/^\\w+$/ on café")
IO.inspect(Regex.match?(~r/^\w+$/u, "café"), label: "~r/^\\w+$/u on café")
ip = :inet.ntoa({10, 0, 0, 1})
IO.inspect(ip, label: ":inet.ntoa returns")
try do
  "IP: " <> ip
rescue e -> IO.inspect(e.__struct__, label: "\"IP: \" <> charlist")
end
IO.inspect("IP: #{ip}", label: "interpolation")
IO.inspect([7, 8, 9], label: "list of small ints")
