// ตั้งค่า Font และกระดาษ
#set text(font: "TH Sarabun New", size: 16pt, lang: "th", style: "normal", weight: "regular")
#set page(paper: "a4", margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 2.5cm))

// ตั้งค่าการย่อหน้า (Indentation) และการจัดการพารากราฟ
#set par(
  first-line-indent: 1cm, // กำหนดระยะย่อหน้า 1 ซม. (ประมาณ 1 Tab)
  justify: true,
  leading: 0.65em, // ระยะห่างระหว่างบรรทัดในพารากราฟ
)

// บังคับให้พารากราฟที่ไม่พอในหน้าเดียวขยับไปหน้าใหม่ (Keep together)
// หมายเหตุ: หากพารากราฟยาวมากเกินกว่าหนึ่งหน้า จะทำให้เกิดปัญหากระดาษว่าง
#show par: set block(breakable: false)

// บังคับให้ย่อหน้าในพารากราฟแรกหลังหัวข้อด้วย — ลดช่องว่างแนวตั้งลง
#show heading: it => {
  it
  par(spacing: 0em, leading: 0em, text(size: 0pt, ""))
  v(-0.8em)
}

// การตั้งค่าภาพ (Figure)
#set figure(
  supplement: [ภาพที่],
  numbering: it => {
    let ch = counter("chapter").get().first()
    str(ch) + "-" + str(it)
  },
)

// การตั้งค่าหัวข้อ
#show heading.where(level: 1): it => {
  counter(figure.where(kind: image)).update(0)
  set align(center)
  set text(size: 18pt, weight: "bold")
  it
  v(1em)
}

#show heading.where(level: 2): it => {
  set text(size: 16pt)
  it
}

#show heading.where(level: 3): it => {
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

#include "chapters/list-of-figures.typ"
#pagebreak()

// เนื้อหาหลัก (Main Content) - ใช้เลขหน้าแบบอารบิก (1, 2, 3)
#set page(numbering: "1")
#counter(page).update(1)

#counter("chapter").update(1)
#include "chapters/ch01_intro.typ"
#pagebreak()
#counter("chapter").step()
#include "chapters/ch02_theory.typ"
#pagebreak()
#counter("chapter").step()
#include "chapters/ch03_method.typ"
#pagebreak()
#counter("chapter").step()
#include "chapters/ch04_result.typ"
#pagebreak()
#counter("chapter").step()
#include "chapters/ch05_summary.typ"
#pagebreak()

// ส่วนหลัง (Back Matter)
#include "chapters/bibliography.typ"
#pagebreak()
#include "chapters/appendix.typ"
#pagebreak()
#include "chapters/biography.typ"
