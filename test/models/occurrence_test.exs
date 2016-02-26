defmodule ErrorCop.OccurrenceTest do
  use ErrorCop.ModelCase

  alias ErrorCop.Occurrence

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Occurrence.changeset(%Occurrence{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Occurrence.changeset(%Occurrence{}, @invalid_attrs)
    refute changeset.valid?
  end
end
