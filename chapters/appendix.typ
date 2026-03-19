#import "../config/common.typ": *

#set heading(numbering: none)

#align(center + horizon)[#text(size: 20pt)[*ภาคผนวก*]]
#pagebreak()

#align(center + horizon)[
  #text(size: 20pt)[*ภาคผนวก ก*]
  
  #text(size: 16pt)[แผนการดำเนินงานตามเอกสาร IN-S006]
]
#pagebreak()

#set page(
  background: none,
)

#for i in range(1, 3) {
  image("/IN-S006-JACK.pdf", width: 100%, fit: "contain", page: i)
  if i < 2 { pagebreak() }
}

#pagebreak()
#align(center + horizon)[
  #text(size: 20pt)[*ภาคผนวก ข*]

  #text(size: 16pt)[ใบนำส่งและเอกสารสหกิจที่เกี่ยวข้อง]
]
#pagebreak()

#align(center + horizon)[
  #text(size: 14pt, fill: gray)[เอกสารใบนำส่งจะถูกเพิ่มหลังจากได้รับลายเซ็นจากสถานประกอบการ]
]
