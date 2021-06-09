
(
  %User{email: "aaaa"}
  |> User.changeset(%{name: "Pedro", email: "cava@", birthdate: "1997-01-03"})
  |> User.add()
)
