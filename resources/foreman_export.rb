#
# Author:: Mark Sonnabaum <mark.sonnabaum@acquia.com>
# Cookbook Name:: application_foreman
# Resource:: foreman_export
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include ApplicationCookbook::ResourceBase

attribute :format, :kind_of => [String, NilClass], :default => "upstart"
attribute :location, :kind_of => [String, NilClass], :default => "/etc/init"
attribute :app, :kind_of => [String, NilClass], :default => "app"
attribute :log, :kind_of => [String, NilClass], :default => "/var/log/app"
attribute :user, :kind_of => [String, NilClass], :default => "app"
attribute :env, :kind_of => [Hash, NilClass]
attribute :template_dir, :kind_of => [String, NilClass]
attribute :foreman_command, :kind_of => [String, NilClass], :default => "foreman"
