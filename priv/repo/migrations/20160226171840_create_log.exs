defmodule ErrorCop.Repo.Migrations.CreateLog do
  use Ecto.Migration

  def change do
    create table(:logs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :message, :string
      add :stacktrace, {:array, :string}
      add :envivonment, :string
      add :log_hash, :string
      add :project_id, references(:projects, on_delete: :nothing, type: :binary_id)

      timestamps
    end
    create index(:logs, [:project_id])

  end
end
