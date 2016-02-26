defmodule ErrorCop.ErrorApiController do
  use ErrorCop.Web, :controller
  alias ErrorCop.Repo

  def errors(conn, params) do
    IO.inspect params
    project = Repo.get! ErrorCop.Project, params["api_key"]
    log_hash = calculate_log_hash(params["error"]["message"], params["error"]["stacktrace"])
    log = %ErrorCop.Log{
      message: params["error"]["message"],
      stacktrace: params["error"]["stack_trace"],
      environment: params["error"]["environment"],
    }
    json conn, %{status: :ok}
  end

  defp calculate_log_hash(message, stacktrace) do
    :erlang.md5("#{message}#{stacktrace}")
    |> Base.encode16
  end
end