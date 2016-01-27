Section.create!([
  { path: "home",       title: "Home",       order: 10,  show_in_nav: false },
  { path: "the-basics", title: "The Basics", order: 20,  show_in_nav: true  },
  { path: "layout",     title: "Layout",     order: 30,  show_in_nav: true  },
  { path: "styles",     title: "Styles",     order: 40,  show_in_nav: true  },
  { path: "modules",    title: "Modules",    order: 50,  show_in_nav: true  },
  { path: "examples",   title: "Examples",   order: 100, show_in_nav: false }
])

Page.create!([
  { path: "brand-guidelines", title: "Brand Guidelines", order: 10,  section_id: 2, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "colour-palette",   title: "Colour Palette",   order: 20,  section_id: 2, show_in_nav: true, example_page: false, back_page_id: nil },

  { path: "grid-system",      title: "Grid System",      order: 10,  section_id: 3, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "page-skeleton",    title: "Page Skeleton",    order: 20,  section_id: 3, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "sample-pages",     title: "Sample Pages",     order: 30,  section_id: 3, show_in_nav: true, example_page: false, back_page_id: nil },

  { path: "code-club-logo",   title: "Code Club Logo",   order: 10,  section_id: 4, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "typography",       title: "Typography",       order: 20,  section_id: 4, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "page-blocks",      title: "Page Blocks",      order: 30,  section_id: 4, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "content-panels",   title: "Content Panels",   order: 40,  section_id: 4, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "icons",            title: "Icons",            order: 50,  section_id: 4, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "buttons",          title: "Buttons",          order: 60,  section_id: 4, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "forms",            title: "Forms",            order: 70,  section_id: 4, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "lists",            title: "Lists",            order: 80,  section_id: 4, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "tables",           title: "Tables",           order: 90,  section_id: 4, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "alerts",           title: "Alerts",           order: 100, section_id: 4, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "badges",           title: "Badges",           order: 110, section_id: 4, show_in_nav: true, example_page: false, back_page_id: nil },

  { path: "navigation",       title: "Navigation",       order: 10,  section_id: 5, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "hero-blocks",      title: "Hero Blocks",      order: 20,  section_id: 5, show_in_nav: true, example_page: false, back_page_id: nil },
  { path: "cards",            title: "Cards",            order: 30,  section_id: 5, show_in_nav: true, example_page: false, back_page_id: nil },

  { path: "menu",             title: "Menu",             order: 10,  section_id: 6, show_in_nav: true, example_page: true,  back_page_id: 7   }
])
