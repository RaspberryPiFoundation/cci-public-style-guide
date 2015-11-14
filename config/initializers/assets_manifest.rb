class AssetManifest
  def self.manifest
    if File.exists?("rev-manifest.json")
      @manifest ||= JSON.parse(File.read("rev-manifest.json"))
    end
  end

  def self.stylesheet_path(url)
    if AssetManifest.manifest
      url += ".css" unless url.end_with?(".css")
      AssetManifest.manifest[url] || url
    else
      url
    end
  end

  def self.javascript_path(url)
    if AssetManifest.manifest
      url += ".js" unless url.end_with?(".js")
      AssetManifest.manifest[url] || url
    else
      url
    end
  end

  def self.asset_path(url)
    if AssetManifest.manifest
      AssetManifest.manifest[url] || url
    else
      url
    end
  end
end
