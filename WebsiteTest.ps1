Configuration WebsiteTest {

  param ($MachineName)
  

  Node $MachineName
  {
    #Install the IIS Role
    WindowsFeature IIS
    {
      Ensure = “Present”
      Name = “Web-Server”
    }

    #Install ASP.NET 4.5
    WindowsFeature ASP
    {
      Ensure = “Present”
      Name = “Web-Asp-Net45”
    }

     WindowsFeature WebServerManagementConsole
    {
        Name = "Web-Mgmt-Console"
        Ensure = "Present"
    }

	LocalConfigurationManager 
    {
        RebootNodeIfNeeded = $true
    }

	WindowsFeature DNS 
    { 
        Ensure = "Present" 
        Name = "DNS"		
    }

    Script EnableDNSDiags
	{
      	SetScript = { 
		    Set-DnsServerDiagnostics -All $true
            Write-Verbose -Verbose "Enabling DNS client diagnostics" 
        }
        GetScript =  { @{} }
        TestScript = { $false }
	    DependsOn = "[WindowsFeature]DNS"
    }

  }
}
