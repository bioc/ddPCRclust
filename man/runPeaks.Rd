% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ddPCR.R
\name{runPeaks}
\alias{runPeaks}
\title{Find the clusters using flowPeaks}
\usage{
runPeaks(file, sensitivity = 1, numOfMarkers)
}
\arguments{
\item{file}{The input data. More specifically, a data frame with two dimensions, each dimension representing the intensity for one color.}

\item{sensitivity}{An integer between 0.1 and 2 determining sensitivity of the initial clustering, e.g. the number of clusters. A higher value means more clusters are being found. Standard is 1.}

\item{numOfMarkers}{The number of primary clusters that are expected according the experiment set up.}
}
\value{
\item{data}{The original input data minus the removed events (for plotting)}
\item{counts}{The droplet count for each cluster.}
\item{firstClusters}{The position of the primary clusters.}
\item{partition}{The cluster numbers as a CLUE partition (see CLUE package for more information).}
}
\description{
Find the rain and assign it based on the distance to vector lines connecting the cluster centres.
}
\examples{
file <- read.csv("example.csv")
data_dir <- system.file("extdata", package = "flowDensity")
load(list.files(pattern = 'sampleFCS_1', data_dir, full = TRUE)) # load f to copy over later so we have an FCS file to use flowDensity
f@exprs <- as.matrix(file)
peaksResult <- runPeaks(file, f, 1, 4)
plot(peaksResult$data, pch=19,cex=0.2, col= ColoursUsed[peaksResult$clusters])
}