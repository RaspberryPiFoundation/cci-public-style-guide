
# Sections
home       = Section.create({ :path => 'home',       :title => 'Home',       :order => 1, :show_in_nav => false })
the_basics = Section.create({ :path => 'the-basics', :title => 'The Basics', :order => 2 })
style      = Section.create({ :path => 'style',      :title => 'Style',      :order => 3 })
structure  = Section.create({ :path => 'structure',  :title => 'Structure',  :order => 4 })
modules    = Section.create({ :path => 'modules',    :title => 'Modules',    :order => 5 })

# Pages for "The Basics"
the_basics.pages.create({ :path => 'about', :title => 'About',                   :order => 1 })
the_basics.pages.create({ :path => 'brand', :title => 'Brand & Logo Guidelines', :order => 2 })

# Pages for "Style"
style.pages.create({ :path => 'typography', :title => 'Typography', :order => 1 })
style.pages.create({ :path => 'colour',     :title => 'Colour',     :order => 2 })
style.pages.create({ :path => 'icons',      :title => 'Icons',      :order => 3 })

# Pages for "Structure"
structure.pages.create({ :path => 'grid',   :title => 'Layout Grid', :order => 1 })
structure.pages.create({ :path => 'layout', :title => 'Page Layout', :order => 2 })
structure.pages.create({ :path => 'hero',   :title => 'Hero Blocks', :order => 3 })
structure.pages.create({ :path => 'nav',    :title => 'Navigation',  :order => 4 })

# Pages for "Modules"
modules.pages.create({ :path => 'forms',    :title => 'Forms',             :order => 1 })
modules.pages.create({ :path => 'cards',    :title => 'Cards',             :order => 2 })
modules.pages.create({ :path => 'listings', :title => 'Listings & Tables', :order => 3 })
modules.pages.create({ :path => 'alerts',   :title => 'Alerts',            :order => 4 })
modules.pages.create({ :path => 'buttons',  :title => 'Buttons',           :order => 5 })
