module ApplicationHelper
  def fix_url(url)
    url.starts_with?("http") ? url : "http://#{url}"
  end

  def pretty_time(dt)
    dt.strftime("%m/%d/%Y %I:%M%P %Z")
  end
end
