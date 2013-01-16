name             "application_foreman"
maintainer       "Mark Sonnabaum"
maintainer_email "mark.sonnabaum@acquia.com"
license          "Apache 2.0"
description      "Provides a foreman_export LWRP for exporting init config."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{ application }.each do |cb|
  depends cb
end
