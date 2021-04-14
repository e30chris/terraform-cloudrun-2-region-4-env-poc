# Ensure a Cloud Run service deployed in the uswest1 region of GCP in Oregon


resource "google_cloud_run_service" "uswest1" {
  name     = "cr-uswest1-hello"
  location = "us-west1"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
        env {
          name = "ENV"
          value = var.cr_environment
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}