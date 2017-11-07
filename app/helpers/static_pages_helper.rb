module StaticPagesHelper
  def full_title(title)
    base_title = "My Blog"
    if title == ""
      base_title
    else
      title + " | " + base_title
    end
  end
end
