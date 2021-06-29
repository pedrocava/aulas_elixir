defmodule ToDo.Schemas.UserTest do
  use ToDo.DataCase
  alias ToDo.Schemas.User

  setup do
    user = %{id: "valor"}
    %{user: user}
  end

  describe "changeset/2" do
    test "email must have an @" do
      assert %{valid?: false} =
               %User{}
               |> User.changeset(%{name: "luiz", email: "without_at", birthdate: ~D[1995-09-14]})
    end

    # teste para validação de birthdate
  end
end
