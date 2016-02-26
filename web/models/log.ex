defmodule ErrorCop.Log do
  use ErrorCop.Web, :model

  schema "logs" do
    field :message, :string
    field :stacktrace, {:array, :string}
    field :envivonment, :string
    field :log_hash, :string
    belongs_to :project, ErrorCop.Project

    timestamps
  end

  @required_fields ~w(message stacktrace envivonment log_hash)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
