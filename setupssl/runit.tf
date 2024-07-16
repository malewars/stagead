resource "null_resource" "PowerShellScriptRunAlways" {
    triggers {
        trigger = "${uuid()}"
    }

    provisioner "local-exec" {
        command = "ECHO Y | .'${path.module}\\helpers\\ssl.ps1' -First 10"
        interpreter = ["PowerShell", "-Command"]
    }
}
