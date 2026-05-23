# SECURITY.md - Terrafrom Secret Management

## ⚠️ Chere Secrets tu State Khatarnakan?

Vaghti shoma ye variable ro `sensitive = true` mizarid, Terraform faqat tu "Output"-ha neshoonesh nemide. 
Vali **vagheiyat ine ke hameye in secret-ha be soorate Plain Text (matne sade) tu file-e `terraform.tfstate` zakhire mishan.**

### Risks:
1. **Access Control:** Har kasi ke be state file dastresi dashte bashe, database password-e shoma ro ham dare.
2. **Version Control:** Age eshtebahi state file ro push konid tu GitHub, hane mifahman!

### Best Practices:
- **Remote State with Encryption:** Az backend-haye cloudi mesle S3 estefade konid ke encryption at rest daran.
- **External Secret Manager:** Be jaye Terraform variables, az HashiCorp Vault ya AWS Secrets Manager estefade konid.
- **State Locking:** Hamishe state ro lock konid ta do nafar hamzaman taghyir nadan.
