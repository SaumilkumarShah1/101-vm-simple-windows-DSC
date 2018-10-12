Configuration WebsiteTest {

    Import-DscResource -ModuleName xPSDesiredStateConfiguration
    Import-DscResource -ModuleName xNetworking

    Node "SimpleWinVM" {
        <#
            Install windows features
        #>
        WindowsFeature InstallIIS {
            Name = "Web-Server"
            Ensure = "Present"
        }

    }
}
