#import "../config/common.typ": *

#set page(numbering: none)

// Override global image stroke rule for certificate page
#show image: it => it

#set page(
  background: context {
    place(
      center + horizon,
      dy: 3cm,
      dx: 0.5cm,
      box(width: 100%)[
        #place(center + horizon)[#image("/images/buu-logo-inter.webp", width: 45%)]
        #place(center + horizon)[#rect(width: 100%, height: 100%, fill: rgb(255, 255, 255, 95%), stroke: none)]
      ],
    )
  },
)

#v(2em)

#set align(center)
#text(size: 18pt, weight: "bold")[ใบรับรองรายงานการปฏิบัติงานสหกิจศึกษา]

#v(2em)

#set align(left)
#grid(
  columns: (30%, 70%),
  row-gutter: 1.5em,
  [#strong[หัวข้อโครงงาน/รายงาน]], [#project_name_th\ #project_name_en],
  [#strong[ชื่อนิสิต]], [นาย#student_name_th #h(3em) #strong[รหัสประจำตัว] #h(1em) #student_id],
  [#strong[อาจารย์ที่ปรึกษา]], [ผู้ช่วยศาสตราจารย์ เบญจภรณ์ จันทรทองกุล],
  [#strong[วันที่สอบ]], [13 มีนาคม 2569],
)

#line(length: 100%, stroke: 0.5pt)

#v(2em)
#set align(center)
#set par(leading: 1.5em)
#strong[รายงานการปฏิบัติงานสหกิจศึกษานี้ได้ผ่านการเห็นชอบจากคณะกรรมการสอบ]\
ให้เป็นรายงานการปฏิบัติงานสหกิจศึกษาหลักสูตรวิทยาศาสตรบัณฑิต\
สาขาวิชาวิทยาการคอมพิวเตอร์

#v(6em)

#grid(
  columns: (50%, 50%),
  align: center,
  [
    ...........................................................................\
    (ผู้ช่วยศาสตราจารย์ เอกภพ บุญเพ็ง)\
    ประธานกรรมการ
  ],
  [
    ...........................................................................\
    (ผู้ช่วยศาสตราจารย์ วรวิทย์ วีระพันธุ์)\
    กรรมการ
  ],
)

#pagebreak()

#set page(
  background: none,
)

#image("/images/docs/INC005.jpg", width: 100%, fit: "contain")
