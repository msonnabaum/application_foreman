#
# Author:: Mark Sonnabaum <mark.sonnabaum@acquia.com>
# Cookbook Name:: application_foreman
# Provider:: foreman_export
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

action :before_compile do
end

action :before_deploy do
end

action :before_migrate do
end

action :before_symlink do
end

action :before_restart do

    Chef::Log.info "Running foreman export"

    directory "#{new_resource.location}" do
      owner new_resource.owner
      group new_resource.group
      mode '0755'
    end

    directory "#{new_resource.log}" do
      owner new_resource.owner
      group new_resource.group
      mode '0755'
    end

    if new_resource.env
      env_file = "#{new_resource.path}/deploy_env"
      file env_file do
        content new_resource.env.map{|k,v| "#{k}=#{v}"}.join("\n")
        owner new_resource.owner
        group new_resource.group
        mode '0644'
      end
    end

    command = ["#{foreman_command} export #{new_resource.format} #{new_resource.location}"]
    command.push "--user=#{new_resource.user}" unless new_resource.user.nil?
    command.push "--app=#{new_resource.app}" unless new_resource.app.nil?
    command.push "--log=#{new_resource.log}" unless new_resource.log.nil?
    command.push "--env=#{env_file}" unless new_resource.env.nil?
    command.push "--template=#{new_resource.template_dir}" unless new_resource.template_dir.nil?

    execute command.join(" ") do
      cwd new_resource.release_path
      user new_resource.owner
    end
end

action :after_restart do
end

protected

def foreman_command
  new_resource.foreman_command
end
