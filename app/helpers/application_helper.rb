module ApplicationHelper

  def flash_message(name)
    if flash[name] #.any?
      content_tag :p, flash[name], class: "flash #{name}"
    end
  end

  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    link_to 'Test-Guru', "https://github.com/#{author}/#{repo}", target: "_blank"
  end
end
