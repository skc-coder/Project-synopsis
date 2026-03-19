#import "@preview/touying:0.6.1": *
#import themes.simple: *

#let project-blue = rgb("#000080")

#let progress-bar = {
  context {
    let current = counter(page).at(here()).first()
    let total = counter(page).final().first()
    let ratio = if total > 1 { (current - 1) / (total - 1) } else { 1.0 }
    if current > 1 {
      grid(
        columns: (ratio * 100%, 1fr),
        rect(height: 2pt, fill: project-blue, width: 100%),
        rect(height: 2pt, fill: gray.lighten(80%), width: 100%),
      )
    }
  }
}

#show: simple-theme.with(
  aspect-ratio: "16-9",
  config-colors(primary: black, secondary: gray),
  config-page(header: none), // Removes the theme's default black heading
)

#set page(
  footer: progress-bar,
  margin: (top: 1.2em, bottom: 1.2em, left: 1.5em, right: 1.5em),
)

#set text(size: 18pt)

#let slide-heading(title, url: none) = {
  text(size: 1.4em, weight: "bold", fill: project-blue)[#title]
  if url != none {
    h(0.4em)
    text(size: 0.6em, weight: "regular", fill: project-blue.lighten(20%))[
      (#link(url)[#url])
    ]
  }
  v(0.2em)
  line(length: 100%, stroke: 1pt + project-blue)
  v(0.3em)
}

#empty-slide[
  #set align(center)
  #set text(fill: black)
  
  #v(0.2fr)
  #text(size: 0.9em)[A]
  #linebreak()
  #text(size: 1.4em, weight: "bold")[Presentation]
  #linebreak()
  #text(size: 0.9em)[On]
  #linebreak()
  #text(size: 1.8em, weight: "bold", fill: project-blue)[SOUND FOR SILENCE]
  
  #v(0.3em)
  #text(size: 0.8em)[Submitted to partial fullfillment of requirement for the award of degree of]
  #v(0.2em)
  #text(size: 1.0em, weight: "bold")[BACHELOR OF TECHNOLOGY]
  
  #v(0.3em)
  #text(size: 0.8em, weight: "bold")[IN]
  #linebreak()
  #text(size: 1.0em, weight: "bold")[COMPUTER SCIENCE & ENGINEERING]
  
  #v(0.5fr)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    align: (center + horizon, center + horizon, center + horizon),
    [
      #set align(center)
      #set text(size: 0.75em)
      #text(weight: "bold")[Presented to :]
      #v(0.2em)
      #text(size: 1.1em)[Narendra Narwal]
    ],
    image("college_logo.png", width: 6em),
    [
      #set align(center)
      #set text(size: 0.75em)
      #text(weight: "bold")[Presented By :]
      #v(0.2em)
      Abhishek Verma (22EAOCS005)\
      Shekhar Chaurasiya (22EAOCS047) \
      Sakshi Puria (22EAOCS042)\
    ]
  )
  
  #v(0.5fr)
  #text(weight: "bold", size: 0.9em)[ARYA INSTITUTE OF ENGINEERING TECHNOLOGY & MANAGEMENT, JAIPUR]
  #v(0.2fr)
]

#slide[
  #slide-heading("Introduction")
  
  - This project is about a web and mobile app solution that connects therapists, parents, and kids (the patient).

  - This project is used by therapists to judge auditory listening capabilities and cognitive ability of kids.

  - This provides benefits to all their clients by making the process of therapy easy, making the process paperless and digital.
]

#slide[
  #slide-heading("Technical Specifications")

  #grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    [
      #text(weight: "bold", fill: project-blue)[Hardware Specs]
      #v(0.3em)
      #set text(size: 0.8em)
      - *Processor*: Quad-core 1.8GHz+ (Cortex-A53 or equivalent)
      - *RAM*: 4GB (Mobile), 8GB (Workstation)
      - *Network*: 2 Mbps stable bandwidth (Min)
      - *Storage*: 100MB+ for App Binary
    ],
    [
      #text(weight: "bold", fill: project-blue)[Software Specs]
      #v(0.3em)
      #set text(size: 0.8em)
      - *Mobile*: Android OS 8.0+ (API Level 26+)
      - *Web*: HTML5/CSS3/ES6+ Compliant
      - *Backend*: Firestore (NoSQL), Cloud Auth
      - *Dev Stack*: Kotlin (Compose), Node.js, JS
    ]
  )
]

#slide[
  #slide-heading("Architecture")
  
  #set align(center + horizon)
  #set text(size: 14pt)
  
  #let box-style(fill-color) = (
    fill: fill-color.lighten(80%),
    stroke: 1pt + fill-color,
    inset: 8pt,
    radius: 4pt,
    width: 100%,
  )

  #grid(
    columns: (1fr, 0.2fr, 1fr, 0.2fr, 1fr),
    align: center + horizon,
    column-gutter: 0.5em,
    // Mobile Side
    grid(
      rows: (auto, auto, auto),
      gutter: 1em,
      rect(..box-style(orange))[#text(weight: "bold")[Android App]\ (Kotlin + Compose)],
      rect(..box-style(orange))[#text(weight: "bold")[Learning Content]\ (Videos + Quizzes)],
      rect(..box-style(orange))[#text(weight: "bold")[Parent Dashboard]\ (Progress Tracking)]
    ),
    text(size: 2em)[$arrow.l.r$],
    // Central DB
    rect(fill: project-blue.lighten(90%), stroke: 2pt + project-blue, radius: 50%, inset: 15pt)[
      #text(weight: "bold", fill: project-blue)[Firebase\ Firestore]\ (Real-time DB)
    ],
    text(size: 2em)[$arrow.l.r$],
    // Web Side
    grid(
      rows: (auto, auto, auto),
      gutter: 1em,
      rect(..box-style(blue))[#text(weight: "bold")[Web Dashboard]\ (HTML/CSS/JS)],
      rect(..box-style(blue))[#text(weight: "bold")[Therapist Portal]\ (Patient Management)],
      rect(..box-style(blue))[#text(weight: "bold")[Clinical Metrics]\ (CAP & SIR Assessment)]
    )
  )
]

#let interface-slide(title, sections, images, url: none) = {
  slide(repeat: sections.len(), self => {
    let (uncover, only, alternatives) = utils.methods(self)
    let idx = self.subslide - 1
    
    set align(top)
    slide-heading(title, url: url)
    
    grid(
      columns: (1.3fr, 2.7fr),
      gutter: 1em,
      [
        #v(0.5em)
        #for (i, name) in sections.enumerate() {
          let style = if i == idx { (weight: "bold", fill: black) } else { (weight: "regular", fill: gray.lighten(40%)) }
          text(size: 1.0em, ..style)[- #name]
          linebreak()
          v(0.5em)
        }
      ],
      [
        #set align(center + horizon)
        #box(height: 13.5em, width: 100%)[
          #alternatives(..images.map(img => {
            if type(img) == "string" {
              image(img, height: 100%, width: 100%, fit: "contain")
            } else {
              img
            }
          }))
        ]
      ]
    )
  })
}

#interface-slide(
  "Mobile Application",
  ("Home/Videos", "Quiz", "Performance"),
  (
    image("mobile_home_videos.png", height: 4.0in),
    image("mobile_home_videos.png", height: 4.0in),
    image("mobile_performance.png", height: 4.0in)
  )
)

#interface-slide(
  "Therapist Portal",
  ("Patients List", "Assessment", "Patient History"),
  (
    image("therapist_patients_list.png",),
    image("therapist_assessment.png"),
    image("therapist_history.png",height: 3.5in)
  ),
  url: "https://therapist-sigma.vercel.app/#patients"
)

#interface-slide(
  "Admin Panel",
  ("Dashboard", "User Management", "Permissions", "Many More Features"),
  (
    image("admin_dashboard.png"),
    image("admin_add_therapist.png", height: 3.5in),
    image("admin_permissions.png"),
    [
      #set align(left + top)
      #v(0.3em)
      #text(size: 1.0em)[
        - Manage & Upload Videos \
        - Create & Edit Quizzes \
        - Manage Therapists & Parents \
        - Assign Patients to Therapists \
        - Detailed System Logs
      ]
    ]
  ),
  url: "https://adminpanel-nine-theta.vercel.app/login.html"
)

#empty-slide[
  #set align(center + horizon)
  #text(size: 2.5em, weight: "bold", fill: project-blue)[Thank You!]
  
  #v(1em)
  #text(size: 1.3em)[Questions?]
]
