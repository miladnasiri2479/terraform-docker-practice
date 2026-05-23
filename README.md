# 🚀 Docker Infrastructure as Code (IaC) - Professional Setup

In proje ye nemoone-ye herfei az modiriyat-e infrastructure ba **Terraform** ruye **Docker** hast ke ba standard-haye DevOps-e ruz (Enterprise Level) refactor shode.

---

## 🏗️ Architecture Overview

In system az sakhtar-e **Modular & Multi-Environment** estefade mikone. Logic-e asli-e infrastructure tu `modules/` neveshte shode va har environment (Dev/Prod) faghade ba dadan-e variable-haye makhsoos be khodesh, in module-haro seda mizane.

### Key Features:
- **Zero-Downtime Updates:** Ba estefade az `create_before_destroy` lifecycle.
- **Full Isolation:** State-haye Dev va Prod kamel az ham joda hastan (Directory-based isolation).
- **Scalability:** Ghabeliyat-e scale kardan-e container-haye Web faqat ba taghyir-e ye variable.
- **DRY Principle:** Code-haye tekrari hazf shode va module-ha reusable hastan.

---

## 📂 Project Structure

```text
.
├── modules/                # Core Infrastructure Logic
│   ├── network/            # Software Defined Network (SDN) setup
│   ├── db/                 # Persistent Database (Postgres) & Volumes
│   └── web/                # Scalable Nginx Web Cluster
└── environments/           # Environment Specific Deployments
    ├── dev/                # Development Sandbox
    │   ├── dev.tfvars      # Small footprint config
    │   └── main.tf         # Module orchestration
    └── prod/               # Production Environment
        ├── prod.tfvars     # High Availability config
        └── main.tf         # Module orchestration
```

---

## 🛠️ Deployment Guide

Baraye rah-andazi-e har environment, in marahel ro donbal konid:

### 1. Dev Environment (Test & Debug)
```bash
cd environments/dev
terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars" -auto-approve
```

### 2. Prod Environment (Live Traffic)
```bash
cd environments/prod
terraform init
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars" -auto-approve
```

---

## 📊 Comparison Table

| Feature | Development (Dev) | Production (Prod) |
| :--- | :--- | :--- |
| **Replicas** | 1 Container | 5+ Containers |
| **Isolation** | `dev-app-network` | `prod-marketing-app-network` |
| **Resource Prefix** | `dev-app` | `prod-marketing-app` |
| **External Port** | 8080 | 9000+ |
| **DB Persistence** | Yes (Volume) | Yes (Volume) |

---

## 🧠 Senior DevOps Principles Applied

1. **Reduction of Blast Radius:**
   Ba joda kardan-e folder-ha, age ruye Dev eshtebahi `terraform destroy` bezanid, infrastructure-e Prod aslan dast-khorde nemishe.

2. **Immutable Infrastructure:**
   Resource-ha be surate dasti taghyir nemikonan. Har taghyiri bayad az tarighe code va cycle-e `Apply` ijad beshe.

3. **Stateless vs Stateful Separation:**
   Database (Stateful) az Web (Stateless) joda shode ta modiriyat-e data va backup-giri asuntar beshe.

---

## 📞 Support
In proje tavasot-e **Gemini CLI** (Expert DevOps Agent) refactor va mustanad-sazi shode. Age soal ya moshkeli bud, dar khedmatim! 🤘
