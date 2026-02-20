// ตั้งค่า Font และกระดาษ
#set text(font: "TH Sarabun New", size: 16pt, lang: "th")
#set page(paper: "a4", margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 2.5cm))

// ตั้งค่าการย่อหน้า (Indentation) และการจัดการพารากราฟ
#set par(
  first-line-indent: 1cm,  // กำหนดระยะย่อหน้า 1 ซม. (ประมาณ 1 Tab)
  justify: true,
  spacing: 1em,
  leading: 0.65em,         // ระยะห่างระหว่างบรรทัดในพารากราฟ
)

// บังคับให้พารากราฟที่ไม่พอในหน้าเดียวขยับไปหน้าใหม่ (Keep together)
// หมายเหตุ: หากพารากราฟยาวมากเกินกว่าหนึ่งหน้า จะทำให้เกิดปัญหากระดาษว่าง
#show par: set block(breakable: false)

// บังคับให้ย่อหน้าในพารากราฟแรกหลังหัวข้อด้วย
#show heading: it => {
  it
  par(text(size: 0pt, ""))
}

// การตั้งค่าหัวข้อ
#show heading.where(level: 1): it => {
  set align(center)
  set text(size: 18pt)
  set strong(delta: 500)
  it
}
#show heading.where(level: 2): it => {
  set text(size: 16pt)
  it
}

// การจัดการลิสต์ให้ไม่มีการย่อหน้าแบบพารากราฟ
#show list: set par(first-line-indent: 0pt)
#show enum: set par(first-line-indent: 0pt)
#show table: set par(first-line-indent: 0pt)

// หน้าปก
#include "chapters/cover-th.typ"
#pagebreak()
#include "chapters/cover-en.typ"
#pagebreak()

// ส่วนหน้า (Front Matter) - ใช้เลขหน้าแบบโรมัน (i, ii, iii)
#set page(numbering: "i")
#counter(page).update(1)

#include "chapters/certificate.typ"
#pagebreak()
#include "chapters/ack.typ"
#pagebreak()
#include "chapters/abstract.typ"
#pagebreak()

// สารบัญ
#outline(title: "สารบัญ", indent: 2em)
#pagebreak()

// เนื้อหาหลัก (Main Content) - ใช้เลขหน้าแบบอารบิก (1, 2, 3)
#set page(numbering: "1")
#counter(page).update(1)

#include "chapters/ch01_intro.typ"
#pagebreak()
#include "chapters/ch02_theory.typ"
#pagebreak()
#include "chapters/ch03_method.typ"
#pagebreak()
#include "chapters/ch04_result.typ"
#pagebreak()
#include "chapters/ch05_summary.typ"
#pagebreak()

// ส่วนหลัง (Back Matter)
#include "chapters/bibliography.typ"
#pagebreak()
#include "chapters/appendix.typ"
#pagebreak()
#include "chapters/biography.typ"
