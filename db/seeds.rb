
# Sections
home       = Section.create({ :path => 'home',       :title => 'Home',       :order => 1, :show_in_nav => false })
the_basics = Section.create({ :path => 'the-basics', :title => 'The Basics', :order => 2 })
style      = Section.create({ :path => 'style',      :title => 'Style',      :order => 3 })
structure  = Section.create({ :path => 'structure',  :title => 'Structure',  :order => 4 })
modules    = Section.create({ :path => 'modules',    :title => 'Modules',    :order => 5 })
examples   = Section.create({ :path => 'examples',   :title => 'Examples',   :order => 6, :show_in_nav => false })

# Pages for "The Basics"
basics_about = the_basics.pages.create({ :path => 'about', :title => 'About',                   :order => 1 })
basics_brand = the_basics.pages.create({ :path => 'brand', :title => 'Brand & Logo Guidelines', :order => 2 })

# Pages for "Style"
style_typography = style.pages.create({ :path => 'typography', :title => 'Typography', :order => 1 })
style_colour     = style.pages.create({ :path => 'colour',     :title => 'Colour',     :order => 2 })
style_icons      = style.pages.create({ :path => 'icons',      :title => 'Icons',      :order => 3 })

# Pages for "Structure"
structure_grid   = structure.pages.create({ :path => 'grid',   :title => 'Layout Grid', :order => 1 })
structure_layout = structure.pages.create({ :path => 'layout', :title => 'Page Layout', :order => 2 })
structure_hero   = structure.pages.create({ :path => 'hero',   :title => 'Hero Blocks', :order => 3 })
structure_nav    = structure.pages.create({ :path => 'nav',    :title => 'Navigation',  :order => 4 })

# Pages for "Modules"
modules_forms    = modules.pages.create({ :path => 'forms',    :title => 'Forms',             :order => 1 })
modules_cards    = modules.pages.create({ :path => 'cards',    :title => 'Cards',             :order => 2 })
modules_listings = modules.pages.create({ :path => 'listings', :title => 'Listings & Tables', :order => 3 })
modules_alerts   = modules.pages.create({ :path => 'alerts',   :title => 'Alerts',            :order => 4 })
modules_buttons  = modules.pages.create({ :path => 'buttons',  :title => 'Buttons',           :order => 5 })

# Pages for "Example Pages"
examples.pages.create({ :path => 'menu', :title => 'Menu', :example_page => true, :back_page_id => structure_layout.id, :order => 1 })
