Description
===========

This cookbook is for applying perfomance tuning to Windows Servers

Requirements
=============

Supported Platforms
-------------------
* Windows Server 2008 R2
* Windows Server 2012
* Windows Server 2012 R2


Cookbooks
---------
* windows

Usage
======

Add server_tuning::default to the run list.


Attributes
==========

server_tuning::default
----------------------

* default['tuning']['run'] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"
* default['tuning']['runonce'] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\RunOnce"
* default['tuning']['run64'] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Run"
* default['tuning']['runonce64'] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\RunOnce"
* default['tuning']['errormode'] = "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Windows"
* default['tuning']['disable'] = "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Session Manager\\Memory Management"
* default['tuning']['desktop'] = "HKEY_USERS\\.DEFAULT\\Control Panel\\Desktop"
* default['tuning']['worker'] = "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Session Manager\\Executive"
* default['tuning']['filesystem'] = "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\FileSystem"
* default['tuning']['lanmanwork'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters"
* default['tuning']['config'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Configuration Manager"
* default['tuning']['multi'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\MRxSmb\\Parameters"
* default['tuning']['explorer'] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer"
* default['tuning']['lanmanserver'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\LanmanServer\\Parameters"
* default['tuning']['netcache'] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\Currentversion\\NetCache"
* default['tuning']['opt'] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\OptimalLayout"
* default['tuning']['bnns'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\BNNS\\Parameters"
* default['tuning']['tcpip'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters"
* default['tuning']['ctrl'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control"
* default['tuning']['tcpip6'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters"
* default['tuning']['dfss'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Quota System"
* default['tuning']['boot'] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Dfrg\\BootOptimizeFunction"
* default['tuning']['defender'] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows Defender"
* default['tuning']['procsched'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\PriorityControl"
* default['tuning']['power'] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\explorer\\ControlPanel\\NameSpace\\{025A5937-A6BE-4686-A844-36FE4BEC8B6D}"
* default['tuning']['hibernation'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Power"
* default['tuning']['netlogon'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Netlogon\\Parameters"
* default['tuning']['timeout'] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control"
* efault['config']['autoupdate'] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\WindowsUpdate\\Auto Update"

Recipes
=======

server_tuning::default
----------------------

#Server_Tuning
registry_key node['tuning']['run'] do
  recursive true
  action :create
end

registry_key node['tuning']['runonce'] do
  recursive true
  action :create
end

registry_key node['tuning']['run64'] do
  recursive true
  action :create
end

registry_key node['tuning']['runonce64'] do
  recursive true
  action :create
end

registry_key node['tuning']['errormode'] do
  values [{
    :name => "ErrorMode",
    :type => :dword,
    :data => 00000002
    }]
  recursive true
  action :create
end

registry_key node['tuning']['disable'] do
  values [{
    :name => "DisablePagingExecutive",
    :type => :dword,
    :data => 00000001
    }]
  recursive true
  action :create
end

registry_key node['tuning']['desktop'] do
  values [{
    :name => "ScreenSaveActive",
    :type => :dword,
    :data => "0"
    }]
  recursive true
  action :create
end

Worker Threads
--------------

registry_key node['tuning']['worker'] do
  values [{
    :name => "AdditionalCriticalWorkerThreads",
    :type => :dword,
    :data => 64
    }]
  recursive true
  action :create
end
 
registry_key node['tuning']['filesystem'] do
  values [{
    :name => "NTSFDisable8dot3NameCreation",
    :type => :dword,
    :data => 0000001
    }]
  recursive true
  action :create
end

SMB 1.0 Tuning
--------------

registry_key node['tuning']['lanmanwork'] do
  values [{
    :name => "MaxCmds",
    :type => :dword,
    :data => 2048
    }]
  recursive true
  action :create
end

registry_key node['tuning']['multi'] do
  values [{
    :name => "MultiUserEnabled",
    :type => :dword,
    :data => 00000001
    }]
  recursive true
  action :create
end

registry_key node['tuning']['explorer'] do
  values [{
    :name => "NoRemoteRecursiveEvents",
    :type => :dword,
    :data => 00000001
    }]
  recursive true
  action :create
end
 
registry_key node['tuning']['lanmanserver'] do
  values [{:name => "MaxWorkItems", :type => :dword, :data => 8192},
          {:name => "MaxMpxCt", :type => :dword, :data => 2048},
          {:name => "MaxRawWorkItems", :type => :dword, :data => 512},
          {:name => "MaxFreeConnections", :type => :dword, :data => 100},
          {:name => "MinFreeConnections", :type => :dword, :data => 32}
         ] 
  recursive true
  action :create
end

SMB 2.x Client Tuning
---------------------
registry_key node['tuning']['lanmanwork'] do
  values [{:name => "DisableBandwidthThrottling", :type => :dword, :data => 00000001},
          {:name => "DisableLargeMtu", :type => :dword, :data => 00000000}
         ]
  action :create
end

registry_key node['tuning']['config'] do
  values [{
    :name => "RegistryLazyFlushInterval", 
    :type => :dword, 
    :data => 60
    }]
  recursive true
  action :create
end

registry_key node['tuning']['disable'] do
  values [{
    :name => "ClearPageFileAtShutdown",
    :type => :dword,
    :data => 00000000
    }]
  recursive true
  action :create
end

registry_key node['tuning']['netcache'] do
  values [{
    :name => "Enabled",
    :type => :dword,
    :data => 00000000
    }]
  recursive true
  action :create
end

registry_key node['tuning']['opt'] do
  values [{
    :name => "EnableAutoLayout",
    :type => :dword,
    :data => 00000000
    }]
  recursive true
  action :create
end

registry_key node['tuning']['bnns'] do
  values [{
    :name => "EnableOffload",
    :type => :dword,
    :data => 00000000
    }]
  recursive true
  action :create
end

registry_key node['tuning']['tcpip'] do
  values [{
    :name => "DisableTaskOffload",
    :type => :dword,
    :data => 00000001
    }]
  recursive true
  action :create
end

registry_key node['tuning']['ctrl'] do
  values [{
    :name => "ServicesPipeTimeout",
    :type => :dword,
    :data => 00060000
    }]
  recursive true
  action :create
end

registry_key node['tuning']['tcpip6'] do
  values [{
    :name => "DisableComponents",
    :type => :dword,
    :data => 0xffffffff
    }]
  recursive true
  action :create
end

registry_key node['tuning']['dfss'] do
  values [{
    :name => "EnableCpuQuota",
    :type => :dword,
    :data => 00000001
    }]
  recursive true
  action :create
end

registry_key node['tuning']['boot'] do
  values [{
    :name => "Enable",
    :type => :dword,
    :data => "N"
    }]
  recursive true
  action :create
end

Disable Windows Defender - Needs to be after Desktop Experience is installed
------------------------

registry_key node['tuning']['defender'] do
  values [{
    :name => "DisableAntiSpyware",
    :type => :dword,
    :data => 00000001
    }]
  recursive true
  action :create
end

Setting Processor scheudling to programs
-----------------------------------------

registry_key node['tuning']['procsched'] do
  values [{
    :name => "Win32PrioritySeparation",
    :type => :dword,
    :data => 0x00000026
    }]
  recursive true
  action :create
end

Set Power Option to High Performance
------------------------------------

registry_key node['tuning']['power'] do
  values [{
    :name => "PreferredPlan",
    :type => :string,
    :data => "8c5e7fda-e8bf-4a96-9ab5-a6e23a8c635c"
    }]
  recursive true
  action :create
end

Disable machine acct password changes
-------------------------------------

registry_key node['tuning']['netlogon'] do
  values [{
    :name => "DisablePasswordChange", 
    :type => :dword, 
    :data => 1
    }]
    recursive true
    action :create
end

Increase service startup timeout
---------------------------------

registry_key node['tuning']['timeout'] do
  values [{
    :name => "ServicePipeTimeout",
    :type => :dword,
    :data => 600000
    }]
    recursive true
    action :create
end

Set windows update to Check only
--------------------------------

registry_key node['config']['autoupdate'] do 
  values [{:name => "AUOptions", :type => :dword, :data => 00000002},
          {:name => "IncludeRecommendedUpdates", :type => :dword, :data => 00000000}
         ]
  action :create
end




License and Authors
===================

* Author:: Todd Pigram (<todd@toddpigram.com>)

Copyright:: 2013-2014, Todd Pigram

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
