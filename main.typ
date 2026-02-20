// ตั้งค่า Font และกระดาษ
#set text(font: "Sarabun", size: 14pt, lang: "th")
#set page(paper: "a4", margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 2.5cm))

// การตั้งค่าหัวข้อ
#show heading.where(level: 1): it => {
  set align(center)
  set text(size: 18pt)
  v(1em)
  it
  v(1em)
}
#show heading.where(level: 2): it => {
  set text(size: 16pt)
  v(0.5em)
  it
  v(0.5em)
}

// หน้าปก
#include "chapters/cover-th.typ"
#pagebreak()
#include "chapters/cover-en.typ"
#pagebreak()

// ส่วนหน้า (Front Matter) - ใช้เลขหน้าแบบโรมัน (i, ii, iii)
#set page(numbering: "i")
#counter(page).update(1)

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
#include "chapters/ch02_method.typ"
#pagebreak()
#include "chapters/ch03_result.typ"
#pagebreak()
#include "chapters/ch05_summary.typ"
#pagebreak()

// ส่วนหลัง (Back Matter)
#include "chapters/bibliography.typ"
#pagebreak()
#include "chapters/appendix.typ"
#pagebreak()
#include "chapters/biography.typ"
