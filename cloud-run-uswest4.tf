# Ensure a Cloud Run service deployed in the uswest4 region of GCP in Las Vegas


resource "google_cloud_run_service" "uswest4" {
  name     = "cr-uswest4-hello"
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