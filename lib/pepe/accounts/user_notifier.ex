defmodule Pepe.Accounts.UserNotifier do
  use Phoenix.Swoosh, view: PepeWeb.EmailView, layout: {PepeWeb.LayoutView, :email}

  @doc """
  Deliver instructions to confirm account.
  """
  def deliver_confirmation_instructions(user, url) do
    new()
    |> to({user.username, user.email})
    |> from({"Javier Soto", "sotoseattle@gmail.com"})
    |> subject("Confirm Confab Registration")
    |> render_body("confirmation_instructions.html", %{username: user.username, url: url})
    |> Pepe.Mailer.deliver()
  end

  @doc """
  Deliver instructions to reset a user password.
  """
  def deliver_reset_password_instructions(user, url) do
    new()
    |> to({user.username, user.email})
    |> from({"Javier Soto", "sotoseattle@gmail.com"})
    |> subject("Instructions to reset Confab password")
    |> render_body("reset_password_instructions.html", %{username: user.username, url: url})
    |> Pepe.Mailer.deliver()
  end

  @doc """
  Deliver instructions to update a user email.
  """
  def deliver_update_email_instructions(user, url) do
    new()
    |> to({user.username, user.email})
    |> from({"Javier Soto", "sotoseattle@gmail.com"})
    |> subject("Instructions to update Confab email")
    |> render_body("update_email_instructions.html", %{username: user.username, url: url})
    |> Pepe.Mailer.deliver()
  end
end
