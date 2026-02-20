// ตั้งค่า Font และกระดาษ
#set text(font: "Sarabun", size: 14pt, lang: "th")

// หน้าปก
#include "chapters/cover-th.typ"

#set page(paper: "a4", margin: 2.5cm, numbering: "1")

// สารบัญ
#outline(title: "สารบัญ", indent: 2em)

#pagebreak()

#include "chapters/ch02_method.typ"
#include "chapters/ch03_result.typ"
