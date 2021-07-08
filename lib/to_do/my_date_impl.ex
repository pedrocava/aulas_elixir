defmodule ToDo.MyDateImpl do
  @behaviour ToDo.MyDate

  @impl true
  def today do
    Date.utc_today()
  end
end
