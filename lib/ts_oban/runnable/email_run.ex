defmodule TsOban.Runnable.EmailRun do

import Bamboo.Email

def digest_email() do

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


  # email = new_email(
  #   to: to,
  #   from: "support@tauob1.com",
  #   subject: subject,
  #   text_body: body
  # )
  # ObMailer.deliver_now(email)

  #  base_email() |> subject("Daily Digest") |> to("myself@example.com") |> render("daily_digest.html", title: "Daily Digest Email", users: users)
end

# defp base_email do
#   new_email() |> from(@from) |> puthtmllayout({TutorialWeb.LayoutView, "email.html"}) # Set default layout |> puttextlayout({TutorialWeb.LayoutView, "email.text"}) # Set default text layout end end `
# end


# `erb <%= if Enum.count(@users) == 0 do %>

# No users signed up since yesterday
# <% else %>
# These users have joined since yesterday
# <%= for user <- @users do %> <%= user.email %> <% end %> <% end %> `



# Tutorial.Users.list_users_from_last_day() |> Tutorial.Emails.digest_email() |> Tutorial.Mailer.deliver_now()

end
