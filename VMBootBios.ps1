$vmName = 'server01'
$vm = get-vm -name $vmName | Get-View
$boot = New-Object VMware.Vim.VirtualMachineBootOptions
$boot.EnterBIOSSetup=$false
$config = New-Object VMware.Vim.VirtualMachineConfigSpec
$config.BootOptions = $boot
$vm.ReconfigVM($config)



