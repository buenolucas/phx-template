defmodule PhxTemplateWeb.PageController do
  use PhxTemplateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
