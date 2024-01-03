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

    email = new_email(
          to: to,
          from: "support@tauob1.com",
          subject: subject,
          text_body: body
        )
        ObMailer.deliver_now(email)
    ObMailer.deliver_email(email)
  end

  def perform(%{args: %{"email" => email}}) do
    email = new_email(
          to: to,
          from: "support@tauob1.com",
          subject: subject,
          text_body: body
        )
        ObMailer.deliver_now(email)
    ObMailer.deliver_email(email)
  end
end
