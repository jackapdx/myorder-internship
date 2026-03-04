#import "../config/common.typ": *

#set page(numbering: none)
#set align(center)


#image("/images/buu-logo-inter.webp", width: 20%)

#let t(weight: "bold", body) = text(size: 18pt, weight: weight, upper(body))

#v(1cm)
#t[
  Cooperative Education Report
]

#v(0.5cm)
#t[
  #project_name_en
]

#v(3cm)
#t[
  #student_name_en
]

#v(3cm)
#t[
  Internship at \
  #company_name_en \
  211 2 Bang Phra, Si Racha, Chonburi 20110
]

#v(3cm)
#t[
  This report is a part of the Cooperative Education course \
  Bachelor of Science Program in Computer Science \
  Faculty of Informatics, Burapha University \
  Academic Year 2025
]
