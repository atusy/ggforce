% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sina.R
\name{geom_sina}
\alias{geom_sina}
\alias{stat_sina}
\title{Sina plot}
\usage{
stat_sina(mapping = NULL, data = NULL, geom = "sina",
  position = "dodge", scale = "area", method = "density",
  bw = "nrd0", kernel = "gaussian", maxwidth = NULL, adjust = 1,
  bin_limit = 1, binwidth = NULL, bins = NULL, seed = NA, ...,
  na.rm = FALSE, show.legend = NA, inherit.aes = TRUE)

geom_sina(mapping = NULL, data = NULL, stat = "sina",
  position = "dodge", ..., na.rm = FALSE, show.legend = NA,
  inherit.aes = TRUE)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[=aes]{aes()}} or
\code{\link[=aes_]{aes_()}}. If specified and \code{inherit.aes = TRUE} (the
default), it is combined with the default mapping at the top level of the
plot. You must supply \code{mapping} if there is no plot mapping.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{\link[=ggplot]{ggplot()}}.

A \code{data.frame}, or other object, will override the plot
data. All objects will be fortified to produce a data frame. See
\code{\link[=fortify]{fortify()}} for which variables will be created.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame}, and
will be used as the layer data. A \code{function} can be created
from a \code{formula} (e.g. \code{~ head(.x, 10)}).}

\item{geom}{The geometric object to use display the data}

\item{position}{Position adjustment, either as a string, or the result of
a call to a position adjustment function.}

\item{scale}{How should each sina be scaled. Corresponds to the \code{scale}
parameter in \code{\link[ggplot2:geom_violin]{ggplot2::geom_violin()}}? Available are:
\itemize{
\item \code{'area'} for scaling by the largest density/bin among the different sinas
\item \code{'count'} as above, but in addition scales by the maximum number of points
in the different sinas.
\item \code{'width'} Only scale according to the \code{maxwidth} parameter
}

For backwards compatibility it can also be a logical with \code{TRUE} meaning
\code{area} and \code{FALSE} meaning \code{width}}

\item{method}{Choose the method to spread the samples within the same
bin along the x-axis. Available methods: "density", "counts" (can be
abbreviated, e.g. "d"). See \code{Details}.}

\item{bw}{the smoothing bandwidth to be used.  The kernels are scaled
    such that this is the standard deviation of the smoothing kernel.
    (Note this differs from the reference books cited below, and from S-PLUS.)

    \code{bw} can also be a character string giving a rule to choose the
    bandwidth.  See \code{\link{bw.nrd}}. \cr The default,
    \code{"nrd0"}, has remained the default for historical and
    compatibility reasons, rather than as a general recommendation,
    where e.g., \code{"SJ"} would rather fit, see also Venables and
    Ripley (2002).

    The specified (or computed) value of \code{bw} is multiplied by
    \code{adjust}.
  }

\item{kernel}{a character string giving the smoothing kernel
    to be used. This must partially match one of \code{"gaussian"},
    \code{"rectangular"}, \code{"triangular"}, \code{"epanechnikov"},
    \code{"biweight"}, \code{"cosine"} or \code{"optcosine"}, with default
    \code{"gaussian"}, and may be abbreviated to a unique prefix (single
    letter).

    \code{"cosine"} is smoother than \code{"optcosine"}, which is the
    usual \sQuote{cosine} kernel in the literature and almost MSE-efficient.
    However, \code{"cosine"} is the version used by S.
  }

\item{maxwidth}{Control the maximum width the points can spread into. Values
between 0 and 1.}

\item{adjust}{the bandwidth used is actually \code{adjust*bw}.
    This makes it easy to specify values like \sQuote{half the default}
    bandwidth.}

\item{bin_limit}{If the samples within the same y-axis bin are more
than \code{bin_limit}, the samples's X coordinates will be adjusted.}

\item{binwidth}{The width of the bins. The default is to use \code{bins}
bins that cover the range of the data. You should always override
this value, exploring multiple widths to find the best to illustrate the
stories in your data.}

\item{bins}{Number of bins. Overridden by binwidth. Defaults to 50.}

\item{seed}{A seed to set for the jitter to ensure a reproducible plot}

\item{...}{Other arguments passed on to \code{\link[=layer]{layer()}}. These are
often aesthetics, used to set an aesthetic to a fixed value, like
\code{colour = "red"} or \code{size = 3}. They may also be parameters
to the paired geom/stat.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link[=borders]{borders()}}.}

\item{stat}{The statistical transformation to use on the data for this
layer, as a string.}
}
\description{
The sina plot is a data visualization chart suitable for plotting any single
variable in a multiclass dataset. It is an enhanced jitter strip chart,
where the width of the jitter is controlled by the density distribution of
the data within each class.
}
\details{
There are two available ways to define the x-axis borders for the
samples to spread within:
\itemize{
\item{\code{method == "density"}

A density kernel is estimated along the y-axis for every sample group, and
the samples are spread within that curve. In effect this means that points
will be positioned randomly within a violin plot with the same parameters.
}
\item{\code{method == "counts"}:

The borders are defined by the number of samples that occupy the same bin.

}
}
}
\section{Aesthetics}{

geom_sina understand the following aesthetics (required aesthetics are in
bold):
\itemize{
\item \strong{x}
\item \strong{y}
\item color
\item group
\item size
\item alpha
}
}

\section{Computed variables}{


\describe{
\item{density}{The density or sample counts per bin for each point}
\item{scaled}{\code{density} scaled by the maximum density in each group}
\item{n}{The number of points in the group the point belong to}
}
}

\examples{
ggplot(midwest, aes(state, area)) + geom_point()

# Boxplot and Violin plots convey information on the distribution but not the
# number of samples, while Jitter does the opposite.
ggplot(midwest, aes(state, area)) +
  geom_violin()

ggplot(midwest, aes(state, area)) +
  geom_jitter()

# Sina does both!
ggplot(midwest, aes(state, area)) +
  geom_violin() +
  geom_sina()

p <- ggplot(midwest, aes(state, popdensity)) +
  scale_y_log10()

p + geom_sina()

# Colour the points based on the data set's columns
p + geom_sina(aes(colour = inmetro))

# Or any other way
cols <- midwest$popdensity > 10000
p + geom_sina(colour = cols + 1L)

# Sina plots with continuous x:
ggplot(midwest, aes(cut_width(area, 0.02), popdensity)) +
  geom_sina() +
  scale_y_log10()


### Sample gaussian distributions
# Unimodal
a <- rnorm(500, 6, 1)
b <- rnorm(400, 5, 1.5)

# Bimodal
c <- c(rnorm(200, 3, .7), rnorm(50, 7, 0.4))

# Trimodal
d <- c(rnorm(200, 2, 0.7), rnorm(300, 5.5, 0.4), rnorm(100, 8, 0.4))

df <- data.frame(
  'Distribution' = c(
    rep('Unimodal 1', length(a)),
    rep('Unimodal 2', length(b)),
    rep('Bimodal', length(c)),
    rep('Trimodal', length(d))
  ),
  'Value' = c(a, b, c, d)
)

# Reorder levels
df$Distribution <- factor(
  df$Distribution,
  levels(df$Distribution)[c(3, 4, 1, 2)]
)

p <- ggplot(df, aes(Distribution, Value))
p + geom_boxplot()
p + geom_violin() +
  geom_sina()

# By default, Sina plot scales the width of the class according to the width
# of the class with the highest density. Turn group-wise scaling off with:
p +
  geom_violin() +
  geom_sina(scale = FALSE)
}
\author{
Nikos Sidiropoulos, Claus Wilke, and Thomas Lin Pedersen
}
