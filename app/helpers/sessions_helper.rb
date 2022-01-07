module SessionsHelper
  def owner?(session)
    current_user and current_user == session.user
  end

  def joinable?(session)
    current_user and current_user != session.user and !session.users.include?(current_user)
  end

  def unjoinable?(session)
    current_user and current_user != session.user and session.users.include?(current_user)
  end

  def joined_by(session)
    if session.users.count == 0
      "noch keiner"
    else 
      session.users.map { |s| s.name }.join(', ')
    end
  end

  def visibility(session)
    if session.visibility == "public"
      return "öffentlich"
    end
    if session.visibility == "friends"
      return "freunde"
    end
    "privat"
  end
end
