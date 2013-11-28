#
# Cookbook Name:: citrix_server_tuning
# Recipe:: default
#
# Copyright (C) 2013 Todd Pigram
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Citrix_Server_Tuning
registry_key "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run" do
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\RunOnce" do
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Run" do
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\RunOnce" do
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Windows" do
  values [{
    :name => "ErrorMode",
    :type => :dword,
    :data => 00000002
    }]
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Session Manager\\Memory Management" do
  values [{
    :name => "DisablePagingExecutive",
    :type => :dword,
    :data => 00000001
    }]
  action :create
end

registry_key "HKEY_USERS\\.DEFAULT\\Control Panel\\Desktop" do
  values [{
    :name => "ScreenSaveActive",
    :type => :dword,
    :data => "0"
    }]
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Session Manager\\Executive" do
  values [{
    :name => "AdditionalCriticalWorkerThreads",
    :type => :dword,
    :data => 00000064
    }]
  action :create
end
 
registry_key "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\FileSystem" do
  values [{
    :name => "NTSFDisable8dot3NameCreation",
    :type => :dword,
    :data => 0000001
    }]
  action :create
end
 
registry_key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Lanmanworkstation\\Parameters" do
  values [{
    :name => "MaxCmds",
    :type => :dword,
    :data => 2048
    }]
  action :create
end  

registry_key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\MRxSmb\\Parameters" do
  values [{
    :name => "MultiUserEnabled",
    :type => :dword,
    :data => 00000001
    }]
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer" do
  values [{
    :name => "NoRemoteRecursiveEvents",
    :type => :dword,
    :data => 00000001
    }]
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Lanmanserver\\Parameters" do
  values [{:name => "MaxWorkItems", :type => :dword, :data => 8192},
          {:name => "MaxMpxCt", :type => :dword, :data => 2048},
          {:name => "MaxRawWorkItems", :type => :dword, :data => 512},
          {:name => "MaxFreeConnections", :type => :dword, :data => 100},
          {:name => "MinFreeConnections", :type => :dword, :data => 32}
         ] 
  recursive true
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters" do
  values [{:name => "DisableBandwidthThrottling", :type => :dword, :data => 00000001},
          {:name => "DisableLargeMtu", :type => :dword, :data => 00000000}
         ]
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SessionManager\\Configuration Manager" do
  values [{:name => "RegistryLazyFlushInterval", :type => :dword, :data => 00000060}
         ]
  recursive true       
  action :create  
end

registry_key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management" do
  values [{
    :name => "ClearPageFileAtShutdown",
    :type => :dword,
    :data => 00000000
    }]
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\Currentversion\\NetCache" do
  values [{
    :name => "Enabled",
    :type => :dword,
    :data => 00000000
    }]
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\OptimalLayout" do
  values [{
    :name => "EnableAutoLayout",
    :type => :dword,
    :data => 00000000
    }]
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\BNNS\\Parameters" do
  values [{
    :name => "EnableOffload",
    :type => :dword,
    :data => 00000000
    }]
  recursive true  
  action :create
end   

registry_key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters" do
  values [{
    :name => "DisableTaskOffload",
    :type => :dword,
    :data => 00000001
    }]
  recursive true  
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control" do
  values [{
    :name => "ServicesPipeTimeout",
    :type => :dword,
    :data => 00060000
    }]
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters" do
  values [{
    :name => "DisableComponents",
    :type => :dword,
    :data => 0xffffffff
    }]
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Quota System" do
  values [{
    :name => "EnableCpuQuota",
    :type => :dword,
    :data => 00000000
    }]
  action :create
end

registry_key "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Dfrg\\BootOptimizeFunction" do
  values [{
    :name => "Enable",
    :type => :dword,
    :data => "N"
    }]
  recursive true  
  action :create
end