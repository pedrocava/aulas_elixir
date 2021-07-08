ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(ToDo.Repo, :manual)

Mox.defmock(ToDo.MyDateMock, for: ToDo.MyDate)
Application.put_env(:to_do, :date_module, ToDo.MyDateMock)
