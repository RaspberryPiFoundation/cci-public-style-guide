Section.create!([
  { path: "home",          title: "Home",          order: 10,  show_in_nav: false },
  { path: "the-basics",    title: "The Basics",    order: 20,  show_in_nav: true  },
  { path: "layout",        title: "Layout",        order: 30,  show_in_nav: true  },
  { path: "styles",        title: "Styles",        order: 40,  show_in_nav: true  },
  { path: "modules",       title: "Modules",       order: 50,  show_in_nav: true  },
  { path: "example-pages", title: "Example Pages", order: 100, show_in_nav: false }
])

Page.create!([
  { path: "brand-guidelines",     title: "Brand Guidelines",      order: 10,  section_id: 2, show_in_nav: true, example_page: false },
  { path: "colour-palette",       title: "Colour Palette",        order: 20,  section_id: 2, show_in_nav: true, example_page: false },

  { path: "grid-system",          title: "Grid System",           order: 10,  section_id: 3, show_in_nav: true, example_page: false },
  { path: "page-skeleton",        title: "Page Skeleton",         order: 20,  section_id: 3, show_in_nav: true, example_page: false },
  { path: "example-pages",        title: "Example Pages",         order: 30,  section_id: 3, show_in_nav: true, example_page: false },

  { path: "code-club-logo",       title: "Code Club Logo",        order: 10,  section_id: 4, show_in_nav: true, example_page: false },
  { path: "typography",           title: "Typography",            order: 20,  section_id: 4, show_in_nav: true, example_page: false },
  { path: "page-blocks",          title: "Page Blocks",           order: 30,  section_id: 4, show_in_nav: true, example_page: false },
  { path: "content-panels",       title: "Content Panels",        order: 40,  section_id: 4, show_in_nav: true, example_page: false },
  { path: "icons",                title: "Icons",                 order: 50,  section_id: 4, show_in_nav: true, example_page: false },
  { path: "buttons",              title: "Buttons",               order: 60,  section_id: 4, show_in_nav: true, example_page: false },
  { path: "forms",                title: "Forms",                 order: 70,  section_id: 4, show_in_nav: true, example_page: false },
  { path: "lists",                title: "Lists",                 order: 80,  section_id: 4, show_in_nav: true, example_page: false },
  { path: "pagination",           title: "Pagination",            order: 90,  section_id: 4, show_in_nav: true, example_page: false },
  { path: "tables",               title: "Tables",                order: 100, section_id: 4, show_in_nav: true, example_page: false },
  { path: "alerts",               title: "Alerts",                order: 110, section_id: 4, show_in_nav: true, example_page: false },
  { path: "info-panels",          title: "Info Panels",           order: 120, section_id: 4, show_in_nav: true, example_page: false },
  { path: "badges",               title: "Badges",                order: 130, section_id: 4, show_in_nav: true, example_page: false },
  { path: "cards",                title: "Cards",                 order: 140, section_id: 4, show_in_nav: true, example_page: false },
  #{ path: "utilities",            title: "Utilities",             order: 160, section_id: 4, show_in_nav: true, example_page: false },

  { path: "main-navigation",      title: "Main Navigation",       order: 10,  section_id: 5, show_in_nav: true, example_page: false },
  { path: "secondary-navigation", title: "Secondary Navigation",  order: 20,  section_id: 5, show_in_nav: true, example_page: false },
  { path: "hero-blocks",          title: "Hero Blocks",           order: 30,  section_id: 5, show_in_nav: true, example_page: false },
  { path: "club-list",            title: "Club List",             order: 40,  section_id: 5, show_in_nav: true, example_page: false },
  { path: "footer",               title: "Footer",                order: 60,  section_id: 5, show_in_nav: true, example_page: false },

  { path: "stacked-content",      title: "Stacked Content",       order: 10,  section_id: 6, show_in_nav: true, example_page: true  },
  { path: "column-content",       title: "Column Content",        order: 20,  section_id: 6, show_in_nav: true, example_page: true  },
  { path: "grid-demo",            title: "Grid Demo",             order: 30,  section_id: 6, show_in_nav: true, example_page: true  }
])
