rm(list=ls())

install.packages("igraph","network")

library(igraph)
	library(network) 	#using network to get the data object
	data(flo)			# florence data

gflo <- graph_from_adjacency_matrix(flo)

plot(gflo)


names <- names(V(gflo))
# Create colors for names

name.colors <- rep("purple",16)
name.colors[2] <- "black"		# Albizi
name.colors[9] <- "red"			# Medici
name.colors[10] <- "blue"		# Pazzi
name.colors[15] <- "gold2"		# Strozzi

name.colors.2 <- rep("purple",16)
name.colors.2[c(2,9,10,15)] <- "black"





# centrality measures
deg <- degree(gflo)
betw <- betweenness(gflo)
ev <- evcent(gflo)$vector
clos <- closeness(gflo)


bet.names <- names[order(betw)]
#pdf("Between.pdf",width=5,height=5)
par(mai=c(1,2,1,1))
barplot(sort(betw), horiz=T, names.arg=bet.names, las=1, main="Betweenness Centrality for Florentine Families",col=name.colors[order(betw)])

deg.names <- names[order(deg)]
par(mai=c(1,2,1,1))
barplot(sort(deg), horiz=T, names.arg=deg.names, las=1, main="Degree Centrality for Florentine Families", col= name.colors[order(deg)])


ev.names <- names[order(ev)]
par(mai=c(1,2,1,1))
barplot(sort(ev), horiz=T, names.arg=ev.names, las=1, main="Eigenvector Centrality for Florentine Families", col= name.colors[order(ev)])



close.names <- names[order(clos)]
par(mai=c(1,2,1,1))
barplot(sort(clos), horiz=T, names.arg=close.names, las=1, main="Closeness for Florentine Families", col= name.colors[order(clos)])



g.layout <- layout_as_star(gflo)
g.layout <- layout_as_tree(gflo)
g.layout <- layout_with_fr(gflo)

plot(gflo, layout=g.layout,
vertex.label.family="sans",vertex.label.font=2,vertex.label.cex=1, label.color=1, vertex.size=6, vertex.color= name.colors, vertex.frame.color= name.colors, vertex.label.dist=2, edge.arrow.mode=0, edge.width=2, edge.color="green4", vertex.label.color=name.colors.2)



