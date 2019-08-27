module BadgesHelper
  def badge_image(badge)
    if badge.image_url.present?
      badge_image.url
    else
      asset_path 'award.png'
    end
  end
end
