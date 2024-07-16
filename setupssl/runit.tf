resource "null_resource" "PowerShellScriptRunAlways" {
   
    provisioner "local-exec" {
        command = "ECHO Y | .'${path.module}\\helpers\\ssl.ps1' "
        interpreter = ["PowerShell", "-Command"]
    }
}
