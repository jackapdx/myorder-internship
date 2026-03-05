// ตั้งค่า Font และกระดาษ
#set text(font: "TH Sarabun New", size: 16pt, lang: "th", style: "normal", weight: "regular")
#set page(paper: "a4", margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 2.5cm))

// สถานะสำหรับชื่อสารบัญในหน้าถัดไป
#let outline-title = state("outline-title", none)

// ฟังก์ชันสำหรับเช็คว่ามีหัวข้อระดับ 1 ในหน้าปัจจุบันหรือไม่
#let has-level1-heading() = {
  query(heading.where(level: 1)).any(it => it.location().page() == here().page())
}

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

// การตั้งค่าตาราง (Table Figure)
#show figure.where(kind: table): set figure(
  supplement: [ตารางที่],
  numbering: it => {
    let ch = counter("chapter").get().first()
    str(ch) + "-" + str(it)
  },
)
// ตั้งค่า Caption ของ Table Figure
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption.where(kind: table): set align(left)

// การตั้งค่าหัวข้อ
#show heading.where(level: 1): it => {
  counter(figure.where(kind: image)).update(0)
  set align(center)
  set text(size: 20pt, weight: "bold")
  if it.numbering != none {
    [บทที่ #counter(heading).display() \ #it.body]
  } else {
    it.body
  }
  v(1em)
}

#show heading.where(level: 2): it => {
  set text(size: 18pt, weight: "bold")
  it
}

#show heading.where(level: 3): it => {
  set text(size: 16pt, weight: "bold")
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
#set page(
  numbering: "i",
  header: context {
    let title = outline-title.get()
    if title != none and not has-level1-heading() {
      // ขยับ header ลงมาเล็กน้อย
      v(1.5cm)
      align(center, text(size: 18pt, weight: "bold")[#title (ต่อ)])
      let outline_grid = state("outline-header", none).get()
      if outline_grid != none {
        v(0.5em)
        outline_grid
      }
    }
  },
)

// ฟังก์ชันสำหรับสร้างสารบัญ
#let create-outline(title, target, left-col-name) = {
  // ขยาย Margin ด้านบนเฉพาะหน้าสารบัญ เพื่อให้ Header และเนื้อหาไม่ซ้อนทับกัน
  set page(margin: (top: 4.5cm, bottom: 2.5cm, left: 3cm, right: 2.5cm))

  outline-title.update(title)
  let outline_grid = grid(
    columns: (1fr, auto),
    left-col-name, [หน้า],
  )
  state("outline-header", none).update(outline_grid)

  // ขยับหัวข้อแรกขึ้นไปชดเชยกับ Margin ที่เพิ่มมา (4.5cm - 2cm = 2.5cm)
  v(-2cm)
  heading(level: 1, outlined: false)[#title]
  outline_grid
  pad(top: 0.2em, outline(title: none, target: target))
  state("outline-header", none).update(none)
  outline-title.update(none)
}

// ใบรับรอง
#include "chapters/certificate.typ"
// เริ่มนับเลขหน้า
#counter(page).update(1)
#pagebreak()
// กิตติกรรมประกาศ
#include "chapters/ack.typ"
#pagebreak()
// บทคัดย่อ
#include "chapters/abstract.typ"
#pagebreak()

// สารบัญ
#create-outline("สารบัญ", heading, [หัวข้อ])
#pagebreak()

// สารบัญภาพ
#create-outline("สารบัญภาพ", figure.where(kind: image), [ภาพ])
#pagebreak()

// สารบัญตาราง
#create-outline("สารบัญตาราง", figure.where(kind: table), [ตาราง])
#pagebreak()

// เนื้อหาหลัก (Main Content) - ใช้เลขหน้าแบบอารบิก (1, 2, 3)
#set page(numbering: "1", header: none)
#counter(page).update(1)

#set heading(numbering: "1.1")
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
