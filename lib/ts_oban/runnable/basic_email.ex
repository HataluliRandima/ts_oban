defmodule TsOban.Runnable.BasicEmail do

  def hata do
    emails_to_send = [
      %{"to" => "hatalulirandima123@gmail.com", "subject" => "Greetings", "body" => "Hello, User 1!"},
      %{"to" => "user2@example.com", "subject" => "Special Offer", "body" => "Check out our latest offers, User 2!"}
    ]

    emails = [
      %{:to => "hatalulirandima123@gmail.com", :subject => "Greetings", :body => "Hello, User 1!"},
      %{:to => "hatalulirandima123@gmail.com", :subject => "Greetings", :body => "Hello, User 2!"},
      %{:to => "hatalulirandima123@gmail.com", :subject => "Greetings", :body => "Hello, User 3!"}

    ]

    Enum.each(emails_to_send, fn email ->
      email
      |> TsOban.Workers.EmailJob.new()
      |> Oban.insert()
    end)
  end

  def mine do
    # Retrieve completed jobs
completed_jobs = TsOban.Oban.Job
|> Oban.Query.completed()
|> TsOban.Repo.all()

IO.inspect completed_jobs
  end

end
