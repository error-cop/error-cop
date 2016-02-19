defmodule ErrorCop.PageController do
  use ErrorCop.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
