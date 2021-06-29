%User{email: "aaaa"}
|> User.changeset(%{name: "Pedro", email: "cava@", birthdate: "1997-01-03"})
|> User.add()

User.add(%{email: "cava@", name: "Pedro", birthdate: "1997-10-10"})

[1, 2, 3, 4]
|> Stream.map(&IO.inspect(&1 * &1))
|> Stream.map(&IO.inspect(&1 + 1))
|> Enum.take(10)

[1, 2, 3, 4]
|> Enum.map(&IO.inspect(&1 * &1))
|> Enum.map(&IO.inspect(&1 + 1))
|> Enum.take(10)
