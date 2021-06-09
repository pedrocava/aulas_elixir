defmodule ToDo.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ToDo.Repo

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
      age = Timex.Interval.new(from: birthdate, until: Date.utc_today())
        |> Timex.Interval.duration(:years)

      if age >= 18 do
        []
      else
        [birthdate: "user is underage"]
      end
    end)
  end

  def add(attrs) do

    %__MODULE__{}
    |> changeset(attrs)
    |> Repo.insert()

  end

end
