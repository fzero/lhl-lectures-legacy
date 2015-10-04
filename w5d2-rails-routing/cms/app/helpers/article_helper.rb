module ArticleHelper

  def button_link(text, url)
    link_to text, url, class: 'btn btn-large'
  end

end
