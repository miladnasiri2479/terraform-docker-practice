# ماژول دیتابیس (Database Module)

این ماژول وظیفه راه‌اندازی دیتابیس PostgreSQL به همراه سیستم ذخیره‌سازی پایدار (Persistence) را دارد.

## منابع (Resources)

- **docker_volume.db_data**: ایجاد یک Volume مستقل در داکر برای ذخیره اطلاعات دیتابیس. این کار باعث می‌شود با پاک شدن کانتینر، داده‌ها از بین نروند.
- **docker_image.postgres**: دریافت و مدیریت Image رسمی PostgreSQL نسخه ۱۵ از Docker Hub.
- **docker_container.db**: ایجاد کانتینر دیتابیس. تنظیمات محیطی (Environment Variables) مثل نام کاربری و رمز عبور از اینجا به کانتینر تزریق می‌شود. همچنین Volume ایجاد شده به مسیر `/var/lib/postgresql/data` متصل (Mount) می‌شود.

## متغیرها (Variables)

- **db_volume_name**: نام Volume دیتابیس.
- **db_container_name**: نام کانتینر دیتابیس.
- **network_name**: نام شبکه‌ای که دیتابیس باید به آن وصل شود.
- **db_user / db_password / db_name**: اطلاعات دسترسی به دیتابیس.

## خروجی‌ها (Outputs)

- **db_container_name**: نام کانتینر دیتابیس.
- **db_ip**: آدرس IP داخلی دیتابیس در شبکه داکر.
