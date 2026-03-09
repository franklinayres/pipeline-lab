terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "app" {
  name = "pipeline-lab:latest"
  build {
    path = "."
  }
}

resource "docker_container" "app_container" {
  image = docker_image.app.image_id
  name  = "pipeline_lab_container"
}