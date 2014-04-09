
offline = Rack::Offline.configure do

  public_path = Rails.public_path
  Dir[public_path.join("javascripts/*.js")].each do |file|
    cache file.relative_path_from(public_path)
  end

  network "/"
end

