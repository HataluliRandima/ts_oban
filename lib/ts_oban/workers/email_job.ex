defmodule TsOban.Workers.EmailJob do
  @moduledoc """
  Defines an email delivery job responsible for delivering a mail to a single recipient.
  The job is set to attempt 3 times.

  Powered by `Oban`
  """

  alias TsOban.ObMailer
  import Bamboo.Email

  use Oban.Worker, queue: :events, max_attempts: 3, tags: ["user", "email"], unique: [period: 60]

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"to" => to, "subject" => subject, "body" => body}}) do
    email = new_email(
          to: to,
          from: "support@tauob1.com",
          subject: subject,
          text_body: body
        )
        ObMailer.deliver_now(email)


  end

end
