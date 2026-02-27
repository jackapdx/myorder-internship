#{
  // สารบัญภาพ
  heading(level: 1, outlined: false)[สารบัญภาพ]
  grid(
    columns: (1fr, auto),
    [ภาพที่], [หน้า],
  )
  outline(title: none, target: figure.where(kind: image))
}
