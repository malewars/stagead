resource "null_resource" "PowerShellScriptRunAlways" {
    triggers {
        trigger = "${uuid()}"
    }

    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\installad.ps1' -First 10"
        interpreter = ["PowerShell", "-Command"]
    }
}
