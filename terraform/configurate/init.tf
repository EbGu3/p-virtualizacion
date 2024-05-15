
resource "null_resource" "install-vue" {
  provisioner "local-exec" {
    command = "npm install -g @vue/cli"
  }
}

resource "null_resource" "build-hello-world" {
  provisioner "local-exec" {
    command = "npm --prefix  ..\\..\\src-ui\\hello-world run build"
  }
}

resource "null_resource" "copy-build" {
  provisioner "local-exec" {
    command = ".\\copy_build.sh"
  }
}

resource "null_resource" "download-nginx" {
  provisioner "local-exec" {
    command = "docker pull nginx"
  }
}

resource "null_resource" "build-container" {
  provisioner "local-exec" {
    command = "docker run --name my-nginx -d -p 8080:80 nginx"
  }
}

resource "null_resource" "" {
  provisioner "local-exec" {
    command = "docker run --name my-nginx -d -p 8080:80 nginx"
  }
}
