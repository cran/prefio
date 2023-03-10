% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preflib.R
\name{read_preflib}
\alias{read_preflib}
\title{Read Ordinal Preference Data From PrefLib}
\usage{
read_preflib(
  file,
  from_preflib = FALSE,
  preflib_url = "https://www.preflib.org/static/data"
)
}
\arguments{
\item{file}{A preferential data file, conventionally with extension \code{.soc},
\code{.soi}, \code{.toc} or \code{.toi} according to data type.}

\item{from_preflib}{A logical which, when \code{TRUE} will attempt to source
the file from PrefLib by adding the database \code{HTTP} prefix.}

\item{preflib_url}{The URL which will be preprended to \code{file}, if
\code{from_preflib} is \code{TRUE}.}
}
\value{
An \code{\link[=aggregate.preferences]{aggregated_preferences}} object
containing the PrefLib data.
}
\description{
Read orderings from \code{.soc}, \code{.soi}, \code{.toc} or \code{.toi} files storing
ordinal preference data format as defined by
\href{https://www.preflib.org/}{\{PrefLib\}: A Library for Preferences}
into a \code{preferences} object.
}
\details{
Note that PrefLib refers to the items being ordered by "alternatives".

The file types supported are
\describe{
\item{.soc}{Strict Orders - Complete List}
\item{.soi}{Strict Orders - Incomplete List}
\item{.toc}{Orders with Ties - Complete List}
\item{.toi}{Orders with Ties - Incomplete List}
}

The numerically coded orderings and their frequencies are read into a
data frame, storing the item names as an attribute. The
\code{as.aggregated_preferences} method converts these to an
\code{\link[=aggregate.preferences]{aggregated_preferences}} object with the
items labelled by name.

A PrefLib file may be corrupt, in the sense that the ordered alternatives do
not match their names. In this case, the file can be read in as a data
frame (with a warning), but \code{as.aggregated_preferences} will throw an error.
}
\note{
The Netflix and cities datasets used in the examples are from
Caragiannis et al (2017) and Bennet and Lanning (2007) respectively. These
data sets require a citation for re-use.
}
\examples{

# Can take a little while depending on speed of internet connection

\donttest{
# strict complete orderings of four films on Netflix
netflix <- read_preflib("netflix/00004-00000138.soc", from_preflib = TRUE)
head(netflix)
names(netflix$preferences)

# strict incomplete orderings of 6 random cities from 36 in total
cities <- read_preflib("cities/00034-00000001.soi", from_preflib = TRUE)
}
}
\references{
Mattei, N. and Walsh, T. (2013) PrefLib: A Library of Preference Data.
\emph{Proceedings of Third International Conference on Algorithmic Decision
Theory (ADT 2013)}. Lecture Notes in Artificial Intelligence, Springer.

Bennett, J. and Lanning, S. (2007) The Netflix Prize.
\emph{Proceedings of The KDD Cup and Workshops}.
}
