# Objetivo: Configurar una clave de encriptación administrada por el cliente (CMEK) para usarla con recursos como Cloud Storage, BigQuery, o Compute Engine.

resource "google_kms_key_ring" "keyring" {
  name     = "webapp-keyring"
  location = "us-central1"
}

resource "google_kms_crypto_key" "crypto_key" {
  name            = "webapp-crypto-key"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "2592000s" # 30 días
  purpose         = "ENCRYPT_DECRYPT"
}

