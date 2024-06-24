require "vagrant_cloud"
require "httparty"

vagrant_token = ENV["VAGRANT_TOKEN"] || ""
vagrant_user = ENV["VAGRANT_USER"] || "ssplatt"
box_name = ENV["BOX_NAME"] || "centos-stream-9"
box_version = ENV["VERSION"] || "0.0.1"
box_path = ENV["BOX_PATH"] || "output/vagrant.box"

# Create a new client
client = VagrantCloud::Client.new(access_token: vagrant_token)

# Create a new version
client.box_version_create(
  username: vagrant_user,
  name: box_name,
  version: box_version,
  description: "new update"
)

# Request box upload URL
upload_url = client.box_version_provider_upload(
  username: vagrant_user,
  name: box_name,
  version: box_version,
  provider: "virtualbox"
)

# Upload box asset
uri = URI.parse(upload_url[:upload_path])
HTTParty.post(
  uri,
  body: {
    file: box
  }
)

# Release the version
client.box_version_release(
  username: vagrant_user,
  name: box_name,
  version: box_version
)
