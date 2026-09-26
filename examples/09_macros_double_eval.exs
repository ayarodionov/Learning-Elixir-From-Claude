defmodule Run do
  require Check
  def go do
    c = :counters.new(1, [])
    next = fn -> :counters.add(c, 1, 1); :counters.get(c, 1) end
    a = Check.positive!(next.())
    IO.inspect({a, :counters.get(c, 1)}, label: "unquote twice {returned, calls}")
    :counters.put(c, 1, 0)
    b = Check.positive_ok!(next.())
    IO.inspect({b, :counters.get(c, 1)}, label: "bind_quoted {returned, calls}")
  end
end
Run.go()
