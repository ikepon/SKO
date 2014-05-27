module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # HTMLで書けない文字の実体参照と改行コードのHTMLへの置換を行う
  def hbr(target)
  target = html_escape(target)
  target.gsub(/\r\n|\r|\n/, "<br />")
  end
end
