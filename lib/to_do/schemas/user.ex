defmodule ToDo.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias ToDo.Repo
  alias __MODULE__

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :name, :string
    field :email, :string
    field :birthdate, :date

    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:name, :email, :birthdate])
    |> validate_required([:name, :email, :birthdate])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> update_change(:email, &String.downcase/1)
    |> validate_change(:birthdate, fn field, birthdate ->
      age =
        Timex.Interval.new(from: birthdate, until: date_module().today())
        |> Timex.Interval.duration(:years)

      if age >= 18 do
        []
      else
        [birthdate: "user is underage"]
      end
    end)
  end

  def add(attrs) do
    %User{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def list do
    Repo.all(User)
  end

  def search(email) do
    from(User,
      where: [email: ^email]
    )
    |> Repo.one()
  end

  def delete(email) do
    from(User,
      where: [email: ^email]
    )
    |> Repo.delete_all()
  end

  defp date_module() do
    Application.get_env(:to_do, :date_module)
  end
end
