defmodule ToDo.Repo.Migrations.CreateTodoItem do
  use Ecto.Migration

  def change do
    create table("users", primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :email, :string
      add :birthdate, :date

      timestamps()
    end

    create table("todo_items", primary_key: false) do
      add :id, :binary_id
      add :content, :string
      add :checked, :boolean
      add :user_id, references("users")

      timestamps()
    end
  end
end
