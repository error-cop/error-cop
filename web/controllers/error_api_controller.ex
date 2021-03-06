defmodule ErrorCop.ErrorApiController do
  use ErrorCop.Web, :controller
  alias ErrorCop.Repo

  def errors(conn, params) do
    IO.inspect params
    project = Repo.get! ErrorCop.Project, params["api_key"]
    log_hash = calculate_log_hash params["error"]["message"], params["error"]["stacktrace"]
    log = Repo.get_by ErrorCop.Log, log_hash: log_hash

    case log do
      nil ->
        log = %ErrorCop.Log{
          message: params["error"]["message"],
          stacktrace: params["error"]["stacktrace"],
          environment: params["error"]["environment"],
          log_hash: log_hash
        }
        {:ok, log} = Repo.insert log
        {:ok, occurrence} = Repo.insert %ErrorCop.Occurrence{log_id: log.id}
      log ->
        Repo.insert %ErrorCop.Occurrence{log_id: log.id}
    end

    json conn, %{status: :ok}
  end

  defp calculate_log_hash(message, stacktrace) do
    :crypto.hash(:sha256, "#{message}#{stacktrace}")
    |> Base.encode16
  end
end
