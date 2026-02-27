#set heading(numbering: none)
#set figure(
  supplement: [ภาพที่],
  numbering: it => {
    let ch = counter("chapter").get().first()
    str(ch) + "-" + str(it)
  }
)

#counter("chapter").update(1)
= บทที่ 1
#figure(rect(), caption: "Test 1")

#counter("chapter").step()
= บทที่ 2
#figure(rect(), caption: "Test 2")
