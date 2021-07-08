defmodule ToDo.Schemas.UserTest do
  use ToDo.DataCase
  alias ToDo.Schemas.User

  setup do
    user = %{id: "valor"}
    Mox.stub_with(ToDo.MyDateMock, ToDo.MyDateImpl)
    %{user: user}
  end

  describe "changeset/2" do
    test "email must have an @" do
      assert %{valid?: false} =
               %User{}
               |> User.changeset(%{name: "luiz", email: "without_at", birthdate: ~D[1995-09-14]})
    end

    test "birthdate validation" do
      Mox.expect(ToDo.MyDateMock, :today, 2, fn -> ~D[2021-07-08] end)

      assert %{valid?: false} =
               %User{}
               |> User.changeset(%{
                 name: "Teste",
                 email: "teste@123.com",
                 birthdate: ~D[2005-01-01]
               })

      assert %{valid?: true} =
               %User{}
               |> User.changeset(%{
                 name: "Teste",
                 email: "teste@123.com",
                 birthdate: ~D[1985-01-01]
               })
    end
  end
end
