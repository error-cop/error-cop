defmodule ErrorCop.LogController do
  use ErrorCop.Web, :controller

  alias ErrorCop.Log

  plug :scrub_params, "log" when action in [:create, :update]

  def index(conn, params) do
    IO.inspect params
    logs = Repo.all(Log)
    render(conn, "index.html", logs: logs)
  end


  # def create(conn, %{"log" => log_params}) do
  #   changeset = Log.changeset(%Log{}, log_params)
  #
  #   case Repo.insert(changeset) do
  #     {:ok, _log} ->
  #       conn
  #       |> put_flash(:info, "Log created successfully.")
  #       |> redirect(to: log_path(conn, :index))
  #     {:error, changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end


  def show(conn, %{"id" => id}) do
    log = Repo.get!(Log, id)
    render(conn, "show.html", log: log)
  end
end
