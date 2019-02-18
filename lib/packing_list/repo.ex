defmodule PackingList.Repo do
  use Ecto.Repo,
    otp_app: :packing_list,
    adapter: Ecto.Adapters.Postgres
end
