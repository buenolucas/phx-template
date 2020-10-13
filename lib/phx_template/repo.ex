defmodule PhxTemplate.Repo do
  use Ecto.Repo,
    otp_app: :phx_template,
    adapter: Ecto.Adapters.MyXQL
end
