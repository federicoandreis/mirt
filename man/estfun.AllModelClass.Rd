% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/estfun.R
\name{estfun.AllModelClass}
\alias{estfun.AllModelClass}
\title{Extract Empirical Estimating Functions}
\usage{
estfun.AllModelClass(object)
}
\arguments{
\item{object}{a fitted model object of class \code{SingleGroupClass} or
\code{MultipleGroupClass}}
}
\value{
An n x k matrix corresponding to n observations and k parameters
}
\description{
A function for extracting the empirical estimating functions of a fitted
\code{\link{mirt}}, \code{\link{multipleGroup}} or \code{\link{bfactor}}
model. This is the derivative of the log-likelihood with respect to the
parameter vector, evaluated at the observed (case-wise) data. In other
words, this function returns the case-wise scores, evaluated at the fitted
model parameters. Currently, models fitted via the \code{EM} or \code{BL}
method are supported. For the computations, the internal \code{Theta} grid of
the model is being used which was already used during the estimation of
the model itself along with its matching normalized density.
}
\examples{

\dontrun{
mod1 <- mirt(expand.table(LSAT7), 1, SE = TRUE, SE.type = "crossprod")
(sc1 <- estfun.AllModelClass(mod1))
colSums(sc1)
vc1 <- vcov(mod1)
all.equal(crossprod(sc1), chol2inv(chol(vc1)), check.attributes = FALSE)

group <- rep(c("G1", "G2"), 500)
mod2 <- multipleGroup(expand.table(LSAT7), 1, group, SE = TRUE,
  SE.type = "crossprod")
(sc2 <- estfun.AllModelClass(mod2))
colSums(sc2)
vc2 <- vcov(mod2)
all.equal(crossprod(sc2), chol2inv(chol(vc2)), check.attributes = FALSE)

}
}
\seealso{
\code{\link{mirt}}, \code{\link{multipleGroup}},
  \code{\link{bfactor}}
}
\author{
Lennart Schneider \email{lennart.sch@web.de}
}
\keyword{scores}
