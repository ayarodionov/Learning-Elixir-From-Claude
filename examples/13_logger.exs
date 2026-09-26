require Logger
Logger.configure(level: :info)
c = :counters.new(1, [])
expensive = fn -> :counters.add(c, 1, 1); "big" end
Logger.debug("state: #{expensive.()}")
IO.inspect(:counters.get(c, 1), label: "Logger.debug with interpolation at level :info, evaluations")
Logger.debug(fn -> "state: #{expensive.()}" end)
IO.inspect(:counters.get(c, 1), label: "after fn form, evaluations")
msg = "state: #{expensive.()}"
Logger.debug(msg)
IO.inspect(:counters.get(c, 1), label: "message built in a variable first, evaluations")

Logger.metadata(request_id: "abc123")
t = Task.async(fn -> Logger.metadata() end)
IO.inspect(Task.await(t), label: "metadata inside Task.async")
IO.inspect(Logger.metadata(), label: "metadata in caller")
