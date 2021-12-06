```powershell
# 找到Hyper-V指定VM的进程ID
Get-WmiObject -Namespace 'root\virtualization\v2' -Class Msvm_ComputerSystem -Filter "ElementName = '210707fv5'"
__GENUS                                  : 2
__CLASS                                  : Msvm_ComputerSystem
__SUPERCLASS                             : CIM_ComputerSystem
__DYNASTY                                : CIM_ManagedElement
__RELPATH                                : Msvm_ComputerSystem.CreationClassName="Msvm_ComputerSystem",Name="EAE43A5D-86F9-4DE2-AED2-0B2374374A0F"
__PROPERTY_COUNT                         : 45
__DERIVATION                             : {CIM_ComputerSystem CIM_System, CIM_EnabledLogicalElement, CIM_LogicalElement...}
__SERVER                                 : WIN-31D2E2U3E32
__NAMESPACE                              : root\virtualization\v2
__PATH                                   : \\WIN-31D2E2U3E32\root\virtualization\v2:Msvm_ComputerSystem.CreationClassName="Msvm_ComputerSystem",Name="EAE43A5D-86F9-4DE2-AED2-0B2374374A0F"
AvailableRequestedStates                 : 
Caption                                  : 虚拟机
CommunicationStatus                      : 
CreationClassName                        : Msvm_ComputerSystem
Dedicated                                : 
Description                              : Microsoft 虚拟机
DetailedStatus                           : 
ElementName                              : c7
EnabledDefault                           : 2
EnabledState                             : 2
EnhancedSessionModeState                 : 3
FailedOverReplicationType                : 0
HealthState                              : 5
IdentifyingDescriptions                  : 
InstallDate                              : 20210730025715.006743-000
InstanceID                               : 
LastApplicationConsistentReplicationTime : 16010101000000.000000-000
LastReplicationTime                      : 16010101000000.000000-000
LastReplicationType                      : 0
LastSuccessfulBackupTime                 : 
Name                                     : EAE43A5D-86F9-4DE2-AED2-0B2374374A0F
NameFormat                               : 
NumberOfNumaNodes                        : 1
OnTimeInMilliseconds                     : 7277538
OperatingStatus                          : 
OperationalStatus                        : {2}
OtherDedicatedDescriptions               : 
OtherEnabledState                        : 
OtherIdentifyingInfo                     : 
PowerManagementCapabilities              : 
PrimaryOwnerContact                      : 
PrimaryOwnerName                         : 
PrimaryStatus                            : 
ProcessID                                : 3584
ReplicationHealth                        : 0
ReplicationMode                          : 0
ReplicationState                         : 0
RequestedState                           : 5
ResetCapability                          : 1
Roles                                    : 
Status                                   : OK
StatusDescriptions                       : {正常运行}
TimeOfLastConfigurationChange            : 20210812010637.151599-000
TimeOfLastStateChange                    : 20210812010637.138068-000
TransitioningToState                     : 
PSComputerName                           : WIN-31D2E2U3E32

# 获取进程信息
get-wmiobject win32_process -filter "ProcessId = 3584"
get-process -Id 3584

# 获取VMID
(Get-WmiObject -Namespace "root\virtualization\v2" -Class "Msvm_ComputerSystem" -Filter "ElementName = 'panabit513_勿删'").__relpath -match '\"(?<VMId>[A-Z0-9-]+)\"'
$Matches[1]

# 获取Hyper-V日志
Get-WinEvent -Filter 
```

# Powershell Get-WmiObject NameSpace ROOT\virtualization\v2 List
```powershell
__SystemClass
__thisNAMESPACE
__NAMESPACE
__Provider
__Win32Provider
__ProviderRegistration
__EventProviderRegistration
__ObjectProviderRegistration
__ClassProviderRegistration
__InstanceProviderRegistration
__MethodProviderRegistration
__PropertyProviderRegistration
__EventConsumerProviderRegistration
__IndicationRelated
__EventFilter
__EventConsumer
__FilterToConsumerBinding
__AggregateEvent
__TimerNextFiring
__Event
__InstanceOperationEvent
__InstanceCreationEvent
__MethodInvocationEvent
__InstanceModificationEvent
__InstanceDeletionEvent
__ExtrinsicEvent
CIM_Indication
CIM_ProcessIndication
CIM_AlertIndication
Msvm_StorageAlert
CIM_ClassIndication
CIM_ClassDeletion
CIM_ClassCreation
CIM_ClassModification
CIM_InstIndication
CIM_InstCreation
CIM_InstModification
CIM_InstDeletion
__SystemEvent
__EventDroppedEvent
__EventQueueOverflowEvent
__QOSFailureEvent
__ConsumerFailureEvent
__ClassOperationEvent
__ClassDeletionEvent
__ClassModificationEvent
__ClassCreationEvent
__NamespaceOperationEvent
__NamespaceModificationEvent
__NamespaceDeletionEvent
__NamespaceCreationEvent
__TimerEvent
__EventGenerator
__TimerInstruction
__AbsoluteTimerInstruction
__IntervalTimerInstruction
__SystemSecurity
CIM_ManagedElement
CIM_SettingData
Msvm_FeatureSettingData
Msvm_EthernetSwitchFeatureSettingData
Msvm_VirtualEthernetSwitchNicTeamingSettingData
Msvm_VirtualEthernetSwitchBandwidthSettingData
Msvm_EthernetSwitchHardwareOffloadSettingData
Msvm_EthernetSwitchPortFeatureSettingData
Msvm_EthernetSwitchPortTeamMappingSettingData
Msvm_EthernetSwitchPortIsolationSettingData
Msvm_EthernetSwitchPortVlanSettingData
Msvm_EthernetSwitchPortAclSettingData
Msvm_EthernetSwitchPortVfpSettingData
Msvm_EthernetSwitchPortMigrationQosSettingData
Msvm_EthernetSwitchPortRdmaSettingData
Msvm_EthernetSwitchPortBandwidthSettingData
Msvm_EthernetSwitchPortExtendedAclSettingData
Msvm_EthernetSwitchPortRoutingDomainSettingData
Msvm_EthernetSwitchPortProfileSettingData
Msvm_EthernetSwitchPortOffloadSettingData
Msvm_EthernetSwitchPortSecuritySettingData
CIM_VirtualSystemSettingData
Msvm_ReplicationSettingData
Msvm_VirtualSystemSettingData
CIM_VirtualEthernetSwitchSettingData
Msvm_VirtualEthernetSwitchSettingData
Msvm_VirtualFcSwitchSettingData
Msvm_DiskMergeSettingData
CIM_VirtualSystemMigrationSettingData
Msvm_VirtualSystemMigrationSettingData
CIM_ResourceAllocationSettingData
Msvm_KvpExchangeComponentSettingData
Msvm_ResourceAllocationSettingData
Msvm_SerialPortSettingData
CIM_StorageAllocationSettingData
Msvm_StorageAllocationSettingData
Msvm_SyntheticDisplayControllerSettingData
Msvm_GuestServiceInterfaceComponentSettingData
Msvm_HeartbeatComponentSettingData
Msvm_ShutdownComponentSettingData
Msvm_TimeSyncComponentSettingData
Msvm_VssComponentSettingData
Msvm_RdvComponentSettingData
CIM_EthernetPortAllocationSettingData
Msvm_EthernetPortAllocationSettingData
Msvm_SyntheticEthernetPortSettingData
Msvm_EmulatedEthernetPortSettingData
Msvm_MemorySettingData
Msvm_ProcessorSettingData
Msvm_VirtualLogicalUnitSettingData
Msvm_PciExpressSettingData
Msvm_GpuPartitionSettingData
Msvm_Synthetic3DDisplayControllerSettingData
Msvm_FcPortAllocationSettingData
Msvm_SyntheticFcPortSettingData
Msvm_VirtualSystemManagementServiceSettingData
Msvm_VirtualSystemMigrationServiceSettingData
Msvm_MetricServiceSettingData
CIM_VLANEndpointSettingData
Msvm_CopyFileToGuestSettingData
Msvm_SecuritySettingData
Msvm_SystemComponentSettingData
Msvm_NetworkEndpointSettingData
Msvm_BootSourceSettingData
Msvm_VirtualSystemExportSettingData
Msvm_FailoverNetworkAdapterSettingData
Msvm_CollectionReferencePointSettingData
Msvm_CollectionSettingData
Msvm_CollectionSnapshotExportSettingData
Msvm_TerminalServiceSettingData
Msvm_AssignableDeviceDismountSettingData
Msvm_AbstractResourcePoolSettingData
Msvm_ResourcePoolSettingData
Msvm_VirtualSystemReferencePointExportSettingData
Msvm_VirtualHardDiskSettingData
Msvm_ReplicationAuthorizationSettingData
Msvm_Synthetic3DServiceSettingData
Msvm_VirtualSystemMigrationNetworkSettingData
Msvm_GuestCommunicationServiceSettingData
Msvm_NetworkConnectionDiagnosticSettingData
Msvm_VirtualSystemReferencePointSettingData
Msvm_CollectionReferencePointExportSettingData
Msvm_VirtualSystemSnapshotSettingData
Msvm_ReplicationServiceSettingData
Msvm_EthernetPortData
Msvm_EthernetSwitchPortOffloadData
Msvm_EthernetSwitchPortBandwidthData
Msvm_EthernetSwitchData
Msvm_EthernetSwitchOperationalData
Msvm_EthernetSwitchHardwareOffloadData
Msvm_EthernetSwitchBandwidthData
CIM_ManagedSystemElement
CIM_LogicalElement
CIM_EnabledLogicalElement
CIM_System
CIM_ComputerSystem
Msvm_ComputerSystem
Msvm_PlannedComputerSystem
Msvm_VirtualEthernetSwitch
Msvm_VirtualFcSwitch
Msvm_PartitionableGpu
CIM_Service
Msvm_AssignableDeviceService
CIM_VirtualSystemMigrationService
Msvm_VirtualSystemMigrationService
CIM_VirtualSystemManagementService
Msvm_VirtualSystemManagementService
Msvm_VirtualEthernetSwitchManagementService
CIM_MetricService
Msvm_MetricService
Msvm_CollectionReferencePointService
Msvm_VirtualSystemReferencePointService
CIM_NetworkService
CIM_ForwardingService
CIM_SwitchService
CIM_TransparentBridgingService
Msvm_TransparentBridgingService
Msvm_GuestService
Msvm_VssService
Msvm_GuestFileService
Msvm_GuestCommunicationService
Msvm_CollectionSnapshotService
Msvm_ResourcePoolConfigurationService
Msvm_Synthetic3DService
Msvm_ReplicationService
Msvm_ImageManagementService
Msvm_CollectionManagementService
Msvm_SecurityService
Msvm_TerminalService
CIM_ResourcePoolConfigurationService
CIM_VirtualSystemSnapshotService
Msvm_VirtualSystemSnapshotService
CIM_LogicalDevice
Msvm_TimeSyncComponent
Msvm_GpuPartition
Msvm_HeartbeatComponent
CIM_UserDevice
CIM_Display
CIM_DesktopMonitor
Msvm_Keyboard
CIM_PointingDevice
Msvm_Ps2Mouse
Msvm_SyntheticMouse
Msvm_SyntheticKeyboard
CIM_USBDevice
CIM_TPM
Msvm_TPM
Msvm_PciExpress
CIM_ProtocolController
CIM_SCSIProtocolController
Msvm_SCSIProtocolController
Msvm_KvpExchangeComponent
Msvm_Physical3dGraphicsProcessor
Msvm_VssComponent
Msvm_ShutdownComponent
CIM_MediaAccessDevice
CIM_DiskDrive
Msvm_DiskDrive
CIM_DisketteDrive
Msvm_DisketteDrive
CIM_TapeDrive
CIM_CDROMDrive
CIM_DVDDrive
Msvm_DVDDrive
CIM_VideoHead
Msvm_VideoHead
CIM_Controller
CIM_IDEController
Msvm_IDEController
CIM_DisplayController
Msvm_S3DisplayController
Msvm_Synthetic3DDisplayController
Msvm_SyntheticDisplayController
CIM_SerialController
Msvm_SerialController
Msvm_DisketteController
Msvm_RdvComponent
CIM_LogicalPort
CIM_NetworkPort
CIM_EthernetPort
Msvm_EthernetSwitchPort
Msvm_InternalEthernetPort
Msvm_SyntheticEthernetPort
Msvm_ExternalEthernetPort
Msvm_EmulatedEthernetPort
CIM_FCPort
Msvm_SyntheticFcPort
Msvm_FcSwitchPort
Msvm_ExternalFcPort
CIM_WiFiPort
Msvm_WiFiPort
Msvm_SerialPort
Msvm_GuestServiceInterfaceComponent
CIM_StorageExtent
CIM_Memory
Msvm_Memory
CIM_LogicalDisk
Msvm_LogicalDisk
CIM_Processor
Msvm_Processor
Msvm_TerminalConnection
Msvm_EthernetSwitchExtension
CIM_ServiceAccessPoint
CIM_ProtocolEndpoint
Msvm_FcEndpoint
CIM_LANEndpoint
CIM_WiFiEndpoint
Msvm_WiFiEndpoint
Msvm_LANEndpoint
CIM_SwitchPort
CIM_VLANEndpoint
Msvm_VLANEndpoint
Msvm_NumaNode
Msvm_SecurityElement
CIM_Job
CIM_ConcreteJob
Msvm_ConcreteJob
Msvm_MigrationJob
Msvm_CopyFileToGuestJob
Msvm_StorageJob
Msvm_CollectionReferencePointExportJob
Msvm_VirtualSystemReferencePointExportJob
CIM_ResourcePool
Msvm_Synth3dVideoPool
Msvm_ProcessorPool
Msvm_ResourcePool
CIM_DynamicForwardingEntry
Msvm_DynamicForwardingEntry
Msvm_MountedStorageImage
CIM_SoftwareElement
CIM_BIOSElement
Msvm_BIOSElement
Msvm_ReplicationRelationship
Msvm_InstalledEthernetSwitchExtension
Msvm_ReplicationProvider
CIM_Capabilities
CIM_VirtualSystemMigrationCapabilities
Msvm_VirtualSystemMigrationCapabilities
CIM_ResourcePoolConfigurationCapabilities
Msvm_ExternalEthernetPortCapabilities
Msvm_ResourcePoolConfigurationCapabilities
Msvm_EthernetSwitchFeatureCapabilities
CIM_AllocationCapabilities
Msvm_AllocationCapabilities
CIM_EnabledLogicalElementCapabilities
Msvm_VirtualSystemCapabilities
CIM_VirtualSystemManagementCapabilities
Msvm_VirtualSystemManagementCapabilities
Msvm_VirtualEthernetSwitchManagementCapabilities
CIM_MetricServiceCapabilities
Msvm_MetricServiceCapabilities
CIM_View
Msvm_SummaryInformationBase
Msvm_SummaryInformation
Msvm_KvpExchangeDataItem
Msvm_VirtualSystemReferencePoint
Msvm_ReplicationStatistics
Msvm_PhysicalGPUInfo
CIM_BaseMetricDefinition
CIM_AggregationMetricDefinition
Msvm_AggregationMetricDefinition
Msvm_BaseMetricDefinition
CIM_Collection
Msvm_SnapshotCollection
CIM_CollectionOfMSEs
Msvm_VirtualSystemCollection
Msvm_ManagementCollection
Msvm_ReferencePointCollection
CIM_BaseMetricValue
CIM_AggregationMetricValue
Msvm_AggregationMetricValue
Msvm_BaseMetricValue
Msvm_MoveUnmanagedVhd
CIM_ElementCapabilities
Msvm_ElementCapabilities
Msvm_EthernetSwitchExtensionCapabilities
CIM_Component
CIM_SettingsDefineCapabilities
Msvm_SettingsDefineCapabilities
Msvm_FeatureSettingsDefineCapabilities
Msvm_BootSourceComponent
CIM_ConcreteComponent
Msvm_ConcreteComponent
CIM_SystemComponent
Msvm_HostedResourcePool
CIM_SystemBIOS
Msvm_SystemBIOS
Msvm_SystemComponent
CIM_SystemDevice
Msvm_SystemDevice
CIM_HostedResourcePool
CIM_VirtualSystemSettingDataComponent
Msvm_VirtualSystemSettingDataComponent
Msvm_GuestServiceInterfaceSettingDataComponent
CIM_ServiceComponent
CIM_SwitchServiceTransparentBridging
Msvm_VirtualSystemMigrationServiceSettingDataC...
Msvm_SettingDataComponent
Msvm_EthernetPortFailoverSettingDataComponent
Msvm_EthernetPortSettingDataComponent
Msvm_VirtualEthernetSwitchSettingDataComponent
CIM_Dependency
CIM_MetricDefForME
Msvm_MetricDefForME
Msvm_MetricCollectionDependency
CIM_MetricForME
Msvm_MetricForME
CIM_ConcreteDependency
Msvm_ConcreteDependency
CIM_HostedDependency
Msvm_HostedDependency
Msvm_SystemTerminalConnection
CIM_HostedService
Msvm_HostedService
Msvm_HostedSwitchService
CIM_HostedAccessPoint
CIM_PortOnDevice
Msvm_SerialPortOnSerialController
CIM_VideoHeadOnController
Msvm_VideoHeadOnController
Msvm_HostedEthernetSwitchExtension
CIM_ElementView
Msvm_ComputerSystemSummaryInformation
Msvm_ReferencePointOfVirtualSystem
Msvm_SystemReplicationRelationship
CIM_SnapshotOfVirtualSystem
Msvm_SnapshotOfVirtualSystem
CIM_LastAppliedSnapshot
Msvm_LastAppliedSnapshot
CIM_MostCurrentSnapshotInBranch
Msvm_MostCurrentSnapshotInBranch
Msvm_ReplicaSystemDependency
Msvm_ElementAllocatedFromNumaNode
CIM_ElementAllocatedFromPool
Msvm_ElementAllocatedFromPool
Msvm_ParentChildSettingData
CIM_ServiceSAPDependency
CIM_ForwardsAmong
CIM_SwitchesAmong
CIM_ResourceAllocationFromPool
Msvm_ResourceAllocationFromPool
Msvm_ResourceDependentOnResource
CIM_SAPSAPDependency
CIM_ActiveConnection
Msvm_ActiveConnection
Msvm_FcActiveConnection
CIM_BindsTo
CIM_BindsToLANEndpoint
Msvm_BindsToLANEndpoint
CIM_SwitchPortDynamicForwarding
Msvm_SwitchPortDynamicForwarding
Msvm_ServiceOfVssComponent
CIM_ProtocolControllerForDevice
CIM_ProtocolControllerForUnit
Msvm_ProtocolControllerForUnit
Msvm_ReferencePointOfVirtualSystemCollection
Msvm_VirtualEthernetSwitchNicTeamingMember
CIM_DeviceSAPImplementation
Msvm_EthernetDeviceSAPImplementation
Msvm_WiFiDeviceSAPImplementation
Msvm_FcDeviceSAPImplementation
Msvm_DeviceSAPImplementation
CIM_MetricInstance
Msvm_MetricInstance
Msvm_ParentEthernetSwitchExtension
Msvm_EthernetSwitchInfo
CIM_BasedOn
Msvm_BasedOn
Msvm_RegisteredGuestService
CIM_DeviceConnection
CIM_ControlledBy
Msvm_ControlledBy
Msvm_SnapshotOfVirtualSystemCollection
Msvm_EthernetPortInfo
CIM_MediaPresent
Msvm_MediaPresent
CIM_TransparentBridgingDynamicForwarding
Msvm_TransparentBridgingDynamicForwarding
CIM_AffectedJobElement
Msvm_AffectedStorageJobElement
Msvm_AffectedJobElement
CIM_LogicalIdentity
Msvm_LogicalIdentity
CIM_SettingsDefineState
Msvm_SettingsDefineState
CIM_ElementSettingData
Msvm_ElementSettingData
Msvm_SystemExportSettingData
CIM_ServiceAffectsElement
Msvm_ServiceAffectsElement
CIM_MemberOfCollection
CIM_CollectedMSEs
Msvm_CollectedVirtualSystems
Msvm_CollectedSnapshots
Msvm_CollectedCollections
Msvm_CollectedReferencePoints
CIM_OwningJobElement
Msvm_OwningJobElement
CIM_ElementConformsToProfile
Msvm_ElementConformsToProfile
Msvm_GuestNetworkAdapterConfiguration
__NotifyStatus
__ExtendedStatus
CIM_Error
MSFT_WmiError
MSFT_ExtendedStatus
Msvm_Error
__SecurityRelatedClass
__Trustee
__NTLMUser9X
__ACE
__SecurityDescriptor
__PARAMETERS
Msvm_GuestClusterInformation
Msvm_CompatibilityVector
Msvm_VirtualHardDiskState
Msvm_VHDSetInformation
Msvm_VHDSnapshotInformation
Msvm_InteractiveSessionACE
Msvm_VirtualMachineToDisks
Msvm_NetworkConnectionDiagnosticInformation
Msvm_ServicingSettings
```

# Hyper-V Log Name
```powershell
Get-WinEvent -Listlog "*hyper-v*" | Select-Object LogName
Microsoft-Windows-Hyper-V-Compute-Admin
Microsoft-Windows-Hyper-V-Compute-Operational
Microsoft-Windows-Hyper-V-Config-Admin
Microsoft-Windows-Hyper-V-Config-Operational
Microsoft-Windows-Hyper-V-Guest-Drivers/Admin
Microsoft-Windows-Hyper-V-Guest-Drivers/Operational
Microsoft-Windows-Hyper-V-Hypervisor-Admin
Microsoft-Windows-Hyper-V-Hypervisor-Operational
Microsoft-Windows-Hyper-V-StorageVSP-Admin
Microsoft-Windows-Hyper-V-VID-Admin
Microsoft-Windows-Hyper-V-VMMS-Admin
Microsoft-Windows-Hyper-V-VMMS-Networking
Microsoft-Windows-Hyper-V-VMMS-Operational
Microsoft-Windows-Hyper-V-VMMS-Storage
Microsoft-Windows-Hyper-V-VmSwitch-Operational
Microsoft-Windows-Hyper-V-Worker-Admin

$filter= @{
    LogName= "Microsoft-Windows-Hyper-V*";
    Level=2;
    StartTime= $start
  }

Get-WinEvent -filterHashTable $filter

Get-WinEvent -FilterHashtable @{LogName='Microsoft-Windows-Hyper-V-VMMS-Admin'; Level=2}

# 创建Windows定时任务
# 主动上报虚拟机列表任务
Register-ScheduledJob -Name "Report Hyper V VM List" -ScriptBlock {powershell C:\zabbix\scripts\zbx_report_list.ps1} -RunEvery "01:00:00"
Register-ScheduledJob -Name "Report Hyper V VM Key basic" -ScriptBlock {powershell C:\zabbix\scripts\zbx_report_key_basic.ps1} -RunEvery "00:01:00"
Register-ScheduledJob -Name "Report Hyper V VM Key nic" -ScriptBlock {powershell C:\zabbix\scripts\zbx_report_key_nic.ps1} -RunEvery "00:01:00"
Register-ScheduledJob -Name "Report Hyper V VM Key disk" -ScriptBlock {powershell C:\zabbix\scripts\zbx_report_key_disk.ps1} -RunEvery "00:01:00"

Register-ScheduledJob -Name "Auto Stop Error VM" -ScriptBlock {powershell C:\zabbix\scripts\auto_stop_error_vm.ps1} -RunEvery "00:01:00"

################################################################################
Function CreateTask($TaskName, $Scripts){
$UserName = "SYSTEM"
$action_n = New-ScheduledTaskAction -Execute "powershell.exe $Scripts"
$Principal = New-ScheduledTaskPrincipal -UserID $UserName  -RunLevel Highest #使用最高权限运行
$TimeSpan = New-TimeSpan -Minutes 1
$tigger = New-ScheduledTaskTrigger -Once -At "00:00" -RepetitionInterval $TimeSpan
$task_n = New-ScheduledTask -Action $action_n -Principal $Principal -Trigger $tigger
Register-ScheduledTask -TaskName $TaskName -TaskPath "\Microsoft\Windows\PowerShell\ScheduledJobs\" -InputObject $task_n -User $UserName -Force
}
CreateTask("Report Hyper V VM List", "C:\zabbix\scripts\zbx_report_list.ps1")
CreateTask("Report Hyper V VM Key basic", "C:\zabbix\scripts\zbx_report_key_basic.ps1")
CreateTask("Report Hyper V VM Key nic","C:\zabbix\scripts\zbx_report_key_nic.ps1")
CreateTask("Report Hyper V VM Key disk","C:\zabbix\scripts\zbx_report_key_disk.ps1")

get-scheduledTask -TaskPath "\Microsoft\Windows\Powershell\*"
# 以上方法在2012上存在参数错误的情况
################################################################################
# 命令行创建任务计划
schtasks /create /tn "Report Hyper V VM List" /tr "powershell.exe C:\zabbix\scripts\zbx_report_list.ps1" /sc HOURLY /mo 1 /ru "System" /f
schtasks /create /tn "Report Hyper V VM Key basic" /tr "powershell.exe C:\zabbix\scripts\zbx_report_key_basic.ps1" /sc MINUTE /mo 1 /ru "System" /f
schtasks /create /tn "Report Hyper V VM Key nic" /tr "powershell.exe C:\zabbix\scripts\zbx_report_key_nic.ps1" /sc MINUTE /mo 1 /ru "System" /f
schtasks /create /tn "Report Hyper V VM Key disk" /tr "powershell.exe C:\zabbix\scripts\zbx_report_key_disk.ps1" /sc MINUTE /mo 1 /ru "System" /f
###############################################################################
# 命令行显示不完整
# $FormatEnumerationLimit=-1

# 防火墙设置
Set-NetFirewallProfile -Profile Public -Enabled false
Set-NetFirewallProfile -Profile Private -Enabled false
Get-NetFirewallProfile
New-NetFirewallRule -DisplayName "Ftp Download" -Direction Inbound -Program "C:\windows\system32\ftp.exe"  -Action Allow
New-NetFirewallRule -DisplayName "Pushgateway" -Direction Inbound -Program "C:\pushgateway\pushgateway.exe"  -Action Allow
```

```bash
ping $(ip a show dev eth0 | grep global | awk '{print $2}' | awk -F'.' '{print $1"."$2"."$3".236"}')
```