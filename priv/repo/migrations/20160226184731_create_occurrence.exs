defmodule ErrorCop.Repo.Migrations.CreateOccurrence do
  use Ecto.Migration

  def change do
    create table(:occurrences, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :log_id, references(:logs, on_delete: :nothing, type: :binary_id)

      timestamps
    end
    create index(:occurrences, [:log_id])

  end
end
