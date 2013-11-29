# citrix_server_tuning cookbook
This cookbook is for optimizing a RDSH and/or Citrix XenApp or XenDesktop 7 hosted shared Windows 2008 R2 or Windows 2012 server.


# Requirements
This cookbook depends on the following
depends "windows"

# Usage
Use this cookbook on all RDSh installs by adding it to the run list
citrix_server_tuning::default


# Attributes
registry keys defined as attributes

default[:tuning][:run] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"
default[:tuning][:runonce] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\RunOnce"
default[:tuning][:run64] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Run"
default[:tuning][:runonce64] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\RunOnce"
default[:tuning][:errormode] = "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Windows"
default[:tuning][:disable] = "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Session Manager\\Memory Management"
default[:tuning][:desktop] = "HKEY_USERS\\.DEFAULT\\Control Panel\\Desktop"
default[:tuning][:worker] = "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Session Manager\\Executive"
default[:tuning][:filesystem] = "HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\FileSystem"
default[:tuning][:lanmanwork] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Lanmanworkstation\\Parameters"
default[:tuning][:config] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SessionManager\\Configuration Manager"
default[:tuning][:multi] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\MRxSmb\\Parameters"
default[:tuning][:explorer] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer"
default[:tuning][:lanmanserver] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Lanmanserver\\Parameters"
default[:tuning][:netcache] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\Currentversion\\NetCache"
default[:tuning][:opt] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\OptimalLayout"
default[:tuning][:bnns] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\BNNS\\Parameters"
default[:tuning][:tcpip] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters"
default[:tuning][:ctrl] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control"
default[:tuning][:tcpip6] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters"
default[:tuning][:dfss] = "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Quota System"
default[:tuning][:boot] = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Dfrg\\BootOptimizeFunction"

# Recipes

citrix_server_tuning::default

registry_key node[:tuning][:run] do
  action :create
end

registry_key node[:tuning][:runonce] do
  action :create
end

registry_key node[:tuning][:run64] do
  action :create
end

registry_key node[:tuning][:runonce64] do
  action :create
end

registry_key node[:tuning][:errormode] do
  values [{
    :name => "ErrorMode",
    :type => :dword,
    :data => 00000002
    }]
  action :create
end

registry_key node[:tuning][:disable] do
  values [{
    :name => "DisablePagingExecutive",
    :type => :dword,
    :data => 00000001
    }]
  action :create
end

registry_key node[:tuning][:desktop] do
  values [{
    :name => "ScreenSaveActive",
    :type => :dword,
    :data => "0"
    }]
  action :create
end

registry_key node[:tuning][:worker] do
  values [{
    :name => "AdditionalCriticalWorkerThreads",
    :type => :dword,
    :data => 00000064
    }]
  action :create
end
 
registry_key node[:tuning][:filesystem] do
  values [{
    :name => "NTSFDisable8dot3NameCreation",
    :type => :dword,
    :data => 0000001
    }]
  action :create
end
 
registry_key node[:tuning][:lanmanwork] do
  values [{
    :name => "MaxCmds",
    :type => :dword,
    :data => 2048
    }]
  action :create
end 

registry_key node[:tuning][:multi] do
  values [{
    :name => "MultiUserEnabled",
    :type => :dword,
    :data => 00000001
    }]
  action :create
end

registry_key node[:tuning][:explorer] do
  values [{
    :name => "NoRemoteRecursiveEvents",
    :type => :dword,
    :data => 00000001
    }]
  action :create
end

registry_key node[:tuning][:lanmanserver] do
  values [{:name => "MaxWorkItems", :type => :dword, :data => 8192},
          {:name => "MaxMpxCt", :type => :dword, :data => 2048},
          {:name => "MaxRawWorkItems", :type => :dword, :data => 512},
          {:name => "MaxFreeConnections", :type => :dword, :data => 100},
          {:name => "MinFreeConnections", :type => :dword, :data => 32}
         ] 
  recursive true
  action :create
end

registry_key node[:tuning][:lanmanwork] do
  values [{:name => "DisableBandwidthThrottling", :type => :dword, :data => 00000001},
          {:name => "DisableLargeMtu", :type => :dword, :data => 00000000}
         ]
  action :create
end

registry_key node[:tuning][:config] do
  values [{:name => "RegistryLazyFlushInterval", :type => :dword, :data => 00000060}
         ]
  recursive true      
  action :create 
end

registry_key node[:tuning][:disable] do
  values [{
    :name => "ClearPageFileAtShutdown",
    :type => :dword,
    :data => 00000000
    }]
  action :create
end

registry_key node[:tuning][:netcache] do
  values [{
    :name => "Enabled",
    :type => :dword,
    :data => 00000000
    }]
  action :create
end

registry_key node[:tuning][:opt] do
  values [{
    :name => "EnableAutoLayout",
    :type => :dword,
    :data => 00000000
    }]
  action :create
end

registry_key node[:tuning][:bnns] do
  values [{
    :name => "EnableOffload",
    :type => :dword,
    :data => 00000000
    }]
  recursive true 
  action :create
end  

registry_key node[:tuning][:tcpip] do
  values [{
    :name => "DisableTaskOffload",
    :type => :dword,
    :data => 00000001
    }]
  recursive true 
  action :create
end

registry_key node[:tuning][:ctrl] do
  values [{
    :name => "ServicesPipeTimeout",
    :type => :dword,
    :data => 00060000
    }]
  action :create
end

registry_key node[:tuning][:tcpip6] do
  values [{
    :name => "DisableComponents",
    :type => :dword,
    :data => 0xffffffff
    }]
  action :create
end

registry_key node[:tuning][:dfss] do
  values [{
    :name => "EnableCpuQuota",
    :type => :dword,
    :data => 00000000
    }]
  action :create
end

registry_key node[:tuning][:boot] do
  values [{
    :name => "Enable",
    :type => :dword,
    :data => "N"
    }]
  recursive true  
  action :create
end



# Author

Author:: Todd Pigram (<todd@toddpigram.com>)
