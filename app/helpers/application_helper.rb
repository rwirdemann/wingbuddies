module ApplicationHelper
  include Pagy::Frontend

  def flashcolor(type)
    if type == "alert"
      return "is-danger"
    end

    "is-primary is-light"
  end
end
