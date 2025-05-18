# Crear una API Key en GCP y aplicar restricciones que limiten su uso a determinadas APIs y orígenes HTTP.

resource "google_apikeys_key" "frontend_api_key" {
  display_name = "Frontend WebApp Key"

  restrictions {
    api_targets {
      service = "maps.googleapis.com"
    }

    browser_key_restrictions {
      allowed_referrers = [
        "https://webapp.example.com/*"
      ]
    }
  }
}

