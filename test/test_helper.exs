ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ErrorCop.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ErrorCop.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ErrorCop.Repo)

