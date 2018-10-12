Configuration WebsiteTest {

    Import-DscResource -ModuleName xPSDesiredStateConfiguration
	param ($MachineName)

  Node $MachineName {
        <#
            Install windows features
        #>
        WindowsFeature InstallIIS {
            Name = "Web-Server"
            Ensure = "Present"
        }

    }
}
