-- Build script for citeall
-- l3build install --texmfhome ../texmf

packageversion="0.2"
packagedate="2017/07/03"

module   = "combofont"
ctanpkg  = "combofont"

stdengine    = "luatex"
checkengines = {"luatex"}


-- do all got in doc
typesetfiles      ={"combofont.tex","combofont-test-fira-math.tex"}
demofiles         ={"combofont-test-fira-math.tex"}
docfiles          ={"README.md","combofont.tex"}

installfiles      ={"combofont.sty"}

versionform       ="true"
versionfiles      ={"combofont.tex","combofont.sty","README.md"}

-- packtdszip=true


function setversion_update_line(line, date, version)
       -- No real regex so do it one type at a time
         if string.match
          (
            line,
            "^\\def\\UlrikeFischer@package@version"
          ) 
         then
           line = string.gsub(line, "{[0-9.a-zA-Z]*}", "{" .. packageversion .."}")
         end
         if string.match
          (
            line,
            "^\\def\\UlrikeFischer@package@date"
          ) 
         then
           line = string.gsub(line, "{[0-9/]*}", "{" .. packagedate .."}")
         end
         -- for the README.md
         if string.match
          (
            line,
            "^Packageversion: "
          ) 
         then
           line = string.gsub(line, "{[0-9.a-zA-Z]*}", "{" .. packageversion .."}")
         end
         if string.match
          (
            line,
            "^Packagedate: "
          ) 
         then
           line = string.gsub(line, "{[0-9/]*}", "{" .. packagedate .."}")
         end 
       return line
     end

kpse.set_program_name ("kpsewhich")
if not release_date then
 dofile ( kpse.lookup ("l3build.lua"))
end
