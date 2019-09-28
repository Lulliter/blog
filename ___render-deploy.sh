#==================================RESOURCES ON HUGO-RMARKDOWN_SITE=====================================#
#   https://bookdown.org/yihui/rmarkdown/rmarkdown-site.html
#   https://rmarkdown.rstudio.com/lesson-13.html
#   https://gohugo.io/hosting-and-deployment/hosting-on-github/  (but needs git sub-module/  2 repos)
# check version Hugo To find your current version, look in themes/academic/data/academic.toml.
# Breaking changes https://sourcethemes.com/academic/updates/v3.0.0/
#==================================================================================================#


#=========================================== (Render site Locally) ================================================#
#=====  Go To Root ./ folder
cd ./

#=====  (Clean Everiting *INSIDE* ./public)
setopt rmstarsilent # prevent from asking me permission
rm -rf  docs/*
unsetopt rmstarsilent

########################################################
# MODO 1) HUGO command line to build site
# https://gohugo.io/commands/hugo/ (documentation)
########################################################
# hugo
# hugo -t hugo-academic # does't work
# hugo -v # verbose DOESN'T WORK NEED TO USE ADDIN:servesite
# hugo server -D  # see the preview of the site


########################################################
# MODO 2) BLOGDOWN from  command line to build site
########################################################
# ===== Build local
# R -e 'blogdown:::serve_site()' # install to default location.
# ====== Building the public site
# R -e 'blogdown:::build_site()' # install to default location.

#=========================================== (Push to Github repo) ================================================#

# check status
git status

# Add ALL changes to git Index.
git add project/*
git add -A
git add -u

# Create Std commit "message"....
msg="rebuilt on `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# ... Commit Those changes.
git commit -m "$msg"

		# git commit -m "Green card"
		# git commit -m "about"

# Push source and build repos.
git push origin master


#=========================================== (check to ./docs) ================================================#
########################################################
cd ./docs

# Go To (git) ./sub-folder (one below the Rproj wdir)
#	cd ./MexicoWaterSurvey
	ls

