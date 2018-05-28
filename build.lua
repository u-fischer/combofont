-- Build script for citeall
-- l3build install --texmfhome ../texmf

packageversion= "0.2R" -- "0.2"
packagedate="2018/05/28"

module   = "combofont"
ctanpkg  = "combofont"

stdengine    = "luatex"
checkengines = {"luatex"}

typesetexe   = "lualatex"


-- do all got in doc
typesetfiles      ={"combofont.tex","combofont-test-fira-math.tex"}
demofiles         ={"combofont-test-fira-math.tex"}
docfiles          ={"README.md","combofont.tex"}
textfiles         = {"*.md"}

sourcefiles       = {"combofont.sty"}
installfiles      = {"combofont.sty"}

versionform       ="true"
versionfiles      ={"combofont.tex","combofont.sty","README.md"}

tagfiles = {"combofont.sty","Readme.md"}

-- packtdszip=true
function update_tag (file , content , tagname , tagdate )
  if string.match (file , "%.sty$") then
   return string.gsub ( content ,
   "\n\\def\\UlrikeFischer@package@combofont@date{%d%d%d%d/%d%d/%d%d}\\def\\UlrikeFischer@package@combofont@version{%w+%.%w+}\n",
   "\n\\def\\UlrikeFischer@package@combofont@date{"..packagedate.."}\\def\\UlrikeFischer@package@combofont@version{"..packageversion.."}\n"
    )
  elseif string.match (file , "%.md$") then
   return string.gsub ( content ,
    "\nVersion %w+%.%w+%s+%d%d%d%d/%d%d/%d%d",
    "\nVersion " .. packageversion .. " " .. packagedate)
  end
  return content
 end



kpse.set_program_name ("kpsewhich")
if not release_date then
 dofile ( kpse.lookup ("l3build.lua"))
end
