Configuration WebsiteTest {

    Import-DscResource -ModuleName xPSDesiredStateConfiguration
    Import-DscResource -ModuleName xNetworking

    Node "webserver" {
        <#
            Install windows features
        #>
        WindowsFeature InstallIIS {
            Name = "Web-Server"
            Ensure = "Present"
        }

        WindowsFeature EnableWinAuth {
            Name = "Web-Windows-Auth"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]InstallIIS"
        }

        WindowsFeature EnableURLAuth {
            Name = "Web-Url-Auth"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]InstallIIS"
        }

        WindowsFeature HostableWebCore {
            Name = "Web-WHC"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]InstallIIS"
        }

    }
}
