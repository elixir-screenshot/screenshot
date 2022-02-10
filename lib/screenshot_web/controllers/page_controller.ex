defmodule ScreenshotWeb.PageController do
  use ScreenshotWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
