class ApplicationController < ActionController::API
  def token
    request.headers["Authorization"]
  end

  def encode_token
    JWT.encode({user_id: user_id}, "ceed")
  end

  def decode_token
    begin
      JWT.decode(token, "ceed")[0]["user_id"]
    rescue
      nil
    end
  end

  def curr_user
    User.find_by(id: decode_token)
  end
end
