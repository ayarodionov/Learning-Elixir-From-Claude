defmodule H do
  require Check
  def go do
    Check.set_x()
    x
  end
end
