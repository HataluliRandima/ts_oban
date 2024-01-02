defmodule TsOban.Workers.DailyEmail do

  import Bamboo.Email

  use Oban.Worker, queue: :events, max_attempts: 3, tags: ["user", "email"], unique: [period: 60]

  @impl Oban.Worker
  def perform(%Oban.Job{})  do

    manas = TsOban.Coders.listcodersfromlastday()
    IO.inspect(manas)
    if Enum.count(manas) == 0 do

  IO.puts("No users signed up since yesterday")
   else
  IO.puts("These users have joined since yesterday")
    for user <- manas do
   user.email

  end
  TsOban.ObMailer.deliver_many1(manas)
   end



  end





  end
