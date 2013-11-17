#
# Cookbook Name:: datacenter
# Recipe:: common
#
# Copyright 2013, TYPO3 Association
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

node.set[:postfix][:aliases][:root] = %w{
  michael.stucki@typo3.org
  peter.niederlag@typo3.org
  steffen.gebert@typo3.org
  bastian.bringenberg@typo3.org
  fabien.udriot@typo3.org
}
node.set[:postfix][:aliases][:bbringenberg] = 'bastian.bringenberg@typo3.org'
node.set[:postfix][:aliases][:mstucki]      = 'michael.stucki@typo3.org'
node.set[:postfix][:aliases][:sgebert]      = 'steffen.gebert@typo3.org'
node.set[:postfix][:aliases][:pniederlag]   = 'peter.niederlag@typo3.org'
node.set[:postfix][:aliases][:fudriot]      = 'fabien.udriot@typo3.org'


%w{
  t3-chef-client  
  t3-chef-client::knife-lastrun  
  etckeeper::commit  
  sudo  
  base::production  
  t3-rkhunter  
  monit  
  monit::patches  
  monit::postfix  
  monit::ssh  
  monit::cron
}.each do |recipe|
  include_recipe recipe
end

# FIXME include roles
#  role[users_admin
#  role[backup
#  role[openssh-server
#  role[rsyslog_client

