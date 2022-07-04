class CookiesController < ApplicationController
  def set
    session[:current_user] = {
      test_id: {
        name: 'CookieJammer',
        client_id: '784325gqwhwq343242'
      }
    }

    cookies[:session_id] = 'test_id'
    redirect_to cookies_show_path
  end

  def show
    return unless cookies[:session_id]

    current_user = session[:current_user][cookies[:session_id]]
    @user_alias = current_user[:name.to_s]
    @client_id = current_user[:client_id.to_s]
  end

  def delete
    cookies.delete :session_id
    
    redirect_to cookies_show_path
  end

  # def set
  #   cookies[:user_alias] = 'CookieJammer'
  #   cookies[:client_id] = '784325gqwhwq343242'

  #   redirect_to cookies_show_path
  # end
  
  # def show
  #   @user_alias = cookies[:user_alias]
  #   @client_id = cookies[:client_id]
  # end
  
  # def delete
  #   cookies.delete :user_alias
  #   cookies.delete :client_id

  #   redirect_to cookies_show_path
  # end 

end