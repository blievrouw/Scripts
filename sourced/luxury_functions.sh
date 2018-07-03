##### Luxury functions #####

function lah () {
    ls -lah "$@"
}

function cs () {
    cd "$@" && ls
}

# Open Google Chrome
function chrome () {
    open -a "Google Chrome" $1
}

# Open with markdown viewer
function md () {
    open -a "Markoff" $1
}
function rstudio() {
    open -a "RStudio" $1
}

function excel() {
    open -a "Microsoft Excel" $1
}
