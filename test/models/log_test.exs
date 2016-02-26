defmodule ErrorCop.LogTest do
  use ErrorCop.ModelCase

  alias ErrorCop.Log

  @valid_attrs %{envivonment: "some content", log_hash: "some content", message: "some content", stacktrace: []}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Log.changeset(%Log{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Log.changeset(%Log{}, @invalid_attrs)
    refute changeset.valid?
  end
end
