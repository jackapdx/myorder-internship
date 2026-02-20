// ตั้งค่า Font และกระดาษ
#set page(paper: "a4", margin: 2.5cm)
#set text(font: "Sarabun", size: 16pt, lang: "th") // ใช้ฟอนต์ไทยที่มีในเครื่องคุณ เช่น Sarabun หรือ Angsana New

// ส่วนหัวข้อ
#align(center)[
  #text(size: 24pt, weight: "bold")[รายงานการทดสอบ Typst]
]

// สารบัญ
#outline(title: "สารบัญ", indent: 2em)

#pagebreak()

= บทนำ
สวัสดีครับ นี่คือการทดสอบเขียนรายงานด้วย #strong[Typst] บนเครื่องตัวเอง 
การจัดย่อหน้าและช่องว่างทำได้แม่นยำมาก

= ตารางข้อมูล
#figure(
  table(
    columns: (1fr, 2fr),
    inset: 10pt,
    align: horizon,
    [*รายการ*], [*รายละเอียด*],
    [ความเร็ว], [เร็วกว่า LaTeX มาก],
    [ความง่าย], [เหมือนเขียน Markdown],
  ),
  caption: [ตารางเปรียบเทียบคุณสมบัติ],
)
