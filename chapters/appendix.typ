#import "../config/common.typ": *

#set heading(numbering: none)

// --- Appendix Separator ---
#set page(numbering: none)
#align(center + horizon)[#text(size: 20pt)[*ภาคผนวก*]]
#pagebreak()

// --- Appendix A ---
#align(center + horizon)[
  #text(size: 20pt)[*ภาคผนวก ก*]
  
  #text(size: 16pt)[รายงานการปฏิบัติงานสหกิจศึกษา]
]
#pagebreak()

#set page(numbering: "1") // Resume numbering if needed, but checklist says no numbers for separator pages.
// Actually checklist says "หน้าคั่นภาคผนวก ก ข และ ค ไม่ใส่เลขหน้า" 
// and "ภาคผนวก - ไม่ระบุเลขหน้า แต่นับ" 
// This usually means we use 'counter(page).step()' but don't display it.

#set page(numbering: none) // Following checklist: don't show numbers

== รายงานการปฏิบัติงานสหกิจศึกษาประจำวัน

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  table.header([*วันที่*], [*รายละเอียดงานที่ปฏิบัติ*]),
  [26/01/2569], [
    - Download certificate จาก GCS เป็น ZIP ผ่าน Backend storage
    - แก้ไข Sign URL ให้ใช้งานได้
    - Mockup certificate 200 ฉบับบน GCS และ Database production
    - เริ่มออกแบบ BC5 และ Implement ส่วน Data / API Test
  ],
  [27/01/2569], [
    - Integrate download certificate ZIP กับ Frontend
    - ปรึกษา DevOps เรื่องการใช้ Redis บน Beta
    - Deploy SignURL ผ่าน Cloudflare และจัดการ GCS
    - Implement BC4 และตรวจสอบความถูกต้อง Data BC1-BC5
  ],
  [28/01/2569], [
    - Implement UI ของ Blueprint ที่ 3
    - เพิ่ม Monitoring Lib ใน MyAcademy และ Deploy บน Beta
    - เพิ่ม File path ใน Certificate seed data
    - Integrate Frontend/Backend สำหรับ download certificate ZIP
    - Refactor Bruno structure ให้สะท้อนกับ Blueprint
  ],
  [29/01/2569], [
    - พัฒนา Loading file function และ Component
    - ทดสอบ API BC2 และข้อมูลทดสอบ
    - แก้ไขระบบค้นหาชื่อใน Course report
    - ออกแบบและ Implement Blueprint 4
    - ตรวจสอบ Data flow และ Tests ที่เกี่ยวข้อง
  ],
  [30/01/2569], [
    - ทดสอบ API BC2 และตรวจสอบความถูกต้อง (RowPerPage, Search)
    - ออกแบบ UI ร่วมกับ Stitch
    - เริ่มใช้กลยุทธ์ Micro-PR ในการพัฒนา
    - Deploy BC2-3 บน Develop และ Staging
    - เขียนบทความเกี่ยวกับ Security Awareness
  ],
  [02/02/2569 - 03/02/2569], [
    - เรียนรู้ Sprint Planning
    - วางแผนโครงสร้าง Pull Request
    - ออกแบบ UI BC6-10 และวางแผน Kanban board
    - Deploy Blueprint 3 ไปยัง Beta stage
    - พัฒนาหน้า Edit Course และ Lesson (รวม Video upload)
  ],
  [04/02/2569 - 06/02/2569], [
    - พัฒนาระบบลบ Course และ Lesson
    - ออกแบบ Blueprint สำหรับ BC ต่างๆ
    - เชื่อมต่อฐานข้อมูลรูปแบบใหม่บน Beta
    - จัดการข้อผิดพลาด FFMPEG บน Develop branch
    - รวม Feature 0.5, 0.6, 0.7 เข้า Master
  ],
  [09/02/2569 - 13/02/2569], [
    - พัฒนา POC FFmpeg Worker และจัดทำเอกสาร
    - ปรับปรุง Scenario 6, 8 และ Test Data
    - ตรวจสอบ Integration Frontend/Backend Scenario 6-8
    - จัดทำ ADR สำหรับ Video Processing Worker
    - ทดสอบระบบส่งอีเมลสำหรับผู้ใช้จำนวนมาก
  ],
  [16/02/2569 - 20/02/2569], [
    - พัฒนา Assessment feature (Pre/Post/Evaluate) ให้สมบูรณ์
    - จัดทำ Sprint Planning และวางแผน Demo
    - พัฒนา Feature Lesson Progress
    - ปรับปรุง Academy Home Page สำหรับการลงทะเบียน
    - Deploy Beta พร้อม Video Processing Worker
  ],
  [23/02/2569 - 27/02/2569], [
    - ตรวจสอบความสมบูรณ์ของ MVP Scenarios ทั้งหมด
    - Refactor Unit Test และ API Test
    - จัดทำเล่มรายงานสหกิจศึกษา
    - จัดการ Migration file สำหรับขึ้น Beta
    - Seed data และตรวจสอบความถูกต้องบนระบบ Beta
  ],
  [04/03/2569 - 16/03/2569], [
    - จัดทำเล่มรายงานฉบับสมบูรณ์
    - แก้ไข Bug Certificate error 404 บน Production
    - เพิ่มเงื่อนไขการเผยแพร่หลักสูตร (ต้องมี Lesson)
    - แก้ไขการแสดงผล Total Enrolled และ QR-Code
    - วาง Roadmap และ Backlog ใหม่
  ]
)

#pagebreak()

// --- Appendix B ---
#align(center + horizon)[
  #text(size: 20pt)[*ภาคผนวก ข*]

  #text(size: 16pt)[แผนการดำเนินงานตามเอกสาร IN-S006]
]
#pagebreak()

#set page(
  background: none,
  numbering: none,
)

#for i in range(1, 3) {
  image("/IN-S006-JACK.pdf", width: 100%, fit: "contain", page: i)
  if i < 2 { pagebreak() }
}

