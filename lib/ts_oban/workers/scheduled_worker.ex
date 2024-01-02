defmodule MyApp.Workers.ScheduledWorker do
  use Oban.Worker, queue: :scheduled, max_attempts: 10

  alias TsOban.ObMailer

  import Bamboo.Email

  @one_day 60 * 60 * 24

  @impl true
  def perform(%{args: %{"email" => email} = args, attempt: 1}) do
    args
    |> new(schedule_in: @one_day)
    |> Oban.insert!()

    ObMailer.deliver_email(email)
  end

  def perform(%{args: %{"email" => email}}) do
    ObMailer.deliver_email(email)
  end
end
