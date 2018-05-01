library(gdata)
library(colorspace)
library(rlang)
library(ash)

## JD: you are missing at least one library!
library(tourr)

# myopia or nearsightedness(colomn 3) whether have some relationship with covariates.
# before do the clustering, we could check whether they have some patterns indeed.
dat2 = read.xls ("myopia.xls", sheet = 1, header = TRUE)
pal <- rainbow_hcl(length(levels(as.factor(dat2$MYOPIC))))
col <- pal[as.numeric(dat2$MYOPIC)+1]
dim(dat2)
animate_xy(dat2[, 6:10], guided_tour(lda_pp(dat2$MYOPIC)), sphere = TRUE, col=col,
           axes = "bottomleft")
##We could tell even though the boundary is not that strict, there is still clusters between.
###
library(aplpack)
a<-faces(dat2[1:20,3:18],face.type = 2)
plot.faces(a)

## JD: Nice pictures, but I don't know what either of them is about; no explanations, axis labels or anything
