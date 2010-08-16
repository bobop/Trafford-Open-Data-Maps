module RecyclingSitesHelper
  def sites_with(item)
    sites = RecyclingSite.all(:conditions => ["facilities LIKE ?","%#{item}%"])
  end
end
