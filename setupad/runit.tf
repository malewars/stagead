resource "null_resource" "PowerShellScriptRunAlways" {
    

    provisioner "local-exec" {
        command = "ECHO Y | .'${path.module}\\helpers\\installad.ps1' "
        interpreter = ["PowerShell", "-Command"]
    }
}
