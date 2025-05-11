# Objetivo: Crear una política de presupuesto mensual para monitorear el gasto del proyecto y activar alertas al alcanzar ciertos umbrales.

resource "google_billing_budget" "monthly_budget" {
  billing_account = "000000-000000-000000"
  display_name    = "WebApp Monthly Budget"

  amount {
    specified_amount {
      currency_code = "USD"
      units         = 100
    }
  }

  threshold_rules {
    threshold_percent = 0.5
  }

  threshold_rules {
    threshold_percent = 0.9
  }

  all_updates_rule {
    pubsub_topic = "projects/my-project/topics/budget-alerts"
    schema_version = "1.0"
  }
}

