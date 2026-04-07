#import "@preview/fletcher:0.5.6" as fletcher: diagram, edge, node, shapes
#import "/config/common.typ": *

= วิธีการดำเนินงานสหกิจศึกษา

#par(first-line-indent: 1cm, justify: true)[
  กระบวนการดำเนินงานสหกิจศึกษาในตำแหน่ง Full Stack Developer ณ #company_name มุ่งเน้นไปที่การประยุกต์ใช้ความรู้ทางทฤษฎีควบคู่ไปกับการปฏิบัติงานจริงในสภาพแวดล้อมการพัฒนาระบบระดับองค์กร บทนี้จะนำเสนอรายละเอียดเชิงลึกเกี่ยวกับระเบียบวิธีและขั้นตอนต่าง ๆ ที่ผู้ปฏิบัติงานได้ดำเนินการเพื่อพัฒนาระบบ My Academy ให้บรรลุวัตถุประสงค์ที่ตั้งไว้ โดยเริ่มตั้งแต่การศึกษาวิเคราะห์ระบบงานเดิม การเลือกใช้เทคโนโลยีและเครื่องมือที่เหมาะสมกับโครงสร้าง Monorepo การออกแบบสถาปัตยกรรมซอฟต์แวร์ที่ทันสมัย ตลอดจนกระบวนการบริหารจัดการโครงการแบบ Agile ที่ผสมผสานแนวคิด Scrum และ XP เข้าด้วยกัน นอกจากนี้ยังครอบคลุมถึงรายละเอียดของการออกแบบ Blueprint การจำลองระบบด้วย Mountebank และการประกันคุณภาพผ่านการทดสอบ API และ Unit Test อย่างเข้มข้น เพื่อให้มั่นใจว่าผลลัพธ์ของโครงงานมีความถูกต้องแม่นยำและสามารถส่งมอบซอฟต์แวร์ที่มีคุณภาพสูงสู่ผู้ใช้งานจริงได้อย่างยั่งยืน
]

#par(first-line-indent: 1cm, justify: true)[
  เดิมทีระบบที่จะต้องพัฒนานั้น เป็นโครงงานที่นักศึกษาฝึกงานรุ่นก่อนหน้าได้ริเริ่มและวางรากฐานโครงสร้างพื้นฐานไว้บ้างแล้ว ทำให้กระบวนการเรียนรู้และเติบโตของซอฟต์แวร์ดำเนินไปควบคู่กับความเข้าใจในระบบงานเดิม (Legacy Codebase) เมื่อผู้ปฏิบัติงานได้รับช่วงต่อ จึงจำเป็นต้องใช้ความรอบคอบในการวิเคราะห์โค้ดเดิมเพื่อขยายขีดความสามารถและพัฒนาฟีเจอร์ E-Learning Management System ในชื่อ “My Academy” ซึ่งเป็นส่วนหนึ่งของโมดูลสำคัญในระบบ MyHR โดยมีรายละเอียดขั้นตอนการดำเนินงานที่สำคัญดังนี้:
]

- การทำความเข้าใจโครงสร้าง Codebase เดิมของระบบ และดำเนินการปรับปรุงให้ทันสมัย
- การวิเคราะห์และทำความเข้าใจความต้องการของผู้ใช้งานเป้าหมายหลัก (HR)
- การออกแบบแนวทาง A-DAPT Blueprint ให้สอดคล้องกับพฤติกรรมในแต่ละ Scenario
- การเดินหน้าพัฒนา Frontend, Backend และฐานข้อมูล มุ่งเน้นไปที่ระบบการประเมิน (Assessment)
- การเขียนและทดสอบ Unit Test และ API Test ในส่วนของโครงสร้างหลังบ้าน (Backend)
- การนำร่องกระบวนการ Deploy โครงการขึ้นสู่เซิร์ฟเวอร์
- การอัปเดตเอกสารประกอบการพัฒนาระบบและบริหารจัดการเวอร์ชัน

== การเลือกใช้เทคโนโลยีและเครื่องมือ (Tools & Technologies)

#par(first-line-indent: 1cm, justify: true)[
  เพื่อให้การพัฒนาระบบ My Academy มีประสิทธิภาพสูงสุดและสอดคล้องกับมาตรฐานการทำงานของทีมพัฒนาภายในองค์กร ผู้ปฏิบัติงานได้คัดเลือกและนำเทคโนโลยีสมัยใหม่มาประยุกต์ใช้ในทุกขั้นตอนของวงจรการพัฒนาซอฟต์แวร์ โดยมุ่งเน้นที่การเพิ่มความเร็วในการพัฒนา (Development Velocity) และความสะดวกในการบำรุงรักษาภายใต้โครงสร้างแบบ Monorepo ซึ่งมีการจัดการทรัพยากรร่วมกันอย่างเป็นระบบ โดยมีรายละเอียดของเครื่องมือหลักที่ใช้ดังนี้:
]

=== การจัดการโปรเจ็กต์ด้วย Taskfile และ pnpm

- *Taskfile:* ใช้แทน Makefile ดั้งเดิม เพื่อการทำงานข้ามแพลตฟอร์ม (Cross-Platform) ที่ดีขึ้น รองรับรูปแบบการเขียนด้วย YAML ทำให้อ่านง่าย และสามารถจัดเตรียมคำสั่งแบบขนาน (Parallel Execution) ได้อย่างมีประสิทธิภาพ เช่น คำสั่ง task init หรือ task dev
- *pnpm:* ใช้เป็น Package Manager หลักเนื่องจากมีความเร็วในการติดตั้งสูง ประหยัดพื้นที่ดิสก์อย่างมาก (ผ่านระบบ Hard Links/Symlinks ไปส่วนกลาง) และสนับสนุนการทำงานกับโครงสร้างแบบ Workspace ได้อย่างยอดเยี่ยม หมดปัญหาเรื่อง Phantom Dependencies

=== การควบคุมคุณภาพและกระบวนการทำงานด้วย Husky

มีการใช้ Husky ในการสร้าง Git Hooks เพื่อตรวจสอบคุณภาพโค้ดแบบอัตโนมัติ:

- *Pre-commit:* ทำงานร่วมกับ lint-staged เพื่อรัน ESLint และ Prettier เฉพาะไฟล์ที่ถูกเปลี่ยนแปลง ทำให้โค้ดตรงตามมาตรฐานโดยอัตโนมัติและไม่เสียเวลาตรวจสอบทั้งโปรเจ็กต์
- *Pre-push:* บังคับรัน Task ของการทดสอบ (test-unit) และการบิวด์ (build-all) หากมีส่วนอัปเดตที่ไม่ผ่านเกณฑ์ จะไม่สามารถส่งขึ้น Repository (Git Push) ได้ ป้องกัน Build พัง

=== ประสิทธิภาพในการทดสอบ (Faster Testing Environments)

- *SWC และ Vitest:* ได้ถูกนำมาใช้แทน Jest และ Babel ในฝั่ง Backend เพื่อแก้ปัญหาความล่าช้าในการจับคู่ไฟล์ (Compilation) ส่งผลให้การพัฒนาและการรัน Unit Test ไวขึ้นถึง 10 เท่า ใช้หน่วยความจำลดลง รองรับ Native ESM อย่างเต็มตัว และบรรทัดฐานยังถูกออกแบบให้เข้ากับโค้ดแบบ Jest Syntax
- *Mountebank (Merge JSON Strategy):* นำมาใช้จำลอง API (Mock Server) โดยออกแบบให้แยกไฟล์ตามแต่ละฟังก์ชันการทำงานส่วนย่อย (เช่น auth, employees) แล้วทำกระบวนการอัตโนมัติรวบรวมเป็นไฟล์เดียว ทำให้โครงสร้างการดูแลง่ายและแก้ไขโค้ดร่วมกันโดยไม่ชนกัน
- *Bruno (collection.bru):* เครื่องมือสำหรับทดสอบ API โดยมีการนำ Centralized Data Definition มาใช้รวบรวมตัวแปรหลัก เช่น Token หรือ User ID ไว้ที่เดียว ช่วยลดความซ้ำซ้อนของการกำหนดค่าตั้งต้นสำหรับแต่ละการทดสอบ

=== โครงสร้างเฟรมเวิร์กและเทคโนโลยีหลัก (Core Framework & Technologies)

- *Backend (NestJS 11+):* พัฒนาด้วย TypeScript เชิงวัตถุ ใช้ PostgreSQL เป็นฐานข้อมูลหลักผ่านการเขียนตัวกรองคำสั่งด้วย Knex.js (Query Builder) และใช้ Liquibase ในการจัดการลำดับชั้นการเปลี่ยนแปลงฐานข้อมูล (Migrations/Seeds) อย่างเป็นระบบ การประมวลผลพื้นหลังหรือส่วนงานคิวใช้ BullMQ และ Redis เพิ่มประสิทธิผลในการเชื่อมต่อให้ทัดเทียมกับระบบขนาดใหญ่
- *Frontend (Angular 21+):* นำเสนอประสบการณ์ผู้ใช้ด้วยระบบโครงสร้าง Angular เวอร์ชันใหม่ โดยกำหนดให้เป็น Standalone Components ล้วน ไร้โครงสร้างซับซ้อนของรูปแบบเก่า ใช้ TailwindCSS และ DaisyUI ช่วยเสริมสไตล์ และจัดการความสัมพันธ์ของสถานะระบบเบราว์เซอร์ผ่าน NgRx Signal Store และ Signals อย่างมีประสิทธิภาพ

== รูปแบบสถาปัตยกรรมและหลักการเขียนโค้ด (Software Architecture & Design Patterns)

#par(first-line-indent: 1cm, justify: true)[
  สถาปัตยกรรมซอฟต์แวร์ที่แข็งแกร่งเป็นรากฐานสำคัญที่ช่วยให้ระบบสามารถรองรับการขยายตัว (Scalability) และง่ายต่อการแก้ไขในอนาคต ระบบ My Academy ได้รับการออกแบบโดยใช้แนวคิดแยกส่วนการทำงาน (Modular Design) ที่ชัดเจนทั้งในฝั่งผู้ใช้งานส่วนหน้า (Frontend) และแอปพลิเคชันส่วนหลัง (Backend) โดยมีการกำหนดมาตรฐานการเขียนโค้ดและรูปแบบการออกแบบที่เข้มงวดเพื่อรักษาคุณภาพและความเป็นระเบียบของโค้ดเบสทั้งหมด ดังนี้:
]

=== แนวทางการพัฒนา Frontend (Frontend Patterns)

- *Single File Components (SFC):* ระบบ Angular จะถูกรวมโค้ดส่วนของ HTML Template, CSS Styles, และ TypeScript Logic เข้าไว้ในไฟล์เดียวเป็นหลัก เพื่อส่งผ่านและควบคุมลอจิกขนาดเล็กได้อย่างรัดกุม
- *Modern Angular Reactivity:* ปรับกลไกการประกาศตัวแปรให้โปร่งใส ลดการใช้ Decorator ต่าง ๆ ลง หันมาประยุกต์ใช้ฟังก์ชัน inject(), input(), output(), และการควบคุมโครงสร้างระดับเทมเพลตผ่านกล่องคำสั่ง \@if, \@for สร้างความรัดกุมและโค้ดมีขนาดที่กระชับ
- *State Management:* การไหลข้อมูลมีการคุมเส้นทางที่ชัดเจน โดยการประยุกต์ใช้ Signals ของ Angular และ NgRx เข้ามาเสริมให้การอัปเดตข้อมูลที่ซับซ้อน (Reactivity) ผ่านช่องทิศทางที่จัดการแบบ Functional

=== แนวทางการพัฒนา Backend (Backend Patterns)

- *Repository Pattern:* คัดแยกชั้นของการจัดการข้อมูล (Data Access Layer) ออกจากชั้นควบคุมลอจิก (Business Logic) อย่างชัดเจน ป้องกันปัญหาความวุ่นวายระหว่างฟังก์ชันและสะดวกสำหรับการตรวจสอบ (Unit Tests)
- *Robust DTOs & Validation:* กำหนดโครงสร้างข้อมูลที่แลกเปลี่ยนระหว่างระบบเป็นชนิด DTO (Data Transfer Object) ประกอบกับไลบรารี class-validator เพื่อคัดกรองข้อมูลรบกวนแต่แรกและหลีกเลี่ยงการเจาะเข้าจัดการ Object ผิดระเบียบ
- *Unit Testing (DAMP Principle):* ให้ความสำคัญในการตั้งชื่อ Case ว่าเป้าหมายต้องการทดสอบอะไร (Descriptive And Meaningful Phrases) เน้นทดสอบพฤติกรรมของฝั่งธุรกิจ ไม่ให้ปะปนกับการทำงานทางเทคนิค

== รูปแบบการพัฒนาซอฟต์แวร์ด้วยแนวคิด Scrum และ eXtreme Programming (XP)

#par(first-line-indent: 1cm, justify: true)[
  การบริหารจัดการโครงการอย่างมีประสิทธิภาพเป็นหัวใจสำคัญที่ช่วยให้ทีมสามารถส่งมอบงานได้ทันตามกำหนดเวลาและมีคุณภาพสูงสุด ในการพัฒนาระบบครั้งนี้ผู้ปฏิบัติงานได้เข้าร่วมกระบวนการพัฒนาซอฟต์แวร์แบบ Agile ที่เป็นการผสมผสานระหว่างกรอบการทำงาน Scrum สำหรับการบริหารจัดการงาน และวิธีปฏิบัติแบบ eXtreme Programming (XP) สำหรับการเน้นคุณภาพทางวิศวกรรมซอฟต์แวร์ เพื่อให้เกิดความคล่องตัวและลดข้อผิดพลาดที่อาจเกิดขึ้นในแต่ละรอบการพัฒนา ดังนี้:
]

=== การประยุกต์ใช้ Scrum

- *Sprint Planning & Daily Stand-up:* มีการวางแผนงานเป็นรอบ (Sprint) เพื่อให้เห็นเป้าหมายที่ชัดเจน และมีการติดตามความคืบหน้า รวมถึงปัญหาที่พบในแต่ละวัน
- *Iterative Delivery:* เน้นการส่งมอบซอฟต์แวร์ที่พัฒนาได้ในแต่ละรอบของ Sprint เพื่อให้พร้อมใช้งานและนำข้อเสนอแนะกลับมาปรับปรุงได้อย่างรวดเร็ว

=== การประยุกต์ใช้ eXtreme Programming (XP)

- *Test-Driven Development (TDD):* ให้ความสำคัญกับ Automated Testing ทั้ง Unit Test, API Test และ E2E Test เสมอ โดยการวิเคราะห์เชิงคุณภาพการพึ่งพิงลอจิกการทำงานก่อนจะปรับโครงสร้างการทำงาน
- *Continuous Integration / Continuous Deployment (CI/CD):* มีการนำ Husky เข้ามาจำกัดสิทธิ์ในส่วน Local โดยการบังคับและตรวจสอบ (Lint, Test, Build) กรองโค้ดขยะชั้นแรก
- *Refactoring & Code Standards:* ควบคุมมาตรฐานโค้ดสม่ำเสมอ โดยมีการกำหนดรูปแบบมาตรฐานการตั้งชื่อ (Conventional Commits) บน GitHub ผูกการเปลี่ยนแปลงเข้ากับ Branch เป็นข้อบังคับสำคัญ ดัง@fig:3-1 แสดงความสัมพันธ์ระหว่าง Scrum และ XP ในการปฏิบัติงาน
#figure(
  caption: [ความสัมพันธ์ระหว่าง Scrum และ XP ในการปฏิบัติงาน],
  rect(stroke: 0.5pt + black, inset: 15pt, text(size: 11pt, diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    spacing: (8em, 2em),

    // Top Boxes
    node((0,0), [*Management*\ (Scrum)], corner-radius: 2pt, fill: blue.lighten(90%), stroke: blue, width: 8em, height: 3em),
    node((1,0), [*Engineering*\ (XP)], corner-radius: 2pt, fill: green.lighten(90%), stroke: green, width: 8em, height: 3em),

    // Arrow
    edge((0,0), (1,0), "<->", [Support Each Other]),

    // Bottom Boxes
    node((0,1), [Sprint Planning\ Daily Stand-up\ Retrospective], corner-radius: 2pt, stroke: black, width: 8em, height: 4em),
    node((1,1), [TDD\ Pair Programming\ CI/CD], corner-radius: 2pt, stroke: black, width: 8em, height: 4em),

    // Dashed lines
    edge((0,0), (0,1), "--", stroke: (dash: "dashed")),
    edge((1,0), (1,1), "--", stroke: (dash: "dashed")),
  )))
) <fig:3-1>


== แผนภาพแสดงสถาปัตยกรรมกระบวนการ (Architecture & Workflow Diagram)

#par(first-line-indent: 1cm, justify: true)[
  เพื่อให้เห็นภาพรวมของกระบวนการทำงานและโครงสร้างการจัดการโค้ดที่ชัดเจน ผู้ปฏิบัติงานได้จัดทำแผนภาพแสดงสถาปัตยกรรมกระบวนการซึ่งครอบคลุมถึงวงจรชีวิตของ Git และการนำระบบอัตโนมัติเข้ามาช่วยในการตรวจสอบคุณภาพโค้ดเบื้องต้น แผนภาพเหล่านี้จะช่วยอธิบายลำดับขั้นตอนการทำงานตั้งแต่นักพัฒนาเขียนโค้ดไปจนถึงการนำส่งโค้ดขึ้นสู่ระบบส่วนกลางอย่างมีมาตรฐาน ดัง@fig:3-2 ขั้นตอน Git Hooks อัตโนมัติด้วย Husky
]
#figure(
  caption: [ขั้นตอน Git Hooks อัตโนมัติด้วย Husky],
  rect(stroke: 0.5pt + black, inset: 15pt, text(size: 11pt, diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    spacing: (2em, 2.5em),

    // Nodes
    node((0,0), [ผู้พัฒนา\ (Developer)], corner-radius: 5pt, width: 10em),
    node((0,1), [git commit], corner-radius: 5pt, width: 8em),
    node((0,2), [Husky: pre-commit\ (lint & format)], corner-radius: 5pt, stroke: blue, width: 14em),
    node((0,3), [git push], corner-radius: 5pt, width: 8em),
    node((0,4), [Husky: pre-push\ (test & build)], corner-radius: 5pt, stroke: blue, width: 14em),
    node((0,5), [Git Repository], corner-radius: 5pt, width: 10em),

    // Edges
    edge((0,0), (0,1), "-|>"),
    edge((0,1), (0,2), "-|>"),
    edge((0,2), (0,3), "-|>"),
    edge((0,3), (0,4), "-|>"),
    edge((0,4), (0,5), "-|>"),
  )))
) <fig:3-2>


== กระบวนการออกแบบและรวบรวมความต้องการของระบบ (System Requirements & Live Design)

#par(first-line-indent: 1cm, justify: true)[
  การทำความเข้าใจความต้องการที่แท้จริงของผู้มีส่วนได้ส่วนเสีย (Stakeholders) เป็นขั้นตอนที่สำคัญที่สุดในการออกแบบฟีเจอร์ของระบบ My Academy ให้ตรงตามเป้าหมายทางธุรกิจ ผู้ปฏิบัติงานได้ใช้วิธีการรวบรวมความต้องการผ่านการประชุมและเวิร์กช็อปร่วมกับฝ่ายทรัพยากรบุคคล (HR) เพื่อนำข้อมูลมาจัดทำเป็นเอกสารการออกแบบที่สามารถปรับปรุงแก้ไขได้แบบทันท่วงที (Live Design) โดยใช้เครื่องมือและแนวคิดดังนี้:
]

=== การออกแบบและทำงานร่วมกันด้วยการเขียนเอกสารสดผ่าน Miro (Miro as a Living Document)

เพื่อให้ผู้พัฒนาหน้าใหม่, Project Manager, และผู้มีส่วนได้ส่วนเสีย (Stakeholders) ทั้งหมดมีภาพของระบบภาพเดียวกัน ได้มีการนำแพลตฟอร์ม Miro เข้ามาเป็น Living Document หรือศูนย์กลางในการออกแบบอย่างครอบคลุม ได้แก่:

- กำหนดสถาปัตยกรรมระบบ โฟลว์การทำงาน และโครงร่างหน้าจอ (Wireframes) เชื่อมโยงเข้าด้วยกัน
- การเขียนแผนผังความสัมพันธ์ (Entity-Relationship Diagram) และการออกแบบสคีมาฐานข้อมูลร่วมกัน
- การร่วมกันระดมสมอง (Brainstorming) เพื่อกำหนดข้อจำกัดและกติกาเชิงธุรกิจ (Business Logic) เมื่อมีความต้องการส่วนใดเปลี่ยน การอัปเดตบน Miro จะเป็นจุดรวมที่ทุกคนจะยึดเป็นพื้นที่อ้างอิงหลัก ทำให้กระบวนการพัฒนาและตรวจสอบสอดคล้องกันอย่างชัดเจน ไร้ความสับสนของเวอร์ชันเอกสารไฟล์ที่ซ้ำซ้อน ดัง@fig:3-3 แสดงแนวคิด Miro เป็นเอกสารที่มีชีวิต (Living Document) ประจำทีม
#figure(
  caption: [แนวคิด Miro เป็นเอกสารที่มีชีวิต (Living Document) ประจำทีม],
  rect(stroke: 0.5pt + black, inset: 15pt, text(size: 11pt, diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    spacing: (4em, 4em),

    // Top row
    node((-1, -1), [User Flow], fill: yellow.lighten(90%), width: 7em),
    node((0, -1), [ER-Diagram], fill: blue.lighten(90%), width: 7em),
    node((1, -1), [Wireframes], fill: green.lighten(90%), width: 7em),

    // Middle row
    node((0, 0), [*Miro Canvas*\ (Single Source of Truth)], corner-radius: 8pt, stroke: 2pt + orange, width: 15em, height: 5em),

    // Bottom row
    node((-1, 1), [Developer], shape: shapes.circle, width: 5.5em),
    node((0, 1), [Designer], shape: shapes.circle, width: 5.5em),
    node((1, 1), [Product Owner], shape: shapes.circle, width: 5.5em),

    // Edges top to middle
    edge((-1, -1), (0, 0), "-|>"),
    edge((0, -1), (0, 0), "-|>"),
    edge((1, -1), (0, 0), "-|>"),

    // Edges middle to bottom
    edge((0, 0), (-1, 1), "<->"),
    edge((0, 0), (0, 1), "<->"),
    edge((0, 0), (1, 1), "<->"),
  )))
) <fig:3-3>


=== การวิเคราะห์ Scenarios และการออกแบบ A-DAPT Blueprint (Customer Visible Layer)

เพื่อให้ระบบบริหารจัดการการเรียนรู้ออนไลน์ My Academy ภายใต้ระบบหลัก MyHR สามารถตอบสนองการปฏิบัติงานของผู้ใช้งานเป้าหมายหลัก (HR) ได้อย่างครบถ้วน ทีมพัฒนาได้ใช้แนวคิด A-DAPT Blueprint โดยเริ่มต้นจากการวิเคราะห์ในส่วนของ Customer Visible Layer เพื่อทำความเข้าใจพฤติกรรมและความต้องการผ่านกรณีการใช้งานจริง โดยสรุปออกมาเป็นเคสการใช้งาน (Scenarios) สำคัญที่ถูกหยิบยกมาพัฒนาเป็นหลัก ดังนี้:

- *ระบบคอร์สปฐมนิเทศและการออกใบประกาศนียบัตร (Mandatory Orientation & Certificate):* ใช้สำหรับพนักงานเข้าใหม่ ในการรับชมวิดีโอปฐมนิเทศ โดยระบบป้องกันไม่ให้ทำการกรอวิดีโอ (Seek forward) หรือดาวน์โหลดตัววิดีโอเก็บไว้ และเมื่อรับชมเสร็จสมบูรณ์ ระบบจะออกใบประกาศนียบัตรให้เป็นหลักฐานยืนยันแบบอัตโนมัติ
- *กระบวนการควบคุมแบบประเมินและข้อสอบ (Exam & Evaluation System):* สนับสนุนทีมงานผู้ออกแบบหลักสูตร (Instructional Designer) ในการสร้างข้อสอบ ตั้งแต่การกำหนดโจทย์ ตัวเลือก และเกณฑ์การผ่าน ระบบรองรับรูปแบบตั้งแต่ การทำแบบทดสอบก่อนเรียน (Pre-test) หลังเรียนจบ (Post-test) ไปจนถึงการประเมินตนเอง (Self-evaluation)
- *การบริหารจัดการและยื่นรายงานภาครัฐ (CSV Documents & Reports Export):* นำมาใช้เพื่อลดภาระของ HR Manager โดยรองรับการสรุปยอดผู้สำเร็จหลักสูตรเพื่อนำส่งรายงานต่อกรมพัฒนาฝีมือแรงงานผ่านการ Export มาเป็นไฟล์ CSV พร้อมทั้งความสามารถในการดาวน์โหลดใบรับรองให้พนักงานแบบรวมกลุ่ม (Bulk Download) โดยระบบจะยื่นเข้าคิวงานประมวลผล (Worker & Job Queue) ให้ทำการรวมเป็นไฟล์บีบอัด (.zip) ทำให้ไม่กระทบต่อประสิทธิภาพโดยรวม
- *การบริหารจัดการเนื้อหาหลักสูตร (Content & Course Management):* ทีมพัฒนาทักษะองค์กร (L&D Specialist) สามารถบริหารข้อมูลคอร์ส อัปเดตวิดีโอ โปสเตอร์ปก โดยการลบหลักสูตรจะอยู่ในรูปแบบ Soft Delete เพื่อป้องกันผลกระทบบนสถิติการเรียน
- *เส้นทางขอสิทธิ์เข้าเรียนอันหลากหลาย (Flexible Enrollment Flow):* ระบบรองรับระบบการควบคุมสิทธิการเข้าเรียนถึง 2 รูปแบบ คือกติกาที่ HR บังคับเลือกลงทะเบียนอัตโนมัติ (Force Enroll) รายวิชาจะปรากฏในหลักสูตรของฉันทันที และกติกาที่จำกัดโควตาผู้เรียน (Request-to-Enroll) ซึ่งพนักงานจะส่งคำขอเข้ามาเป็นสถานะรอดำเนินการ (Pending) จนกว่าหัวหน้าหรือ HR Manager จะตรวจสอบคุณสมบัติและเข้ามากดให้การอนุมัติ ดัง@fig:3-4 แสดงการทำงานแบบ Monorepo และเครื่องมือการทดสอบ
#figure(
  caption: [การทำงานแบบ Monorepo และเครื่องมือการทดสอบ],
  rect(stroke: 0.5pt + black, inset: 10pt, text(size: 9pt, diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    spacing: (4.5em, 3em),

    // Nodes
    node((0, 0), [pnpm Workspace], corner-radius: 5pt, width: 8em),

    node((-1, 1), [Frontend\ (Angular 21)], corner-radius: 5pt, width: 7.5em),
    node((-1, 2), [UI / Components], corner-radius: 5pt, fill: blue.lighten(95%), width: 8em),

    node((1, 1), [Backend\ (NestJS 11)], corner-radius: 5pt, width: 7.5em),
    node((1, 2), [Unit Tests], corner-radius: 5pt, fill: blue.lighten(95%), width: 7em),
    node((2, 1), [API Tests], corner-radius: 5pt, width: 6em),

    // Edges
    edge((0, 0), (-1, 1), "-|>", label: [แชร์ไลบรารี], label-pos: 0.4, label-side: left),
    edge((0, 0), (1, 1), "-|>", label: [แชร์ไลบรารี], label-pos: 0.4, label-side: right),

    edge((-1, 1), (-1, 2), "-|>", label: [State Management\ (NgRx Signal Store)], label-side: left),

    edge((1, 1), (1, 2), "-|>", label: [SWC + Vitest], label-side: left),
    edge((1, 1), (2, 1), "<->", label: [API Testing\ (Bruno / Mountebank)], label-pos: 0.9, label-side: left, label-sep: 1.2em),
  )))
) <fig:3-4>


== การวิเคราะห์และออกแบบระบบ (System Analysis & Design)

#par(first-line-indent: 1cm, justify: true)[
  การวิเคราะห์และออกแบบระบบเชิงลึกเป็นขั้นตอนที่ช่วยแปลงความต้องการทางธุรกิจให้กลายเป็นโครงสร้างทางเทคนิคที่สามารถนำไปพัฒนาได้จริง ผู้ปฏิบัติงานได้จัดทำแผนภาพมาตรฐาน UML และคำอธิบายรายละเอียดต่าง ๆ เพื่อสื่อสารลอจิกการทำงานและโครงสร้างข้อมูลของระบบ My Academy ให้มีความชัดเจนและเป็นสากล โดยครอบคลุมประเด็นสำคัญดังนี้:
]

=== แผนภาพยูสเคส (Use Case Diagram)

แผนภาพยูสเคสด้านล่างแสดงความสัมพันธ์ระหว่างผู้ใช้งานหลักในระบบ My Academy ซึ่งประกอบด้วย 2 บทบาทหลัก ได้แก่ HR Admin และ Employee (พนักงาน) โดยแต่ละบทบาทมีขอบเขตการใช้งานที่ครอบคลุมฟังก์ชันการเรียนรู้และการประเมินผล ดัง@fig:3-5 แสดงแผนภาพยูสเคสของระบบ My Academy
#figure(
  caption: [แผนภาพยูสเคสของระบบ My Academy],
  rect(stroke: 0.5pt + black, inset: 10pt, text(size: 9pt, diagram(
    node-stroke: 0.8pt,
    edge-stroke: 0.8pt,
    spacing: (10em, 2em),

    // Actors
    node((-1.5, 2.0), [HR\ Admin], shape: shapes.circle, name: <hr>, width: 4.5em, height: 4.5em),
    node((-1.5, 5.0), [Employee], shape: shapes.circle, name: <emp>, width: 4.5em, height: 4.5em),

    // System Boundary
    node((1, 4), rect(stroke: 1pt + black, width: 14em, height: 25em), stroke: none),
    node((1, 0.2), text(size: 11pt, weight: "bold")[My Academy System], stroke: none),

    // Use Cases
    node((1, 1), [จัดการคอร์สเรียน], shape: shapes.pill, name: <uc1>, width: 10em),
    node((1, 2), [สร้างแบบประเมิน], shape: shapes.pill, name: <uc2>, width: 10em),
    node((1, 3), [อนุมัติการลงทะเบียน], shape: shapes.pill, name: <uc3>, width: 10em),
    node((1, 4), [ดูรายงานผล], shape: shapes.pill, name: <uc4>, width: 10em),
    node((1, 5), [ลงทะเบียนเรียน], shape: shapes.pill, name: <uc5>, width: 10em),
    node((1, 6), [ทำแบบทดสอบ], shape: shapes.pill, name: <uc6>, width: 10em),
    node((1, 7), [รับใบเกียรติบัตร], shape: shapes.pill, name: <uc7>, width: 10em),

    // Edges (Associations)
    edge(<hr>, <uc1>, "-"),
    edge(<hr>, <uc2>, "-"),
    edge(<hr>, <uc3>, "-"),
    edge(<hr>, <uc4>, "-"),

    edge(<emp>, <uc4>, "-"),
    edge(<emp>, <uc5>, "-"),
    edge(<emp>, <uc6>, "-"),
    edge(<emp>, <uc7>, "-"),
  )))
) <fig:3-5>


=== คำอธิบายแผนภาพยูสเคส (Use Case Description)

ตารางด้านล่างแสดงรายละเอียดการทำงานปกติ (Normal Flow) ของ Use Case หลักในระบบ My Academy ดัง@tab:3-1 แสดงคำอธิบายยูสเคส: ระบบการประเมินผล (Assessment Management)
#figure(
  caption: [คำอธิบายยูสเคส: ระบบการประเมินผล (Assessment Management)],
  kind: table,
  table(
    columns: (auto, 1fr),
    align: (left + horizon, left),
    table.header([*รายการ*], [*รายละเอียด*]),
    [*ชื่อ Use Case*], [ระบบการประเมินผล (Assessment Management)],
    [*ผู้ใช้งานหลัก*], [HR Admin, Employee],
    [*คำอธิบาย*], [HR Admin สามารถสร้างแบบทดสอบก่อนเรียนและหลังเรียน โดยกำหนดโจทย์ ตัวเลือก และเกณฑ์การผ่าน พนักงานสามารถเข้ามาทำแบบทดสอบและระบบจะคำนวณคะแนนพร้อมแสดงผลทันที],
    [*ขั้นตอนการทำงานปกติ*], [
      1. HR Admin เข้าสู่ระบบและเลือกคอร์สที่ต้องการสร้างแบบทดสอบ
      2. ระบบแสดงหน้าสร้างแบบประเมิน HR Admin กรอกข้อมูลโจทย์และตัวเลือก
      3. ระบบบันทึกแบบประเมินและสถานะพร้อมใช้งาน
      4. Employee เข้าสู่ระบบและเลือกคอร์สที่ลงทะเบียน
      5. Employee ทำแบบทดสอบและกดส่งคำตอบ
      6. ระบบคำนวณคะแนนและแสดงผลลัพธ์
    ],
  ),
) <tab:3-1>

=== แผนภาพกิจกรรม (Activity Diagram)

แผนภาพกิจกรรมด้านล่างแสดงลำดับขั้นตอนการทำงานของระบบ Assessment ตั้งแต่ HR สร้างแบบทดสอบจนถึง Employee ได้รับผลลัพธ์ ดัง@fig:3-6 แสดงแผนภาพกิจกรรม: กระบวนการประเมินผล
#figure(
  caption: [แผนภาพกิจกรรม: กระบวนการประเมินผล],
  rect(stroke: 0.5pt + black, inset: 12pt, text(size: 12pt, diagram(
    node-stroke: 1.2pt,
    edge-stroke: 1pt,
    spacing: (4em, 3em),

    // Start
    node((0, 0), [เริ่มต้น], shape: shapes.circle, width: 3.5em, height: 3.5em),

    // HR Flow
    node((0, 1), [HR: เลือกคอร์ส], shape: rect, width: 10em),
    node((0, 2), [HR: สร้างโจทย์และตัวเลือก], shape: rect, width: 12em),
    node((0, 3), [HR: กำหนดเกณฑ์การผ่าน], shape: rect, width: 12em),
    node((0, 4), [ระบบ: บันทึกแบบประเมิน], shape: rect, width: 12em),

    // Decision
    node((0, 5), rect(stroke: 1.5pt + blue, [เผยแพร่สำเร็จ?]), width: 8.5em, height: 3.5em),

    // Employee Flow
    node((0, 6.5), [Employee: เลือกคอร์สที่ลงทะเบียน], shape: rect, width: 14em),
    node((0, 7.5), [Employee: ทำแบบทดสอบ], shape: rect, width: 12em),
    node((0, 8.5), [Employee: ส่งคำตอบ], shape: rect, width: 10em),
    node((0, 9.5), [ระบบ: คำนวณคะแนน], shape: rect, width: 11em),
    node((0, 10.5), [ระบบ: แสดงผลลัพธ์], shape: rect, width: 11em),

    // End
    node((0, 11.5), [สิ้นสุด], shape: shapes.circle, width: 3.5em, height: 3.5em),

    // Edges
    edge((0, 0), (0, 1), "-|>"),
    edge((0, 1), (0, 2), "-|>"),
    edge((0, 2), (0, 3), "-|>"),
    edge((0, 3), (0, 4), "-|>"),
    edge((0, 4), (0, 5), "-|>"),
    edge((0, 5), (0, 6.5), "-|>", text(10pt)[ใช่]),
    edge((0, 5), (3, 5), "-|>", text(10pt)[ไม่], bend: 0deg),
    edge((3, 5), (3, 2), "-|>"),
    edge((3, 2), (0, 2), "-|>"),
    edge((0, 6.5), (0, 7.5), "-|>"),
    edge((0, 7.5), (0, 8.5), "-|>"),
    edge((0, 8.5), (0, 9.5), "-|>"),
    edge((0, 9.5), (0, 10.5), "-|>"),
    edge((0, 10.5), (0, 11.5), "-|>"),
  )))
) <fig:3-6>


#pagebreak()
=== แผนภาพลำดับกิจกรรม (Sequence Diagram)

แผนภาพลำดับกิจกรรมด้านล่างแสดงลำดับการสื่อสารระหว่างผู้ใช้งาน (Employee) ระบบ Frontend และ Backend ในการทำแบบทดสอบ ดัง@fig:3-7 แสดงแผนภาพลำดับกิจกรรม: กระบวนการ Employee ทำแบบทดสอบ
#figure(
  caption: [แผนภาพลำดับกิจกรรม: กระบวนการ Employee ทำแบบทดสอบ],
  rect(stroke: 0.5pt + black, inset: 10pt, text(size: 10pt, diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    spacing: (5em, 2.5em),

    // Lifelines
    node((0, 0), [Employee], shape: rect, fill: gray.lighten(90%), width: 5em),
    node((1, 0), [Frontend], shape: rect, fill: gray.lighten(90%), width: 5em),
    node((2, 0), [Backend API], shape: rect, fill: gray.lighten(90%), width: 5em),
    node((3, 0), [Database], shape: rect, fill: gray.lighten(90%), width: 5em),

    // Vertical lines
    edge((0, 0.5), (0, 8), stroke: (dash: "dashed")),
    edge((1, 0.5), (1, 8), stroke: (dash: "dashed")),
    edge((2, 0.5), (2, 8), stroke: (dash: "dashed")),
    edge((3, 0.5), (3, 8), stroke: (dash: "dashed")),

    // Messages
    edge((0, 1), (1, 1.5), "-|>", text(8pt)[เลือกคอร์ส]),
    edge((1, 1.5), (2, 2), "-|>", text(8pt)[GET /assessments]),
    edge((2, 2), (3, 2.5), "-|>", text(8pt)[Query]),
    edge((3, 2.5), (2, 3), "-|>", text(8pt)[ข้อมูลแบบทดสอบ]),
    edge((2, 3), (1, 3.5), "-|>", text(8pt)[Response JSON]),
    edge((1, 3.5), (0, 4), "-|>", text(8pt)[แสดงแบบทดสอบ]),

    edge((0, 4.5), (1, 5), "-|>", text(8pt)[ส่งคำตอบ]),
    edge((1, 5), (2, 5.5), "-|>", text(8pt)[POST /submit]),
    edge((2, 5.5), (3, 6), "-|>", text(8pt)[Save & Calculate]),
    edge((3, 6), (2, 6.5), "-|>", text(8pt)[ผลคะแนน]),
    edge((2, 6.5), (1, 7), "-|>", text(8pt)[Response]),
    edge((1, 7), (0, 7.5), "-|>", text(8pt)[แสดงผลลัพธ์]),
  )))
) <fig:3-7>


=== แผนภาพแสดงความสัมพันธ์ของคลาส (Class Diagram)

แผนภาพแสดงความสัมพันธ์ของคลาสด้านล่างแสดงโครงสร้างข้อมูลหลักของระบบ Assessment ใน My Academy ดัง@fig:3-8 แสดงแผนภาพแสดงความสัมพันธ์ของคลาส: ระบบ Assessment
#figure(
  caption: [แผนภาพแสดงความสัมพันธ์ของคลาส: ระบบ Assessment],
  rect(stroke: 0.5pt + black, inset: 10pt, text(size: 8pt, diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    spacing: (4em, 4em),

    // Course
    node((0, 0), rect(
      [
        #text(weight: "bold")[Course]
        #line(length: 100%, stroke: 0.5pt)
        - id: UUID\
        - title: string\
        - description: string\
        - status: enum\
        - poster_url: string
        #line(length: 100%, stroke: 0.5pt)
        + create()\
        + update()\
        + publish()
      ]
    ), width: 9em, name: <course>),

    // Assessment
    node((1.5, 0), rect(
      [
        #text(weight: "bold")[Assessment]
        #line(length: 100%, stroke: 0.5pt)
        - id: UUID\
        - course_id: UUID\
        - type: enum\
        - passing_score: int\
        - time_limit: int
        #line(length: 100%, stroke: 0.5pt)
        + create()\
        + addQuestion()\
        + calculateScore()
      ]
    ), width: 10em, name: <assessment>),

    // Question
    node((3, 0), rect(
      [
        #text(weight: "bold")[Question]
        #line(length: 100%, stroke: 0.5pt)
        - id: UUID\
        - assessment_id: UUID\
        - text: string\
        - order: int
        #line(length: 100%, stroke: 0.5pt)
        + create()\
        + addChoice()
      ]
    ), width: 9em, name: <question>),

    // Choice
    node((3, 1.2), rect(
      [
        #text(weight: "bold")[Choice]
        #line(length: 100%, stroke: 0.5pt)
        - id: UUID\
        - question_id: UUID\
        - text: string\
        - is_correct: boolean
        #line(length: 100%, stroke: 0.5pt)
        + create()\
        + update()
      ]
    ), width: 9em, name: <choice>),

    // Attempt
    node((1.5, 1.2), rect(
      [
        #text(weight: "bold")[AssessmentAttempt]
        #line(length: 100%, stroke: 0.5pt)
        - id: UUID\
        - assessment_id: UUID\
        - employee_id: UUID\
        - score: int\
        - passed: boolean
        #line(length: 100%, stroke: 0.5pt)
        + submit()\
        + getResult()
      ]
    ), width: 10em, name: <attempt>),

    // AttemptAnswer
    node((0, 1.2), rect(
      [
        #text(weight: "bold")[AttemptAnswer]
        #line(length: 100%, stroke: 0.5pt)
        - id: UUID\
        - attempt_id: UUID\
        - question_id: UUID\
        - choice_id: UUID
        #line(length: 100%, stroke: 0.5pt)
        + save()\
        + evaluate()
      ]
    ), width: 10em, name: <answer>),

    // Relationships
    edge(<course>, <assessment>, "<->", label: [1 : N], label-pos: 0.5, label-side: left),
    edge(<assessment>, <question>, "<|-|>", label: [1 : N], label-pos: 0.5, label-side: left),
    edge(<question>, <choice>, "<|-|>", label: [1 : N], label-pos: 0.5, label-side: left),
    edge(<assessment>, <attempt>, "<->", label: [1 : N], label-pos: 0.5, label-side: left),
    edge(<attempt>, <answer>, "<|-|>", label: [1 : N], label-pos: 0.5, label-side: left),
    edge(<question>, <answer>, "..>", label: [ref], label-pos: 0.5, label-side: right),
  )))
) <fig:3-8>


== ขั้นตอนการดำเนินงานและภาพประกอบ (Implementation Details)

#par(first-line-indent: 1cm, justify: true)[
  เพื่อให้เห็นภาพการปฏิบัติงานจริงและผลลัพธ์ที่เกิดขึ้นในแต่ละขั้นตอนของการพัฒนาระบบ My Academy ผู้ปฏิบัติงานได้รวบรวมภาพประกอบและรายละเอียดการนำเครื่องมือต่าง ๆ มาใช้งานจริงตามลำดับขั้นตอน Implement ตั้งแต่การออกแบบโครงร่างเบื้องต้นไปจนถึงการทดสอบขั้นสุดท้าย โดยมีรายละเอียดเชิงลึกของแต่ละส่วนงานดังนี้:
]

=== การออกแบบ Blueprint ด้วยการประยุกต์ใช้แนวคิด A-DAPT Blueprint

เริ่มแรกของการพัฒนาระบบ ทีมงานได้นำแนวคิด A-DAPT Blueprint (ตามที่กล่าวไว้ในบทที่ 2) มาประยุกต์ใช้เป็นกรอบในการออกแบบร่วมกัน โดยใช้แพลตฟอร์ม Miro เป็นศูนย์กลาง (Living Document) ในการจัดวาง Blueprint ของแต่ละฟีเจอร์ซึ่งแบ่งออกเป็น 2 มุมมองหลักตามหลักการ A-DAPT ได้แก่

*Customer Visible Layer* — ขอบเขตที่ผู้ใช้สามารถมองเห็นและมีปฏิสัมพันธ์ได้ประกอบด้วย:
- *Acceptance Test:* ทีมร่วมกันกำหนดเกณฑ์การยอมรับ (Acceptance Criteria) ของแต่ละ Scenario ไว้ล่วงหน้า เพื่อใช้เป็นข้อตกลงร่วมกันว่าฟีเจอร์จะสำเร็จเมื่อไหร่
- *UI (Wireframes):* ออกแบบโครงร่างหน้าจอ (Wireframes) และ User Flow บน Miro เพื่อให้ทุกคนเห็นภาพเส้นทางการใช้งานของผู้ใช้จริง

*Customer Invisible Layer* — ขอบเขตการทำงานเบื้องหลังที่ผู้ใช้มองไม่เห็น ประกอบด้วย:
- *Business Logic:* วิเคราะห์เงื่อนไขและกฎเกณฑ์ทางธุรกิจ โดยระบุ API Endpoints, DTO, Controller, Service และ Repository ที่จำเป็น
- *Database:* ออกแบบ Entity-Relationship Diagram (ERD) และ Schema ของฐานข้อมูลร่วมกัน
- *Support:* ระบุส่วนสนับสนุนอื่นๆ เช่น ระบบ Authentication, การเชื่อมต่อ API ภายนอก หรือระบบคิวงาน (BullMQ)

การจัดวาง Blueprint ในรูปแบบนี้ช่วยให้ทีมใช้ Outside-In Approach — เริ่มมองจากมุมผู้ใช้ก่อน แล้วค่อยลงลึกไปยังโครงสร้างเบื้องหลัง ทำให้สามารถระบุสิ่งที่ต้องพัฒนาได้อย่างครบถ้วนตั้งแต่ขั้นตอนวางแผน ลดปัญหาการสื่อสารที่คลาดเคลื่อน และเป็นแนวทางที่ดีในการสร้างชุดทดสอบล่วงหน้า (Test-First) ก่อนลงมือเขียนโค้ดจริง ดัง@fig:3-9 แสดงตัวอย่างการออกแบบระบบ Assessment บน Miro
#figure(
  image("/images/ch3/example-blueprint-design-on-miro.png", width: 100%),
  caption: [ตัวอย่างการออกแบบระบบ Assessment บน Miro],
) <fig:3-9>

=== การจำลอง API ด้วย Mountebank (Mountebank)

การพัฒนาแบบขนานระหว่าง Frontend และ Backend จำเป็นต้องมีการจำลอง API (Mock Server) เพื่อให้ฝั่ง Frontend สามารถทำงานต่อได้โดยไม่ต้องรอ API จริงเสร็จสมบูรณ์ ทางทีมได้เลือกใช้ Mountebank พร้อมกับใช้กลยุทธ์ Merge JSON Strategy โดยแยกไฟล์ Imposter ตามแต่ละฟังก์ชัน (เช่น auth, employees) แล้วทำกระบวนการอัตโนมัติรวบรวมเป็นไฟล์เดียว เพื่อให้ง่ายต่อการดูแลรักษาและเป็นระเบียบ ดัง@fig:3-11 แสดงโครงสร้างไฟล์ Imposter ที่แยกตามฟังก์ชัน
#figure(
  image("/images/ch3/imposter_structure.png", width: 70%),
  caption: [ภาพแสดงโครงสร้างไฟล์ Imposter ที่แยกตามฟังก์ชัน],
) <fig:3-11>

 ดัง@fig:3-12 แสดงตัวอย่างการจำลอง Response ด้วย Mountebank
#figure(
  image("/images/ch3/mountebank_response.png", width: 100%),
  caption: [ภาพตัวอย่างการจำลอง Response ด้วย Mountebank],
) <fig:3-12>


=== การทดสอบ API ด้วย Bruno (Bruno)

สำหรับทดสอบการตอบสนองของ API ขาต่างๆ อิงโครงสร้างจากโฟลเดอร์ tests/api โซน Backend ในโปรเจ็กต์ ทางทีมเลือกใช้ Bruno โดยใช้แนวคิด DAMP (Descriptive And Meaningful Phrases) over DRY เพื่อให้การทดสอบอ่านง่ายและแสดงเจตนาชัดเจน ควบคู่กับการประยุกต์ใช้ Centralized Data Definition บน collection.bru เพื่อรวมตัวแปรหลัก เช่น Token หรือ User ID ไว้ที่เดียว ช่วยลดความซ้ำซ้อนของการกำหนดค่าตั้งต้นสำหรับการทดสอบแต่ละกรณี ดัง@fig:3-13 แสดงการกำหนด Centralized Data ใน collection.bru
#figure(
  image("/images/ch3/collection_bru.png", width: 80%),
  caption: [ภาพแสดงการกำหนด Centralized Data ใน collection.bru],
) <fig:3-13>

 ดัง@fig:3-14 แสดงการทดสอบ API และการใช้ DAMP Pattern
#figure(
  image("/images/ch3/api_test_damp.png", width: 80%),
  caption: [ภาพการทดสอบ API และการใช้ DAMP Pattern],
) <fig:3-14>


=== การทดสอบหน่วยย่อย (Unit Test)

การเขียน Unit Test ในฝั่ง Backend จะอิงตามโฟลเดอร์ Service ย่อยต่างๆ ภายใน /backend ซึ่งมีการย้ายจาก Jest มาใช้ SWC และ Vitest เพื่อเพิ่มความเร็วในการทดสอบ โดยแนวทางการเขียนเทสต์จะเน้นจำลอง Mock Data อย่างระมัดระวัง และใช้หลักการตั้งชื่อแบบ DAMP (Descriptive And Meaningful Phrases) ให้กรณีทดสอบ (Test Case) ตรงกับเป้าหมายทางธุรกิจที่ต้องการตรวจสอบ เพื่อลดข้อผิดพลาดก่อนที่จะเข้าสู่กระบวนการต่อไป ดัง@fig:3-15 แสดงตัวอย่างการเขียน Unit Test ด้วย Vitest
#figure(
  image("/images/ch3/unit_test_vitest.png", width: 100%),
  caption: [ภาพแสดงตัวอย่างการเขียน Unit Test ด้วย Vitest],
) <fig:3-15>

 ดัง@fig:3-16 แสดงผลลัพธ์การรัน Unit Test ที่ผ่านเกณฑ์
#figure(
  image("/images/ch3/unit_test_results.png", width: 100%),
  caption: [ภาพแสดงผลลัพธ์การรัน Unit Test ที่ผ่านเกณฑ์],
) <fig:3-16>


=== การพัฒนาและโฟกัสที่ระบบการประเมินผล (Full-Stack Assessment Development)

การพัฒนาทั้งในฝั่ง Frontend, Backend และระบบจัดการฐานข้อมูล ทางผู้จัดทำมุ่งเน้นในส่วนระบบการประเมินและทดสอบพนักงาน (Assessment System) เป็นส่วนหลัก ซึ่งรับผิดชอบพัฒนาแบบวงจรสมบูรณ์ (Full-Stack) ท่ามกลางโค้ดเบสรวม โดยยึดหลักตามมาตรฐานคู่มือ (อาทิ copilot-instruction.md และเอกสารสคีมา) รูปแบบโค้ดในโปรเจ็กต์จึงได้รับการรักษาไว้อย่างเป็นระเบียบ ทำให้ง่ายต่อผู้ร่วมพัฒนาคนอื่นในการตีความและสานต่อผลงานได้ไหลลื่น

=== กระบวนการ Deploy และจัดการสภาพแวดล้อม (Deployment Process)

#par(first-line-indent: 1cm, justify: true)[
  การนำส่งซอฟต์แวร์จากสภาพแวดล้อมการพัฒนาไปสู่สภาพแวดล้อมที่ใช้งานจริงเป็นขั้นตอนที่ต้องใช้ความระมัดระวังและความเข้าใจในโครงสร้างระบบโครงข่ายขององค์กร ภายใน #company_name ได้มีการจัดลำดับชั้นของสภาพแวดล้อม (Deployment Tiers) ไว้อย่างชัดเจนเพื่อคัดกรองข้อผิดพลาดและรับประกันความเสถียรของระบบก่อนจะถึงมือผู้ใช้งานจริง โดยมีรายละเอียดและข้อจำกัดที่พบเจอดังนี้:
]

=== การจัดการและอัปเดตเอกสารประกอบการพัฒนา (Documentation Updates)

#par(first-line-indent: 1cm, justify: true)[
  เอกสารประกอบการพัฒนา (Technical Documentation) เปรียบเสมือนแผนที่นำทางที่สำคัญสำหรับทีมพัฒนารุ่นถัดไปและการบำรุงรักษาระบบในระยะยาว ผู้ปฏิบัติงานให้ความสำคัญอย่างยิ่งกับการปรับปรุงข้อมูลในเอกสารให้มีความทันสมัยและสอดคล้องกับพฤติกรรมของโค้ดล่าสุดอยู่เสมอ เพื่อลดปัญหาการสื่อสารที่คลาดเคลื่อนและสร้างความยั่งยืนให้กับระบบ My Academy โดยมีการดำเนินการในส่วนต่าง ๆ ดังนี้:
]
