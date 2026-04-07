// ตั้งค่า Font และกระดาษ
#set text(font: "TH Sarabun New", size: 16pt, lang: "th", style: "normal", weight: "regular")
#show raw: set text(font: "TH Sarabun New", size: 16pt)
#set page(paper: "a4", margin: (top: 3.81cm, bottom: 2.54cm, left: 3.81cm, right: 2.54cm), number-align: right + top)
// สถานะสำหรับชื่อสารบัญในหน้าถัดไป
#let header_title = state("header-title", none)

// ฟังก์ชันสำหรับเช็คว่ามีหัวข้อระดับ 1 ในหน้าปัจจุบันหรือไม่
#let has-level1-heading() = {
  query(heading.where(level: 1)).any(it => it.location().page() == here().page())
}

// ตั้งค่าการย่อหน้า (Indentation) และการจัดการพารากราฟ
#let shared-header = context {
  // ค้นหา Heading Level 1 ในหน้าปัจจุบัน
  let page_headings = query(heading.where(level: 1)).filter(it => it.location().page() == here().page())
  let h1 = if page_headings.len() > 0 { page_headings.first() } else { none }

  // ดึงชื่อหัวข้อสำหรับหน้า (ต่อ) จาก state
  let title = header_title.get()

  // กำหนดระยะขอบบนของ Header ให้คงที่ (1.5 ซม. จากขอบกระดาษ)
  // แต่ละหน้ามี margin top 3.81cm ดังนั้น header ควรใช้พื้นที่ภายใน margin นี้
  v(1.5cm)

  if title != none and h1 == none {
    // กรณีที่ 1: หน้าที่มีเนื้อหาต่อเนื่องจากหน้าก่อนหน้า (เช่น สารบัญ หน้าที่ 2)
    // - แสดง "ชื่อหัวข้อ (ต่อ)" ไว้ที่กึ่งกลาง
    // - ซ่อนเลขหน้าเพื่อความสวยงามตามรูปแบบรายงาน
    align(center, text(size: 18pt, weight: "bold")[#title (ต่อ)])
    let outline_grid = state("header-grid", none).get()
    if outline_grid != none {
      v(0.5em)
      outline_grid
    }
  } else {
    // กรณีที่ 2: หน้าปกติ หรือ หน้าแรกของส่วนต่างๆ
    // ตรวจสอบเงื่อนไขการแสดงเลขหน้า
    let show_num = if h1 != none {
      // หน้าแรกของบท/ส่วน:
      // - แสดงเลขหน้าเฉพาะ "ส่วนหน้า" (ก, ข, ค) ซึ่งเป็นหัวข้อที่ไม่มีเลขบท (numbering: none) และต้องการให้ปรากฏในสารบัญ (outlined: true)
      // - ซ่อนเลขหน้าสำหรับ "หน้าแรกของบทที่..." (มี numbering) และ "หน้าแรกของสารบัญ" (outlined: false)
      h1.numbering == none and h1.outlined == true
    } else {
      // หน้าปกติที่ไม่มีหัวข้อระดับ 1 (เนื้อหาภายในบท) ให้แสดงเลขหน้าเสมอ
      true
    }

    if show_num {
      let num = page.numbering
      if num != none {
        // แสดงเลขหน้าชิดขวาบน
        align(right, text(fill: luma(140))[#counter(page).display(num)])
      }
    }
  }
}
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
  v(-1em)
}


// การตั้งค่าภาพ (Figure)
#set figure(
  supplement: [ภาพที่],
  numbering: it => {
    let ch = counter("chapter").get().first()
    str(ch) + "-" + str(it)
  },
)
#set figure.caption(separator: [ ])
#show figure: set align(center)

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
  counter(figure.where(kind: table)).update(0)
  set align(center)
  set text(size: 20pt, weight: "bold")
  if it.numbering != none {
    [บทที่ #counter(heading).display() \ #it.body]
  } else {
    it.body
  }
  v(1em)
}

#show heading.where(level: 2): set text(size: 18pt, weight: "bold")
#show heading.where(level: 2): set block(above: 1.5em, below: 1em)

#show heading.where(level: 3): set text(size: 16pt, weight: "bold")
#show heading.where(level: 3): set block(above: 0.8em, below: 0.5em)

// การจัดการลิสต์ให้เยื้องเข้าเล็กน้อยและไม่มีการย่อหน้าแบบพารากราฟซ้อน
#set list(indent: 1em)
#set enum(indent: 1em)
#show list: set par(first-line-indent: 0pt)
#show enum: set par(first-line-indent: 0pt)
#show table: set par(first-line-indent: 0pt)

// หน้าปก
#include "chapters/cover-th.typ"
#include "chapters/cover-en.typ"
#pagebreak()

// ตั้งค่าขอบภาพ (Image Border) - เริ่มใช้หลังจากหน้าปก
#show image: it => rect(it, stroke: 0.5pt + black, inset: 0pt)

// ฟังก์ชันสำหรับเลขหน้าแบบ ก, ข, ค
#let thai-alphabetic(n) = {
  let alphabets = (
    "ก",
    "ข",
    "ค",
    "ง",
    "จ",
    "ฉ",
    "ช",
    "ซ",
    "ฌ",
    "ญ",
    "ฎ",
    "ฏ",
    "ฐ",
    "ฑ",
    "ฒ",
    "ณ",
    "ด",
    "ต",
    "ถ",
    "ท",
    "ธ",
    "น",
    "บ",
    "ป",
    "ผ",
    "ฝ",
    "พ",
    "ฟ",
    "ภ",
    "ม",
    "ย",
    "ร",
    "ล",
    "ว",
    "ศ",
    "ษ",
    "ส",
    "ห",
    "ฬ",
    "อ",
    "ฮ",
  )
  if n <= alphabets.len() {
    alphabets.at(n - 1)
  } else {
    // กรณีที่เกิน 44 หน้า (ซึ่งปกติไม่ถึง) ให้ใช้เลขหน้าปัจจุบันต่อท้าย
    "ฮ" + str(n - alphabets.len())
  }
}

// ส่วนหน้า (Front Matter) - ใช้เลขหน้าแบบไทย (ก, ข, ค)
#set page(
  numbering: thai-alphabetic,
  header: shared-header,
)

// ฟังก์ชันสำหรับสร้างสารบัญ
#let create-outline(title, target, left-col-name) = {
  // ใช้ margin มาตรฐานสำหรับสารบัญ (top: 3.81cm)
  // header จะเพิ่ม v(1.5cm) ภายใน margin นี้
  set page(margin: (top: 3.81cm, bottom: 2.54cm, left: 3.81cm, right: 2.54cm))

  header_title.update(title)
  let outline_grid = grid(
    columns: (1fr, auto),
    left-col-name, [หน้า],
  )
  state("header-grid", none).update(outline_grid)

  // ขยับหัวข้อแรกขึ้นไปชดเชยกับ Margin ที่เพิ่มมา (4.5cm - 2cm = 2.5cm)
  v(-2cm)
  heading(level: 1, outlined: false)[#title]
  outline_grid

  // กฎการแสดงผลรายการในสารบัญ (Outline Entry) เพื่อจัดตำแหน่งให้ตรงตามเกณฑ์
  show outline.entry: it => {
    let loc = it.element.location()
    
    // ดึงเลขลำดับ
    let num = if it.element.has("numbering") and it.element.numbering != none {
      if target == heading {
        numbering(it.element.numbering, ..counter(heading).at(loc))
      } else {
        // สำหรับรูปภาพและตาราง (X-Y)
        let ch = counter("chapter").at(loc).first()
        let n = it.element.counter.at(loc).first()
        str(ch) + "-" + str(n)
      }
    } else { "" }

    // กำหนดระยะเยื้อง (Indent) โดยใช้หน่วย em (1 em ประมาณ 1 ตัวอักษร)
    let num_indent = 0pt
    let body_indent = 1.2em
    
    if target == heading {
      if it.level == 1 {
        // เลข 1 ตรงกับตัวแรกของ "บทที่" (indent 0)
        // ข้อความตรงกับ "ที่" (indent ~1.2em)
        num_indent = 0pt
        body_indent = 1.2em
      } else {
        // เลข 1.1 ตรงกับข้อความบทนำ (indent 1.2em)
        num_indent = 1.2em
        body_indent = 2.8em
      }
    } else {
      // สำหรับ สารบัญภาพ และ สารบัญตาราง
      if title == "สารบัญตาราง" {
        // เลข 1-1 ตรงกับ "ร" ของ "ตาราง" (indent ~1.2em)
        num_indent = 1.2em
        body_indent = 3.2em
      } else {
        // เลข 1-1 ตรงกับ "สระ อา" ของ "ภาพ" (indent ~0.6em)
        num_indent = 0.6em
        body_indent = 2.6em
      }
    }

    // สร้างรายการใหม่โดยแยกคอลัมน์ เลขลำดับ | ข้อความ + จุดไข่ปลา | เลขหน้า
    let entry_title = if target == heading { it.element.body } else { it.element.caption.body }
    
    v(0.4em)
    context {
      let loc = it.element.location()
      let page_num = counter(page).at(loc).first()
      // ตรวจสอบว่าอยู่ในส่วนหน้า (ก, ข, ค) หรือเนื้อหาหลัก (1, 2, 3)
      let formatted_page = if loc.page() <= 10 { // โดยประมาณ หน้า ก-ฉ อยู่ในช่วงแรก
        thai-alphabetic(page_num)
      } else {
        str(page_num)
      }

      grid(
        columns: (body_indent, 1fr, auto),
        column-gutter: 0.5em,
        stack(dir: ltr, h(num_indent), num),
        entry_title + " " + box(width: 1fr, it.fill),
        formatted_page
      )
    }
  }

  pad(top: 0.2em, outline(title: none, target: target))
  state("header-grid", none).update(none)
  header_title.update(none)
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
#set page(numbering: "1", header: shared-header)
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
#set page(margin: (top: 3.81cm, bottom: 2.54cm, left: 3.81cm, right: 2.54cm), header: shared-header)
#include "chapters/bibliography.typ"
#pagebreak()
#include "chapters/appendix.typ"
#pagebreak()
#include "chapters/biography.typ"
