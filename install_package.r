
install.cran.or.bioconductor <- function (repo, packages) {

    if (repo=='cran') {
        options(repos = "http://cran.r-project.org")
        install.fun <- function(pkg){install.packages(pkg)}
    }
    else if (repo=='bioconductor') {
        source("https://bioconductor.org/biocLite.R")
        install.fun <- function(pkg){biocLite(pkg,ask=FALSE)}
    } else {
        stop("repo must be cran or bioconductor")
    }

    vapply(packages, function(package){
            warning(package)
            if (!require(package,character.only = T)) {
                print(paste0("Installing package ",package))
                install.fun(package)
                return(1)
            }
            else{
                return(0)
            }
        }, c(0))

    #for (package in packages) {
        ## character.only indicate whether the string is a variable or not
        #if (!require(package,character.only = T)) {
            #print(paste0("Installing package ",package))
            #install.fun(package)
        #}
    #}
}

#install.packages(pkgs = c("ggplot2","dplyr"))
cran.packages=c("ggplot2","dplyr","XML",'rmarkdown')
install.cran.or.bioconductor("cran",cran.packages)

# install bioconductor package
bio.packages=c("Biostrings", 'GenomicRanges','Rsamtools','GenomicFeatures','edgeR','DESeq2','genefilter')
install.cran.or.bioconductor("bioconductor",bio.packages)

