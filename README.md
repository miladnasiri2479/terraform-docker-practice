# 🚀 زیرساخت به عنوان کد (IaC) - مدیریت داکر با ترافرم (نسخه حرفه‌ای)

این پروژه یک نمونه کامل و استاندارد از مدیریت زیرساخت (Infrastructure) با استفاده از **Terraform** بر روی **Docker** است که با متدولوژی‌های روز DevOps و معماری چند-محیطی (Multi-Environment) طراحی و پیاده‌سازی شده است. 

**توجه:** این مخزن (Repository) صرفاً جنبه **آموزشی** داشته و برای درک عمیق‌تر مفاهیم زیرساخت و یادگیری معماری‌های حرفه‌ای در ترافرم تهیه شده است.

---

## 🏗️ نگاه کلی به معماری (Architecture)

این سیستم از ساختار **ماژولار (Modular)** استفاده می‌کند. منطق اصلی زیرساخت در پوشه `modules/` قرار دارد و محیط‌های مختلف (Dev و Prod) تنها با فراخوانی این ماژول‌ها و مقداردهی متغیرهای اختصاصی خود، زیرساخت را ایجاد می‌کنند.

### ویژگی‌های کلیدی:
- **Zero-Downtime Updates:** استفاده از قانون `create_before_destroy` برای جلوگیری از قطع شدن سرویس هنگام آپدیت.
- **Isolations (جداسازی کامل):** جداسازی محیط‌های توسعه (Dev) و عملیات (Prod) از طریق دایرکتوری‌های مجزا (Directory-based isolation).
- **Scalability (مقیاس‌پذیری):** قابلیت افزایش تعداد کانتینرهای وب تنها با تغییر یک متغیر در فایل `tfvars`.
- **DRY Principle:** جلوگیری از تکرار کد و استفاده مجدد از ماژول‌ها در تمامی محیط‌ها.
- **Health Monitoring:** مانیتورینگ خودکار سلامت کانتینرها (Postgres و Nginx).
- **Ansible Ready:** تولید خودکار فایل Inventory برای مدیریت سریع با Ansible.

---

## 📂 ساختار پروژه‌ (Directory Structure)

```text
.
├── .github/workflows/      # مدیریت CI/CD با استفاده از GitHub Actions
├── modules/                # منطق اصلی زیرساخت (قابل استفاده مجدد)
│   ├── network/            # تنظیمات شبکه داخلی داکر (Bridge)
│   ├── db/                 # راه‌اندازی دیتابیس Postgres و Volumeها
│   └── web/                # کلاستر وب‌سرورهای Nginx با قابلیت اسکیل
├── environments/           # تنظیمات اختصاصی هر محیط
│   ├── dev/                # محیط توسعه (Sandbox)
│   └── prod/               # محیط عملیاتی (Production)
├── ansible/                # محل ذخیره فایل‌های تولید شده برای Ansible
└── terraform.tfvars.example # نمونه متغیرهای مورد نیاز پروژه
```

---

## 🛠️ راهنمای استقرار (Deployment Guide)

### ۱. پیش‌نیازها
- نصب بودن **Terraform** (نسخه ۱.۵.۰ به بالا)
- نصب و فعال بودن **Docker**
- نصب بودن **Git**

### ۲. تنظیم متغیرها
ابتدا فایل‌های نمونه را کپی کرده و مقادیر خود را جایگزین کنید:
```bash
cp terraform.tfvars.example terraform.tfvars
cp environments/dev/dev.tfvars.example environments/dev/dev.tfvars
```

### ۳. اجرای پروژه (مثلاً در محیط Dev)
```bash
cd environments/dev
terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars" -auto-approve
```

---

## ⚙️ تنظیمات و متغیرها (Configuration)

برای حفظ امنیت، فایل‌های حاوی مقادیر حساس در Git ذخیره نمی‌شوند. 
**نکته امنیتی:** تمامی فایل‌های `.tfvars` در `.gitignore` تعریف شده‌اند تا به اشتباه در مخزن آنلاین منتشر نشوند.

---

## 🔄 تفاوت محیط‌های مبتنی بر دایرکتوری و Terraform Workspaces

در این پروژه از هر دو متد برای مدیریت محیط‌ها استفاده شده است:

1.  **جداسازی مبتنی بر دایرکتوری (Directory-based Isolation):** برای جداسازی کامل فایل‌های State و تنظیمات Backend در محیط‌های `dev` و `prod`.
2.  **ترافرم ورک‌سپیس (Terraform Workspaces):** در لایه کد (Root main.tf) از `terraform.workspace` برای هوشمندسازی نام‌گذاری منابع و تفکیک آن‌ها در سطح Docker استفاده شده است.

---

## 🤖 اتصال به Ansible (Ansible Integration)

پس از اجرای `terraform apply` در هر محیط، یک فایل Inventory به صورت خودکار در مسیر `ansible/inventory.ini` تولید می‌شود:

1.  **تولید فایل داینامیک:** ترافرم IPهای کانتینرها را در گروه‌های `[webservers]` و `[dbservers]` می‌نویسد.
2.  **استفاده:**
    ```bash
    ansible-playbook -i ansible/inventory.ini your-playbook.yml
    ```

---

## 🧪 چرخه CI/CD (GitHub Actions)

پروژه دارای یک Pipeline حرفه‌ای در `.github/workflows/terraform.yml` است که با هر Push یا Pull Request کارهای زیر را انجام می‌دهد:
- بررسی فرمت کدها (`fmt`)
- اعتبارسنجی دستورات (`validate`)
- اجرای `plan` به صورت تستی برای هر دو محیط Dev و Prod.

---

## 📞 تماس و پشتیبانی

این پروژه برای اهداف آموزشی و عملیاتی طراحی شده است. در صورت نیاز به راهنمایی بیشتر، می‌توانید از طریق گیت‌هاب با من در ارتباط باشید! 🤘
