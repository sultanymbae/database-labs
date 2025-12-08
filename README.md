📚 Database Course — Labs & Final Project

This repository belongs to Sultan Nurbekov and contains all work completed for the Database course at AUCA.
It includes:

🧪 Laboratory assignments

🗄️ SQL exercises and practice

🚗 Final project: Car Wash Center, designed and implemented using PostgreSQL

The purpose of this repository is to keep all course-related materials organized in one place and document my progress throughout the semester.

Backup & Recovery Strategy
🔹 Full backup (pg_dump)
Backup entire database:
pg_dump -U postgres -F c -f carwashcenter_backup.dump carwashcenter_db

Restore:
pg_restore -U postgres -d carwashcenter_db carwashcenter_backup.dump

link for the presentation 
https://www.canva.com/design/DAG65XDXHgY/FQ0NITjVt-qFhZNwtwHnPg/edit?utm_content=DAG65XDXHgY&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton
